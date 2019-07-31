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

class StoresController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $this->authorize('view', Store::class);
        $allowed_columns = ['location','company','contract_count','department_count'];
        $store = Store::select('stores.*')
            ->with('company', 'location')->with('department')->withCount('department')->withCount('contract');
        if ($request->has('search')) {
            $store = $store->TextSearch($request->input('search'));
        }
       
        $offset = (($store) && (request('offset') > $store->count())) ? 0 : request('offset', 0);
        $limit = request('limit', 50);


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

        $stores = Store::select([
            'stores.id',
            'stores.name',
            'stores.image',
        ]);
        if ($request->get('search')) {
            $stores = $stores->where('stores.name', 'LIKE', '%'.$request->get('search').'%');
        }
        if ($request->get('company_id')) {
            $stores = $stores->where('stores.company_id', '=', $request->get('company_id'));
        }
        $stores = $stores->orderBy('name', 'ASC')->paginate(50);
        foreach ($stores as $store) {
            $store->use_image = ($store->image) ? url('/').'/uploads/store/'.$store->image : null;
        }

        return (new SelectlistTransformer)->transformSelectlist($stores);
    }
}
