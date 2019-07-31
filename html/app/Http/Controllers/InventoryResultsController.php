<?php
namespace App\Http\Controllers;

use App\Models\InventoryResult;
use App\Helpers\Helper;
use App\Models\Inventory;
use App\Models\Setting;
use App\Models\Contract;
/**
 * This class controls all actions related to inventory for
 * the Snipe-IT Asset Management application.
 * @author [Dang.HT]
 * @version    v1.0
 */
class InventoryResultsController extends Controller
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
        return view('inventories/result',['item'=> new InventoryResult]);
    }

    /**
    * create a inventory result.
    *
    * @return \Illuminate\InventoryResult\View\View
    */
    public function create()
    {
        $setting = Setting::first();
        return view('inventories/edit')
            ->with('item', new InventoryResult)
            ->with('statuslabel_list', Helper::statusLabelList())
            ->with('asset_tag', $setting->auto_increment_prefix);
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
            return redirect()->route('inventories.index')->with('error', trans('admin/inventories/message.does_not_exist'));
        }
        $this->authorize('create', $inventory);
  
        if($inventory->object_type == 'App\Models\Company')
        {
            $inventory=Inventory::select('inventories.id as inventory_id','companies.id as company_id')
                ->join('companies', 'companies.id', '=', 'inventories.object_id')
                ->where('inventories.id',$inventoryId)
                ->first();
        }
        if($inventory->object_type == 'App\Models\Store')
        {
            $inventory=Inventory::select('inventories.id as inventory_id','companies.id as company_id','stores.id as store_id')
                ->join('stores', 'stores.id', '=', 'inventories.object_id')
                ->join('companies', 'companies.id', '=', 'stores.company_id')
                ->where('inventories.id',$inventoryId)
                ->first();
        }
        if($inventory->object_type == 'App\Models\Department')
        {
            $inventory=Inventory::select('inventories.id as inventory_id','companies.id as company_id','stores.id as store_id','departments.id as department_id')
                ->join('departments', 'departments.id', '=', 'inventories.object_id')
                ->join('stores', 'stores.id', '=', 'departments.store_id')
                ->join('companies', 'companies.id', '=', 'stores.company_id')
                ->where('inventories.id',$inventoryId)
                ->first();
        }
        if($inventory->object_type == 'App\Models\Contract')
        {
            $contract=Contract::find($inventory->object_id);
            switch($contract->object_type)
            {
                case 'App\Models\Company':
                {
                    $inventory=Inventory::select('inventories.id as inventory_id','companies.id as company_id','contracts.id as assigned_contract')
                    ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                    ->join('companies', 'companies.id', '=', 'contracts.object_id')
                    ->where('inventories.id',$inventoryId)
                    ->first();
                    break;
                }
                case 'App\Models\Store' :
                {
                    $inventory=Inventory::select('inventories.id as inventory_id','companies.id as company_id','stores.id as store_id','contracts.id as assigned_contract')
                    ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                    ->join('stores', 'stores.id', '=', 'contracts.object_id')
                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                    ->where('inventories.id',$inventoryId)
                    ->first();
                    break;
                }
                case 'App\Models\Department':
                {
                    $inventory=Inventory::select('inventories.id as inventory_id','companies.id as company_id','stores.id as store_id','departments.id as department_id','contracts.id as assigned_contract')
                    ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                    ->join('departments', 'departments.id', '=', 'contracts.object_id')
                    ->join('stores', 'stores.id', '=', 'departments.store_id')
                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                    ->where('inventories.id',$inventoryId)
                    ->first();
                    break;
                }
            }
            
        }
        return view('inventories/result')
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
            return redirect()->back()->with('error', trans('admin/inventories/message.result.does_not_exist'));
        }
        $this->authorize('delete', $inventoryresult);
        $inventoryresult->delete();
        return redirect()->back()->with('success', trans('admin/inventories/message.result.delete'));
    }

}
