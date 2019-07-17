<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Transformers\InventoryTransformer;
use App\Models\Inventory;
use App\Http\Transformers\SelectlistTransformer;

    /**
     * Display a listing of the resource.
     *
     * @author [Dang.HT]
     * @since [v1.0]
     *
     */

class InventoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return list Tableinventory
     */
    public function index(Request $request)
    {
        $this->authorize('view', Inventory::class);
        $inventory = Inventory::select('inventories.*','stores.company_id')
        ->leftJoin('contracts', 'inventories.contract_id', '=', 'contracts.id')
        ->leftJoin('stores', 'stores.id', '=', 'contracts.store_id')
        ->with('contract');

        if ($request->input('search')) {
            $inventory = $inventory->TextSearch($request->input('search'));
        }

        if ($request->input('company_id')) {
        $inventory =$inventory->where('stores.company_id',$request->input('company_id'));
        }

        $offset = (($inventory) && (request('offset') > $inventory->count())) ? 0 : request('offset', 0);
        $limit = request('limit', 50);
        $order = $request->input('order') === 'asc' ? 'asc' : 'desc';
        $allowed_columns = [
           'name'
        ];
        $sort = in_array($request->input('sort'), $allowed_columns) ? $request->input('sort') : 'created_at';
        $inventory->orderBy($sort, $order);
       
        $total = $inventory->count();
        $inventory = $inventory->skip($offset)->take($limit)->get();
        return (new InventoryTransformer)->transformInventories($inventory, $total);
    }
    /**
     * Display all assets attached to a component
     * @param Request $request
     * @return List Selectinventory
    */
    public function selectlist(Request $request)
    {

        $inventories = Inventory::select([
            'inventories.id',
            'inventories.name',
            'inventories.inventory_date',
        ]);
        $inventories = $inventories->where('inventories.contract_id', '=', $request->get('contract_id'));

        if ($request->input('search')) {
            $inventories = $inventories->where('inventories.name', 'LIKE', '%'.$request->get('search').'%');
        }
        if($request->get('contract_id')) {
            $inventories = $inventories->where('inventories.contract_id', '=', $request->get('contract_id'));
        }
        $inventories = $inventories->orderBy('name', 'ASC')->paginate(50);
        return (new SelectlistTransformer)->transformSelectlistInventory($inventories);
    }
    
}
