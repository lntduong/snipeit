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

        $contract = Contract::select('contracts.*')->with('company', 'store');

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
        $allowed_columns = ['location','store', 'user', 'user2', 'company', 'department'];
        $limit = request('limit', 50);
        $order = $request->input('order') === 'asc' ? 'asc' : 'desc';
        $sort = in_array($request->input('sort'), $allowed_columns) ? e($request->input('sort')) : 'name';
        

        switch ($request->input('sort')) {  
            case 'location':
            $contract = $contract->leftJoin('locations', 'locations.id', '=', 'contracts.location_id')->orderBy('locations.name', $order);
            break;
        case 'store':          
            $contract = ($request->input('company')) ? 
                Contract::select('contracts.*', 'stores.name as stores', 'stores.id as stores_id')->SortStoreCompany($order, $request->input('company')):
                Contract::select('contracts.*', 'stores.name as stores', 'stores.id as stores_id')->SortStore($order);
            break;
        case 'user':
            $contract = $contract->leftJoin('users', 'users.id', '=', 'contracts.contact_id_1')->orderBy('users.name', $order);
            break;
        case 'user2':
            $contract = $contract->leftJoin('users', 'users.id', '=', 'contracts.contact_id_2')->orderBy('users.name', $order);
            break;
        case 'company':
            $contract = ($request->input('company')) ? 
                $contract : 
                Contract::select('contracts.*', 'companies.name as companies', 'companies.id')->SortCompany($order);
            break;
        case 'department':
        $contract = ($request->input('company')) ? 
        $contract:
        Contract::select('contracts.*', 'departments.name as departments', 'departments.id as departments_id')->SortDepartment($order);
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