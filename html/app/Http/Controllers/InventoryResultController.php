<?php
namespace App\Http\Controllers;

use App\Models\InventoryResult;
use App\Models\Inventory;
/**
 * This class controls all actions related to inventory for
 * the Snipe-IT Asset Management application.
 * @author [Dang.HT]
 * @version    v1.0
 */
class InventoryResultController extends Controller
{
    /**
    * Returns a view that invokes the ajax tables which actually contains
    * the content for the inventory listing, which is generated in getDatatable.
    * @see inventoryController::getDatatable() method that generates the JSON response
    * @return \Illuminate\InventoryResult\View\View
    */
    public function index()
    {
        $this->authorize('view', InventoryResult::class);
        return view('inventory/result',['item'=> new InventoryResult]);
    }
    /**
    * show a inventory.
    *
    * @param int $inventoryId
    * @return \Illuminate\InventoryResult\View\View
     */
    public function show($inventoryId=null)
    {
        if (is_null($inventory = Inventory::find($inventoryId))) {
            return redirect()->route('inventories.index')->with('error', trans('admin/inventory/message.does_not_exist'));
        }
        $this->authorize('create', $inventory);
        $inventory =Inventory::select('inventories.id as inventory_id','contract_id','store_id','company_id')
        ->join('contracts', 'contracts.id', '=', 'inventories.contract_id')
        ->join('stores', 'stores.id', '=', 'contracts.store_id') 
        ->where('inventories.id','=',$inventoryId)
        ->first();
        return view('inventory/result')
            ->with('item', $inventory);
    }
    /**
    * Delete a inventory.
    *
    * @param int $inventoryresultId
    * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($inventoryresultId)
    {
        $splitName = explode('_', $inventoryresultId, 2);
        $InventoryResult_id=InventoryResult::select('id')->where('inventory_id',$splitName[0])->where('asset_id',$splitName[1])->first();
        if (is_null($inventoryresult = InventoryResult::find($InventoryResult_id->id))) {
            return redirect()->back()->with('error', trans('admin/inventory/message.result.does_not_exist'));
        }
        $this->authorize('delete', $inventoryresult);
        $inventoryresult->delete();
        return redirect()->back()->with('success', trans('admin/inventory/message.result.delete'));
    }

}
