<?php
namespace App\Http\Controllers;

use App\Http\Requests\ImageUploadRequest;
use App\Models\Company;
use App\Models\Inventory;
use Auth;
use DB;
/**
 * This class controls all actions related to inventory for
 * the Snipe-IT Asset Management application.
 * @author [Dang.HT]
 * @version    v1.0
 */
class InventoryController extends Controller
{
    /**
    * Returns a view that invokes the ajax tables which actually contains
    * the content for the inventory listing, which is generated in getDatatable.
    * @see inventoryController::getDatatable() method that generates the JSON response
    * @return \Illuminate\Inventory\View\View
    */
    public function index()
    {
        $this->authorize('view', Inventory::class);
        $company =Company::all();
        return view('inventory/index')->with('company', $company);
    }

    /**
    * Returns a form to create a new inventory.
    *
    * @see inventorysController::postCreate() method that stores the data
    * @return \Illuminate\Inventory\View\View
    */
    public function create()
    {
        $this->authorize('create', Inventory::class);
        return view('inventory/edit-web')->with('item', new Inventory);
    }


    /**
    * Validate and store data for new inventory.
    *
    * @see inventorysController::getCreate() method that generates the view
    * @return \Illuminate\Http\RedirectResponse
     */
    public function store(ImageUploadRequest $request)
    {
        $this->authorize('create', Inventory::class);
        $inventory = new Inventory();
        $inventory->contract_id               = $request->input('contract_id');
        $inventory->inventory_date            = $request->input('inventory_date');
        $inventory->name                      = $request->input('name');
        $inventory->notes                     = $request->input('notes');
        $inventory->user_id                   = Auth::id();
        if ($inventory->save()) {
            return redirect()->route('inventories.index')->with('success', trans('admin/inventory/message.create.success'));
        }
        return redirect()->back()->withInput()->withErrors($inventory->getErrors());
    }

    /**
    * Return a view to edit a inventory.
    *
    * @see inventorysController::postEdit() method that stores the data.
    * @param int $inventory
    * @return \Illuminate\Inventory\View\View
     */
    public function edit($inventory = null)
    {
        if ($item = Inventory::find($inventory)) {
            $this->authorize('update', $item);
            $item = Inventory::select('inventories.id','contract_id','store_id','company_id','inventory_date','inventories.name','inventories.notes')
            ->join('contracts', 'contracts.id', '=', 'inventories.contract_id')
            ->join('stores', 'stores.id', '=', 'contracts.store_id') 
            ->where('inventories.id','=',$inventory)
            ->first();
            ;
            return view('inventory/edit-web', compact('item'));
        }

        return redirect()->route('inventories.index')->with('error', trans('admin/inventory/message.does_not_exist'));
    }


    /**
    * Return a view to edit a inventory.
    *
    * @see inventorysController::getEdit() method presents the form.
    * @param int $inventoryId
    * @return \Illuminate\Http\RedirectResponse
     */
    public function update(ImageUploadRequest $request, $inventoryId = null)
    {
        if (is_null($inventory = Inventory::find($inventoryId))) {
            return redirect()->route('stores.index')->with('error', trans('admin/inventory/message.does_not_exist'));
        }
        $this->authorize('update', $inventory);
        $inventory->contract_id               = $request->input('contract_id');
        $inventory->inventory_date            = $request->input('inventory_date');
        $inventory->name                      = $request->input('name');
        $inventory->notes                     = $request->input('notes');
        if ($inventory->save()) {
            return redirect()->route('inventories.index')->with('success', trans('admin/inventory/message.update.success'));
        }
        return redirect()->back()->withInput()->withErrors($inventory->getErrors());
    }

    /**
    * Delete a inventory.
    *
    * @param int $inventoryId
    * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($inventoryId)
    {
        if (is_null($inventory = Inventory::find($inventoryId))) {
            return redirect()->route('inventories.index')->with('error', trans('admin/inventory/message.does_not_exist'));
        }
        $this->authorize('delete', $inventory);
        $inventory->delete();
        return redirect()->route('inventories.index')->with('success', trans('admin/inventory/message.delete.success'));
    }
     /**
    * Return a view to result a inventory.
    *
    * @see inventorysController::getResult() method that stores the data.
    * @param int $inventoryId
    * @return \Illuminate\Inventory\View\View
     */
    public function getResult($inventoryId = null)
    {
        // Check if the asset exists
        if (is_null($inventory = Inventory::find($inventoryId))) {
            // Redirect to the asset management page
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

}
