<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Http\Transformers\ContractsTransformer;
use App\Http\Transformers\SelectlistTransformer;
use Illuminate\Http\Request;
use App\Models\Contract;
use App\Models\Store;
use App\Models\Department;
/**
 * @version    v1.0
 * @author [Thinh.NP] 
 */
class ContractsController extends Controller
{   
    public function index(Request $request)
    {      

        $this->authorize('view', Contract::class);
        $contract = Contract::select(
            'contracts.*'
            )->with('company', 'store');
        if($request->has('department')) {
            $contract = $contract
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"') )
            ->whereIn('contracts.object_id', 
                Department::select('departments.id')
                ->where('departments.id','=',$request->input('department'))
            );
        } else {
            if ($request->has('store') ) {
                    $contract = $contract
                    ->orWhere('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"') )
                    ->whereIn('contracts.object_id', 
                        Department::select('departments.id')
                        ->join('stores','stores.id', '=', 'departments.store_id')
                        ->where('stores.id','=',$request->input('store'))
                    )
                    ->union(
                        Contract::select('contracts.*')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                        ->where('contracts.object_id', '=', $request->input('store'))
                    );
                }
            else if($request->input('company')) {
                $contract = $contract
                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"') )
                ->whereIn('contracts.object_id', 
                    Department::select('departments.id')
                    ->join('stores','stores.id', '=', 'departments.store_id')
                    ->join('companies','companies.id', '=', 'stores.company_id')
                    ->where('companies.id','=',$request->input('company'))
                )
                ->union(
                    Contract::select('contracts.*')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                    ->whereIn('contracts.object_id', 
                        Store::select('stores.id')
                        ->join('companies','companies.id', '=', 'stores.company_id')
                        ->where('companies.id','=',$request->input('company'))
                    )
                )
                ->union(
                    Contract::select('contracts.*')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                    ->where('contracts.object_id', '=', $request->input('company'))
                );
            }
        }
        
        if ($request->has('search')) {
            $contract = $contract->TextSearch($request->input('search'));
        }
        $allowed_columns = ['location','store', 'user', 'user2', 'company', 'department'];
        $limit = request('limit', 50);
        $order = $request->input('order') === 'asc' ? 'asc' : 'desc';
        $sort = in_array($request->input('sort'), $allowed_columns) ? e($request->input('sort')) : 'name';
        

        switch ($request->input('sort')) {  
            case 'location':
            $contract = $contract->leftJoin('locations', 'locations.id', '=', 'contracts.location_id')->orderBy('locations.name', $order);
            break;
        case 'store':
            
            $contract = ($request->input('company')) ? $contract: 
            (Contract::select('contracts.*', 'stores.name as stores', 'stores.id as stores_id')
            ->join('stores', 'stores.id', '=', 
            \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Store" THEN contracts.object_id ELSE null END )' ))
            ->union(
                Contract::select('contracts.*', \DB::raw('null as stores'),  \DB::raw('null as stores_id'))
                ->join('companies', 'companies.id', '=', 
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Company" THEN contracts.object_id ELSE null END )' ))
                
                )
            ->union(
                Contract::select('contracts.*', 'stores.name as stores', 'stores.id as stores_id')
                ->join('departments', 'departments.id', '=',  
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Department" THEN contracts.object_id ELSE null END )' ))
                ->join('stores', 'stores.id', '=', 'departments.store_id')
                // ->join('companies', 'companies.id', '=', 'stores.company_id')
                )
            ->orderBy('stores', $order));
            break;
        case 'user':
            $contract = $contract->leftJoin('users', 'users.id', '=', 'contracts.contact_id_1')->orderBy('users.name', $order);
            break;
        case 'user2':
            $contract = $contract->leftJoin('users', 'users.id', '=', 'contracts.contact_id_2')->orderBy('users.name', $order);
            break;
        case 'company':
            $contract = ($request->input('company')) ? $contract : (Contract::select('contracts.*', 'companies.name as companies', 'companies.id')
            ->join('companies', 'companies.id', '=', 
            \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Company" THEN contracts.object_id ELSE null END )' ))
            ->union(
                Contract::select('contracts.*', 'companies.name as companies', 'companies.id')
                ->join('stores', 'stores.id', '=', 
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Store" THEN contracts.object_id ELSE null END )' ))
                ->join('companies', 'stores.company_id', '=', 'companies.id')
                )
            ->union(
                Contract::select('contracts.*', 'companies.name as companies', 'companies.id')
                ->join('departments', 'departments.id', '=',  
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Department" THEN contracts.object_id ELSE null END )' ))
                ->join('stores', 'stores.id', '=', 'departments.store_id')
                ->join('companies', 'companies.id', '=', 'stores.company_id'))
            ->orderBy('companies', $order));
            break;
        case 'department':
            $contract = $contract->leftJoin('departments', 'departments.id', '=', 'contracts.object_id')->orderBy('departments.name', $order);
            break;
        default:
            $contract = $contract->orderBy($sort, $order);
            break;
        }

        $contract = $contract->take($limit)->get();
        return (new ContractsTransformer)->transformContractList($contract);
    }

    public function selectlist(Request $request)
    {
        $listContract = Contract::select([
            'contracts.id',
            'contracts.name',
            'contracts.start_date',
        ]);
        if($request->date_contract != null) {
            $listContract->where('contracts.start_date', '=' , $request->date_contract);
        }
        $listContract = $listContract->orderBy('name', 'ASC')->paginate(50);
        return (new SelectlistTransformer)->transformSelectList($listContract);
    }   

}