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
            'contracts.store_id',
            'contracts.location_id',
            'contracts.contact_id_1',
            'contracts.contact_id_2',
            'contracts.start_date',
            'contracts.end_date',
            'contracts.billing_date',
            'contracts.payment_date',
        ])->join('stores','stores.id','=','contracts.store_id');

        if($request->input('company')){
            $contractList = $contractList->where('stores.company_id','=',$request->input('company'));
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

    public function selectList(Request $request)
    {
        $listContract = Contract::where('contracts.store_id', '=', $request->store_id)
                    ->where('contracts.start_date', '=' , $request->date_contract);
        $listContract = $listContract->orderBy('name', 'ASC')->paginate(50);
        return (new SelectlistTransformer)->transformSelectList($listContract);
    }   

}