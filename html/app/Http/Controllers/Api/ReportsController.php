<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Actionlog;
use App\Http\Transformers\ActionlogsTransformer;

class ReportsController extends Controller
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
        $this->authorize('reports.view');

        $actionlogs = Actionlog::with('item', 'user', 'target', 'location');

        if ($request->has('search')) {
            $actionlogs = $actionlogs->TextSearch(e($request->input('search')));
        }

        if (($request->has('contract_id'))) {
            $actionlogs = $actionlogs->where('item_id', '=', $request->input('contract_id'))
                ->where('item_type', '=', "App\\Models\\" . ucwords('contract'));
        }

        if (($request->has('contract_type'))) {
            $actionlogs = $actionlogs->where('item_type', '=', "App\\Models\\" . ucwords($request->input('contract_type')));
        }

        if (($request->input('store_id'))) {
            $actionlogs = $actionlogs
                ->join('contracts', 'contracts.id', '=', 'action_logs.item_id')
                ->join(
                    'stores',
                    'stores.id',
                    '=',
                    \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Store" THEN contracts.object_id ELSE null END )')
                )
                ->where('item_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                ->where('contracts.object_id', '=', $request->input('store_id'));
        }

        if (($request->has('target_type')) && ($request->has('target_id'))) {
            $actionlogs = $actionlogs->where('target_id', '=', $request->input('target_id'))
                ->where('target_type', '=', "App\\Models\\" . ucwords($request->input('target_type')));
        }

        if (($request->has('item_type')) && ($request->has('item_id'))) {
            $actionlogs = $actionlogs
                ->where('item_id', '=', $request->input('item_id'))
                ->where('item_type', '=', "App\\Models\\" . ucwords($request->input('item_type')));
        }

        $allowed_columns = [
            'id',
            'action_logs.created_at',
            'target_id',
            'user_id',
            'action_type',
            'note'
        ];

        $sort = in_array($request->input('sort'), $allowed_columns) ? e($request->input('sort')) : 'action_logs.created_at';
        $order = ($request->input('order') == 'asc') ? 'asc' : 'desc';

        if ($request->has('item_id')) {
            $actionlogs =
                Actionlog::select('action_logs.*')->join('contracts', 'contracts.id', '=', 'action_logs.item_id')
                ->where('action_logs.item_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                ->where('contracts.id', '=',  $request->input('item_id'))
                ->orderBy($sort, $order)
                ->union(
                    Actionlog::select('action_logs.*')
                        ->join('contract_assets', 'contract_assets.id', '=', 'action_logs.item_id')
                        ->where('action_logs.item_type', '=', \DB::raw('"App\\\Models\\\ContractAsset"'))
                        ->where('contract_assets.contract_id', '=',  $request->input('item_id'))
                        ->orderBy($sort, $order)
                );
        }

        if ($request->has('action_type')) {
            $actionlogs = $actionlogs->where('action_type', '=', $request->input('action_type'))->orderBy('action_logs.created_at', 'desc');
        }

        if ($request->has('uploads')) {
            $actionlogs = $actionlogs->whereNotNull('filename')->orderBy('action_logs.created_at', 'desc');
        }

        $offset = request('offset', 0);
        $limit = request('limit', 50);
        $total = $actionlogs->get()->count();
        if ($request->has('item_id')) {
            $actionlogs = $actionlogs->skip($offset)->take($limit)->get();
        } else {
            $actionlogs = $actionlogs->orderBy($sort, $order)->skip($offset)->take($limit)->get();
        }
        return response()->json((new ActionlogsTransformer)->transformActionlogs($actionlogs, $total), 200, ['Content-Type' => 'application/json;charset=utf8'], JSON_UNESCAPED_UNICODE);
    }
}
