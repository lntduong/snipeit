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
        $this->authorize('view', Contract::class);
        $contract = Contract::select('contracts.*')
            ->with('store', 'location', 'user', 'user2')
            ->join('stores', 'stores.id', '=', 'contracts.store_id' );

        if($request->input('company')) {
            $contract = $contract->where('stores.company_id','=',$request->input('company'));
        }
        if ($request->has('store_id')) {
            $contract = $contract->where('contracts.store_id','=',$request->input('store_id'));
        }
        if($request->input('contract')) {
            $contract = $contract->where('contracts.id','=',$request->input('contract'));
        }
        if ($request->has('search')) {
            $contract = $contract->TextSearch($request->input('search'));
        }
       
        $offset = (($contract) && (request('offset') > $contract->count())) ? 0 : request('offset', 0);
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

        $total = $contract->count();
        $contract = $contract->skip($offset)->take($limit)->get();
        return (new ContractsTransformer)->transformContractList($contract, $total);
    }

    public function selectlist(Request $request)
    {
        $listContract = Contract::where('contracts.store_id', '=', $request->store_id);
        
        if($request->date_contract != null) {
            $listContract->where('contracts.start_date', '=' , $request->date_contract);
        }
        $listContract = $listContract->orderBy('name', 'ASC')->paginate(50);
        return (new SelectlistTransformer)->transformSelectList($listContract);
    }   

}