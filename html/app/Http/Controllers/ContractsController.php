<?php

namespace App\Http\Controllers;
use App\Models\Company;
use App\Models\Store;
use App\Models\Department;
use App\Models\Contract;
use App\Models\ContractAsset;
use App\Models\Asset;
use App\Http\Requests\ContractRequest;
use App\Http\Requests\ImageUploadRequest;
use Request;
use DB;
use Auth;
/**
 * @author [Thinh.NP],[Duong.lnt]
 * @content: Changed store method
 */
class ContractsController extends Controller
{
     /**
    * @since [v1.0]
    * @return \Illuminate\Contracts\View\View
     */
    public function index()
    {
        $listCompany =Company::all();
        return view('contracts/index')->with('listCompany',$listCompany);
    }

    public function billing()
    {
        $listCompany =Company::all();
        return view('contracts/billing')->with('listCompany',$listCompany);
    }

    public function show($contractId = null)
    {
        if ($item = Contract::find($contractId)) {
            $scope = $item->object_type;
            if($scope == Company::class) {
                $item = $item
                ->select('contracts.*', 'companies.id AS assigned_company')
                ->join('companies', 'companies.id', '=', 
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Company" THEN contracts.object_id ELSE null END )' ))
                ->where('contracts.id','=',$contractId)
                ->first();
            }
            else if($scope == Store::class) {
                $item = $item
                ->select('contracts.*', 'stores.id AS assigned_store', 'companies.id AS assigned_company')
                ->join('stores', 'stores.id', '=', 
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Store" THEN contracts.object_id ELSE null END )' ))      
                ->join('companies','stores.company_id', '=' , 'companies.id')
                ->where('contracts.id','=',$contractId)
                ->first();
            }
            else if($scope == Department::class) {
                $item = $item
                ->select('contracts.*','departments.id AS assigned_department', 'stores.id AS assigned_store', 'companies.id AS assigned_company')
                ->join('departments', 'departments.id', '=', 
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Department" THEN contracts.object_id ELSE null END )' ))
                ->join('stores','stores.id', '=' , 'departments.store_id')
                ->join('companies','stores.company_id', '=' , 'companies.id')
                ->where('contracts.id','=',$contractId)
                ->first();
            }

            $this->authorize('update', $item);

            return view('contracts/edit',compact('item'));
        }
        return redirect()->route('contracts.index')->with('error', trans('admin/contracts/message.does_not_exist'));
    
    }


    /**
    * @since [v1.0]
    * @return \Illuminate\Contracts\View\View
     */
    public function create()
    {
        return view('contracts/edit')->with('item', new Contract);
    }

    /**
    * @since [v1.0]
    * @return \Illuminate\Http\RedirectResponse
     */
    public function store(ContractRequest $request)
    {
        $contract = new Contract();
        $contract->name                  = $request->input('name');
        $contract->location_id           = $request->input('location_id');
        $contract->contact_id_1          = $request->input('contact_id_1');
        $contract->contact_id_2          = $request->input('contact_id_2');
        $contract->start_date            = $request->input('start_date');
        $contract->end_date              = $request->input('end_date');
        $contract->billing_date          = $request->input('billing_date');
        $contract->payment_date          = $request->input('payment_date');
        $contract->terms_and_conditions  = $request->input('terms_and_conditions');
        $contract->notes                 = $request->input('notes');
        $contract->user_id               = Auth::id();

        if (request('checkout_to_type_contract')=='company') {
            $contract->object_id   = $request->input('assigned_company');
            $contract->object_type = Company::class;
        } elseif (request('checkout_to_type_contract')=='store') {
            $contract->object_id   = $request->input('assigned_store');
            $contract->object_typede = Store::class;
        } elseif (request('checkout_to_type_contract')=='department') {
            $contract->object_id   = $request->input('assigned_department');
            $contract->object_type = Department::class;
        }

        if ($contract->save()) {
            return redirect()->route('contracts.index')->with('success', trans('admin/contracts/message.create.success'));
        }
        return redirect()->back()->withInput()->withErrors($contract->getErrors());
    }

     /**
     * @param $permissions
     * @return View
     * @internal param int $id
     */
    public function edit($contractId = null)
    {
        if (is_null($item = Contract::find($contractId))) {
          
            return redirect()->back()->with('error', trans('admin/contracts/message.not_found'));
        }

        if ($item = Contract::find($contractId)) {
            $scope = $item->object_type;
            if($scope == Company::class) {
                $item = $item
                ->select('contracts.*', 'companies.id AS assigned_company')
                ->join('companies', 'companies.id', '=', 
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Company" THEN contracts.object_id ELSE null END )' ))
                ->where('contracts.id','=',$contractId)
                ->first();
            }
            else if($scope == Store::class) {
                $item = $item
                ->select('contracts.*', 'stores.id AS assigned_store', 'companies.id AS assigned_company')
                ->join('stores', 'stores.id', '=', 
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Store" THEN contracts.object_id ELSE null END )' ))      
                ->join('companies','stores.company_id', '=' , 'companies.id')
                ->where('contracts.id','=',$contractId)
                ->first();
            }
            else if($scope == Department::class) {
                $item = $item
                ->select('contracts.*','departments.id AS assigned_department', 'stores.id AS assigned_store', 'companies.id AS assigned_company')
                ->join('departments', 'departments.id', '=', 
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Department" THEN contracts.object_id ELSE null END )' ))
                ->join('stores','stores.id', '=' , 'departments.store_id')
                ->join('companies','stores.company_id', '=' , 'companies.id')
                ->where('contracts.id','=',$contractId)
                ->first();
            }

            $this->authorize('update', $item);
           
        return view('contracts/edit', compact('item'));
    }
    }

     /**
     * @param UpdateUserRequest $request
     * @param  int $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(ContractRequest $request,  $contractId = null)
    {
        if (is_null($contract = Contract::find($contractId))) {
            return redirect()->route('contract.index')->with('error', trans('admin/contracts/message.does_not_exist'));
        }
        $contract->name                  = $request->input('name');
        $contract->location_id           = $request->input('location_id');
        $contract->contact_id_1          = $request->input('contact_id_1');
        $contract->contact_id_2          = $request->input('contact_id_2');
        $contract->start_date            = $request->input('start_date');
        $contract->end_date              = $request->input('end_date');
        $contract->billing_date          = $request->input('billing_date');
        $contract->payment_date          = $request->input('payment_date');
        $contract->terms_and_conditions  = $request->input('terms_and_conditions');
        $contract->notes                 = $request->input('notes');
        $contract->user_id               = Auth::id();

        if (request('checkout_to_type_contract')=='company') {
            $contract->object_id   = $request->input('assigned_company');
            $contract->object_type = Company::class;
        } elseif (request('checkout_to_type_contract')=='store') {
            $contract->object_id   = $request->input('assigned_store');
            $contract->object_type = Store::class;
        } elseif (request('checkout_to_type_contract')=='department') {
            $contract->object_id   = $request->input('assigned_department');
            $contract->object_type = Department::class;
        }
        
        if ($contract->save()) {
            return redirect()->route('contracts.index')->with('success', trans('admin/contracts/message.update.success'));
        }
        return redirect()->back()->withInput()->withErrors($contract->getErrors());
    }

    public function destroy($contractId)
    {
        // Check if the contract exists
        if (is_null($contract = Contract::find($contractId))) {
            // Redirect to the asset management page with error
            return redirect()->route('contracts.index')->with('error', trans('admin/contracts/message.does_not_exist'));
        }

        $this->authorize('delete', $contract);
        DB::table('contracts')->where('id', $contract->id);
        $contract->delete();
        return redirect()->route('contracts.index')->with('success', trans('admin/contracts/message.delete.success'));
    }

}
