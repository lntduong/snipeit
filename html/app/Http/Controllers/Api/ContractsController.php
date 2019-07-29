<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Http\Transformers\ContractsTransformer;
use App\Http\Transformers\SelectlistTransformer;
use Illuminate\Http\Request;
use App\Models\Contract;
use App\Models\Store;
use App\Models\Department;
use DB;
/**
 * @version    v1.0
 * @author [Thinh.NP] 
 */
class ContractsController extends Controller
{   
    public function index(Request $request)
    {      

        $this->authorize('view', Contract::class);

        $contract = Contract::select('contracts.*')->with('company', 'store', 'location', 'user');

        if($request->has('department')) {
            $contract = $contract->FilterDepartmentInDepartment($request->input('department'));
        } else {
            if ($request->has('store') ) {
                $contract = $contract->FilterDepartmentInStore($request->input('store'))
                ->union(Contract::select('contracts.*')->FilterStoreInStore($request->input('store')));
            }
            else if($request->input('company')) {
                $contract = $contract->FilterDepartmentInCompany($request->input('company'))
                ->union(Contract::select('contracts.*')->FilterStoreInCompany($request->input('company')))
                ->union(Contract::select('contracts.*')->FilterCompanyInCompany($request->input('company')));
            }
        }
        
        if ($request->has('search')) {
            $contract = $contract->TextSearch($request->input('search'));
        }
        
        $allowed_columns = ['location_id','store', 'contact_id_1', 'contact_id_2', 'company', 'department'];
        $limit = request('limit', 50);
        $order = $request->input('order') === 'asc' ? 'asc' : 'desc';
        $sort = in_array($request->input('sort'), $allowed_columns) ? e($request->input('sort')) : 'name';
        

        switch ($request->input('sort')) {  
            case 'company':
                $contract = ($request->input('company')) ? 
                        $contract : Contract::select('contracts.*', 'companies.name as companies', 'companies.id')->SortCompany($order);
            break;

            case 'store':          
                if($request->input('store')) {
                    $contract = $contract;
                }
                else if($request->input('company')) {
                    $contract = Contract::select('contracts.*', 'stores.name as stores', 'stores.id as stores_id')->SortStoreCompany($order, $request->input('company'));
                } 
                else {
                    $contract = Contract::select('contracts.*', 'stores.name as stores', 'stores.id as stores_id')->SortStore($order);
                }
            break;

            case 'department':
                if(($request->input('department'))) {
                    $contract = $contract;
                }
                else if($request->input('store')) {
                    $contract = Contract::select('contracts.*', 'departments.name as departments', 'departments.id as departments_id')->SortStoreDepartment($order, $request->input('store'));
                }
                else if($request->input('company')) {
                    $contract = Contract::select('contracts.*', 'departments.name as departments', 'departments.id as departments_id')->SortCompanyDepartment($order, $request->input('company'));
                } 
                else {
                    $contract = Contract::select('contracts.*', 'departments.name as departments', 'departments.id as departments_id')->SortDepartment($order);
                }
            break;

            case 'location_id':
                $contract = $contract->OrderLocation($order);
            break;

            case 'contact_id_1':
                $contract = $contract->OrderContactOne($order);
            break;

            case 'contact_id_2':
                $contract = $contract->OrderContactTwo($order);
            break;

            case 'start_date':
                $contract = $contract->OrderDate('start_date', $order);
            break;

            case 'end_date':
                $contract = $contract->OrderDate('end_date', $order);
            break;

            case 'billing_date':
                $contract = $contract->OrderDate('billing_date', $order);
            break;

            case 'payment_date':
                $contract = $contract->OrderDate('payment_date', $order);
            break;

            default:
                $contract = $contract->orderBy($sort, $order);
            break;
        }
        
        // $total = $contract->count();
        $total = DB::table('contracts')->count();
        $contract = $contract->take($limit)->get();
        
        return (new ContractsTransformer)->transformContractList($contract, $total);
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