<?php
namespace App\Http\Controllers;
use App\Http\Requests\InventoryRequest;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use App\Http\Requests\ImageUploadRequest;
use App\Models\Company;
use App\Models\Inventory;
use App\Models\Contract;
use App\Models\Store;
use App\Models\Department;
use Auth;
use DB;
/**
 * This class controls all actions related to inventory for
 * the Snipe-IT Asset Management application.
 * @author [Dang.HT]
 * @version    v1.0
 */
class InventoriesController extends Controller
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
        return view('inventories/index')->with('company', $company);
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
        $check="company";
        return view('inventories/edit-web')->with('item', new Inventory)
                                         ->with('check',$check);
    }


    /**
    * Validate and store data for new inventory.
    *
    * @see inventorysController::getCreate() method that generates the view
    * @return \Illuminate\Http\RedirectResponse
     */
    public function store(InventoryRequest $request)
    {
  
            $this->authorize('create', Inventory::class);
            $inventory = new Inventory();
            if($request->input('contract_id')) {
                $inventory->object_id = $request->input('contract_id');
                $inventory->object_type = Contract::class;
            } else {
                if($request->input('department_id')) {
                    $inventory->object_id = $request->input('department_id');
                    $inventory->object_type = Department::class;
                } else {
                    if($request->input('store_id')) {
                        $inventory->object_id = $request->input('store_id');
                        $inventory->object_type = Store::class;
                    }
                    else {
                        $inventory->object_id = $request->input('company_id');
                        $inventory->object_type = Company::class;
                    }
                }
            }
            $inventory->inventory_date            = $request->input('inventory_date');
            $inventory->name                      = $request->input('name');
            $inventory->notes                     = $request->input('notes');
            $inventory->user_id                   = Auth::id();
            if ($inventory->save()) {
                return redirect()->route('inventories.index')->with('success', trans('admin/inventories/message.create.success'));
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
            switch($item->object_type)
            {
                case "App\Models\Company";
                {
                    $item=Inventory::select('inventories.*','companies.id as company_id')
                    ->join('companies', 'companies.id', '=', 'inventories.object_id')
                    ->where('inventories.id',$inventory)
                    ->first();
                    break;
                }
                case "App\Models\Store";
                {
                    $item=Inventory::select('inventories.*','companies.id as company_id','stores.id as store_id')
                    ->join('stores', 'stores.id', '=', 'inventories.object_id')
                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                    ->where('inventories.id',$inventory)
                    ->first();
                    break;
                }
                case "App\Models\Department";
                {
                    $item=Inventory::select('inventories.*','companies.id as company_id','stores.id as store_id','departments.id as department_id')
                    ->join('departments', 'departments.id', '=', 'inventories.object_id')
                    ->join('stores', 'stores.id', '=', 'departments.store_id')
                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                    ->where('inventories.id',$inventory)
                    ->first();
                    break;
                }
                case "App\Models\Contract";
                {
                    
                    switch($item->contract->object_type){
                        case "App\Models\Company";
                        {
                            $item=Inventory::select('contracts.id as contract_id','inventories.*','companies.id as company_id')
                            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                            ->join('companies', 'companies.id', '=', 'contracts.object_id')
                            ->where('inventories.id',$inventory)
                            ->first();
                            break;
                        }
                        case "App\Models\Store";
                        {
                            $item=Inventory::select('contracts.id as contract_id','inventories.*','companies.id as company_id','stores.id as store_id')
                            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                            ->join('stores', 'stores.id', '=', 'contracts.object_id')
                            ->join('companies', 'companies.id', '=', 'stores.company_id')
                            ->where('inventories.id',$inventory)
                            ->first();
                            break;
                        }
                        case "App\Models\Department";
                        {
                            $item=Inventory::select('contracts.id as contract_id','inventories.*','companies.id as company_id','stores.id as store_id','departments.id as department_id')
                            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                            ->join('departments', 'departments.id', '=', 'contracts.object_id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->join('companies', 'companies.id', '=', 'stores.company_id')
                            ->where('inventories.id',$inventory)
                            ->first();
                            break;
                        }
                    }
                }
            }
            return view('inventories/edit-web', compact('item'));
        }

        return redirect()->route('inventories.index')->with('error', trans('admin/inventories/message.does_not_exist'));
    }


    /**
    * Return a view to edit a inventory.
    *
    * @see inventorysController::getEdit() method presents the form.
    * @param int $inventoryId
    * @return \Illuminate\Http\RedirectResponse
     */
    public function update(InventoryRequest $request, $inventoryId = null)
    {
        if (is_null($inventory = Inventory::find($inventoryId))) {
            return redirect()->route('stores.index')->with('error', trans('admin/inventories/message.does_not_exist'));
        }
        $this->authorize('update', $inventory);
        if($request->input('contract_id')) {
            $inventory->object_id = $request->input('contract_id');
            $inventory->object_type = Contract::class;
        } else {
            if($request->input('department_id')) {
                $inventory->object_id = $request->input('department_id');
                $inventory->object_type = Department::class;
            } else {
                if($request->input('store_id')) {
                    $inventory->object_id = $request->input('store_id');
                    $inventory->object_type = Store::class;
                }
                else {
                    $inventory->object_id = $request->input('company_id');
                    $inventory->object_type = Company::class;
                }
            }
        }
        $inventory->inventory_date            = $request->input('inventory_date');
        $inventory->name                      = $request->input('name');
        $inventory->notes                     = $request->input('notes');
        $inventory->user_id                   = Auth::id();
        if ($inventory->save()) {
            return redirect()->route('inventories.index')->with('success', trans('admin/inventories/message.update.success'));
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
            return redirect()->route('inventories.index')->with('error', trans('admin/inventories/message.does_not_exist'));
        }
        $this->authorize('delete', $inventory);
        $inventory->delete();
        return redirect()->route('inventories.index')->with('success', trans('admin/inventories/message.delete.success'));
    }
}
