<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Transformers\StoreTransformer;
use App\Http\Transformers\SelectlistTransformer;
use App\Models\Store;


/** 
* @author [Dang.HT]
* @since [v1.0]
*/

class StoreController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $this->authorize('view', Store::class);
        $store = Store::select('stores.*')
            ->with('company', 'location');
        if ($request->has('search')) {
            $store = $store->TextSearch($request->input('search'));
        }
       
        $offset = (($store) && (request('offset') > $store->count())) ? 0 : request('offset', 0);
        $limit = request('limit', 50);

        $allowed_columns = ['location','company'];
        $order = $request->input('order') === 'asc' ? 'asc' : 'desc';
        $sort = in_array($request->input('sort'), $allowed_columns) ? $request->input('sort') : 'created_at';

        switch ($sort) {
            case 'location':
                $store = $store->OrderLocation($order);
                break;
            case 'company':
                $store = $store->OrderCompany($order);
                break;
            default:
                $store = $store->orderBy($sort, $order);
                break;
        }

        $total = $store->count();
        $store = $store->skip($offset)->take($limit)->get();
        return (new StoreTransformer)->transformStores($store, $total);
    }

    public function selectlist(Request $request)
    {

        $company_id=$request->company_id;
        $stores = Store::select([
            'stores.id',
            'stores.name',
            'stores.image',
        ]);
        $store = $stores->where('company_id', $company_id)->orderBy('name', 'ASC')->paginate(50);
        if ($request->get('search')) {
            $stores = $stores->where('stores.name', 'LIKE', '%'.$request->get('search').'%');
        }
        if ($request->get('company_id')) {
            $stores = $stores->where('stores.company_id', '=', $request->get('company_id'));
        }
        $stores = $stores->orderBy('name', 'ASC')->paginate(50);

        // Loop through and set some custom properties for the transformer to use.
        // This lets us have more flexibility in special cases like assets, where
        // they may not have a ->name value but we want to display something anyway
        foreach ($stores as $store) {
            $store->use_image = ($store->image) ? url('/').'/uploads/store/'.$store->image : null;
        }

        return (new SelectlistTransformer)->transformSelectlist($stores);
    }
}
