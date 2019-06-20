<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Store;
use App\Models\User;
use App\Http\Transformers\StoreTransformer;
use App\Http\Transformers\SelectlistTransformer;
class StoreController extends Controller
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
        $store = Store::select([
            'id', 'company_id', 'name', 'location_id', 'image', 'user_id', 'created_at', 'updated_at'
         ]);
         
         if ($request->filled('search')) {
            $store = $store->TextSearch(e($request->input('search')));
        }
        $allowed_columns = [
            'user_id'
        ];
        $sort = in_array($request->input('sort'), $allowed_columns) ? e($request->input('sort')) : 'created_at';
        $order = ($request->input('order') == 'asc') ? 'asc' : 'desc';
        $offset = request('offset', 0);
        $limit = request('limit', 50);
        $total = $store->count();
        $store = $store
        ->orderBy($sort, $order)->skip($offset)->take($limit)->get();

        return response()->json((new StoreTransformer)->transformStores($store, $total), 200, ['Content-Type' => 'application/json;charset=utf8'], JSON_UNESCAPED_UNICODE);

    }
    public function selectlist(Request $request)
    {

        $stores = Store::select([
            'stores.id',
            'stores.name',
            'stores.image'
        ]);

        if ($request->filled('search')) {
            $stores = $stores->where('stores.name', 'LIKE', '%'.$request->get('search').'%');
        }

        $stores = $stores->orderBy('name', 'ASC')->paginate(50);
        foreach ($stores as $store) {
            $store->use_text = $store->name;
            $store->use_image = ($store->image) ? url('/').'/uploads/store/'.$store->image : null;
        }


        return (new SelectlistTransformer)->transformSelectlist($stores);
    }
}
