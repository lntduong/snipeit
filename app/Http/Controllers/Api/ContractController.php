<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Contract;
use App\Models\User;
use App\Http\Transformers\ContractTransformer;
use App\Http\Transformers\SelectlistTransformer;
class ContractController extends Controller
{
    /**
     * Returns Activity Report JSON.
     *
     * @author [A. Gianotto] [<snipe@snipe.net>]
     * @since [v4.0]
     * @return View
     */
    public function index(Request $request)
    {
        $contract = Contract::select([
            'id', 'store_id', 'name','location_id', 'contact_id_1', 'contact_id_2', 'start_date', 'end_date', 'billing_date', 'payment_date', 'terms_and_conditions', 'notes', 'created_at', 'updated_at', 'deleted_at', 'user_id'
         ]);
         
         if ($request->filled('search')) {
            $contract = $contract->TextSearch(e($request->input('search')));
        }
        if ($request->filled('location_id')) {
            $contract->where('contract.location_id', '=', $request->input('location_id'));
        }
        $allowed_columns = [
            'user_id'
        ];
        $sort = in_array($request->input('sort'), $allowed_columns) ? e($request->input('sort')) : 'created_at';
        $order = ($request->input('order') == 'asc') ? 'asc' : 'desc';
        $offset = request('offset', 0);
        $limit = request('limit', 50);
        $total = $contract->count();
        $contract = $contract
        ->orderBy($sort, $order)->skip($offset)->take($limit)->get();

        return response()->json((new ContractTransformer)->transformContracts($contract, $total), 200, ['Content-Type' => 'application/json;charset=utf8'], JSON_UNESCAPED_UNICODE);

    }
    public function selectlist(Request $request)
    {

        $contracts = Contract::select([
            'contracts.id',
            'contracts.name',
        ]);

        if ($request->filled('search')) {
            $contracts = $contracts->where('contracts.name', 'LIKE', '%'.$request->get('search').'%');
        }

        $contracts = $contracts->orderBy('name', 'ASC')->paginate(50);


        return (new SelectlistTransformer)->transformSelectlist($contracts);
    }
}
