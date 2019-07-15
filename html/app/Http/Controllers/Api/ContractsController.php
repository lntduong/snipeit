<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Http\Transformers\ContractsTransformer;
use App\Http\Transformers\SelectlistTransformer;
use Illuminate\Http\Request;
use App\Models\Contract;
/**
 * @version    v1.0
 * @author [Thinh.NP] 
 */
class ContractsController extends Controller
{
    public function index(Request $request)
    {      
        $contractList = Contract::select([
            'contracts.id',
            'contracts.name',
            'contracts.object_id',
            'contracts.location_id',
            'contracts.contact_id_1',
            'contracts.contact_id_2',
            'contracts.start_date',
            'contracts.end_date',
            'contracts.billing_date',
            'contracts.payment_date',
            'companies.name AS company_name',
            'stores.name AS store_name',
            'departments.name AS department_name' 
        ])
        ->leftJoin('companies', 'companies.id', '=' ,
        \DB::raw('(CASE WHEN contracts.object_type = "App\Models\Company" THEN contracts.object_id ELSE null END )' ))

        ->leftJoin('stores', 'stores.id', '=' ,
        \DB::raw('(CASE WHEN contracts.object_type = "App\Models\Store" THEN contracts.object_id ELSE null END )' ))

        ->leftJoin('departments', 'departments.id', '=' ,
        \DB::raw('(CASE WHEN contracts.object_type = "App\Models\Department" THEN contracts.object_id ELSE null END )' ));
	
        if($request->input('company')){
            $contractList = $contractList->where('stores.company_id','=',$request->input('company'));
        }
        // if ($request->has('store_id')) {
        //     $contractList = $contractList->where('contracts.store_id','=',$request->input('store'));
        // }
        if($request->input('contract')){
            $contractList = $contractList->where('contracts.id','=',$request->input('contract'));
        }
        if ($request->has('search')) {
            $contractList = $contractList->TextSearch(e($request->input('search')));
        }
        $sort = 'contracts.created_at';
        $order = ($request->input('order') == 'asc') ? 'asc' : 'desc';
        $offset = request('offset', 0);
        $limit = request('limit', 50);
        $total = $contractList->count();
        $contractList = $contractList->orderBy($sort, $order)->skip($offset)->take($limit)->get();

        return response()->json((new ContractsTransformer)->transformContractList($contractList, $total), 200, ['Content-Type' => 'application/json;charset=utf8'], JSON_UNESCAPED_UNICODE);
    }

    public function selectlist(Request $request)
    {
        $listContract = Contract::where('contracts.store_id', '=', $request->store_id);
        if($request->date_contract != null){
            $listContract->where('contracts.start_date', '=' , $request->date_contract);
        }
        $listContract = $listContract->orderBy('name', 'ASC')->paginate(50);
        return (new SelectlistTransformer)->transformSelectList($listContract);
    }   

}