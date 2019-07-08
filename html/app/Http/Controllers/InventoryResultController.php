<?php
namespace App\Http\Controllers;

use App\Http\Requests\ImageUploadRequest;
use App\Models\Company;
use App\Models\InventoryResult;
use Auth;
use DateTime;
/**
 * This class controls all actions related to inventory for
 * the Snipe-IT Asset Management application.
 * @author [Dang.HT]
 * @version    v1.0
 */
class InventoryResultController extends Controller
{
 /**
    * Edit a inventory.
    *
    * @param int $inventory_id
    * @return \Illuminate\Http\RedirectResponse
     */
    public function edit($inventory_id=null)
    {
        $this->authorize('create', InventoryResult::class);
        $dt = new DateTime();
        $splitName = explode('_', $inventory_id, 2);
        $inventoryresult = InventoryResult::find($splitName[0]);
        if($inventoryresult)
        {
            $inventoryresult->checked_time              = $dt->format('Y-m-d H:i:s');
            $inventoryresult->user_id                   = Auth::id();
        }
        else
        {
            $inventoryresult = new InventoryResult();
            $inventoryresult->inventory_id              = $splitName[0];
            $inventoryresult->asset_id                  = $splitName[1];
            $inventoryresult->unrecognized              = '1';
            $inventoryresult->checked_time              = $dt->format('Y-m-d H:i:s');
            $inventoryresult->user_id                   = Auth::id();
        }
        
       
        if ($inventoryresult->save()) {
            return redirect()->back()->with('success', trans('admin/inventory/message.result.update'));
        }
        return redirect()->back()->withInput()->withErrors($inventoryresult->getErrors());
    }
    /**
    * Delete a inventory.
    *
    * @param int $inventoryresultId
    * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($inventoryresultId)
    {
        if (is_null($inventoryresult = InventoryResult::find($inventoryresultId))) {
            return redirect()->back()->with('error', trans('admin/inventory/message.result.does_not_exist'));
        }
        $this->authorize('delete', $inventoryresult);
        $inventoryresult->delete();
        return redirect()->back()->with('success', trans('admin/inventory/message.result.delete'));
    }

}
