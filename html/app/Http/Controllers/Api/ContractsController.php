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
            );
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
       
        //$offset = (($contract) && (request('offset') > $contract->count())) ? 0 : request('offset', 0);
        $limit = request('limit', 50);

        $allowed_columns = ['location','store', 'user', 'user2'];
        $order = $request->input('order') === 'asc' ? 'asc' : 'desc';
        $sort = in_array($request->input('sort'), $allowed_columns) ? $request->input('sort') : 'created_at';

        switch ($sort) {
            case 'location':
                $contract = $contract->OrderLocation($order);
                break;
            case 'store':
                $contract = $contract->OrderStore($order);
                break;
            case 'user':
                $contract = $contract->OrderUser($order);
                break;
            case 'user2':
                $contract = $contract->OrderUser($order);
                break;
            default:
                $contract = $contract->orderBy($sort, $order);
                break;
        }

        //$total = $contract->count();
        $contract = $contract->take($limit)->get();
        return (new ContractsTransformer)->transformContractList($contract);
    }

    public function selectlist(Request $request)
    {
        //$listContract = Contract::where('contracts.store_id', '=', $request->store_id);
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