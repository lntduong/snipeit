<?php

namespace App\Http\Controllers;
use App\Models\Company;
use App\Models\Contract;
use App\Models\ContractAssets;
use App\Models\Asset;
use App\Http\Requests\ContractRequest;
use App\Http\Requests\ImageUploadRequest;
use Request;
use DB;
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

    public function show()
    {
        $listCompany =Company::all();
        return view('contracts/billing')->with('listCompany',$listCompany);
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
        // $checkName = DB::table('contracts')
        //     ->where('name',$request->input('name'))
        //     ->where('store_id',$request->input('store_id'))
        //     ->first();
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

        if (request('checkout_to_type_contract')=='company') {
            $contract->object_id   = $request->input('assigned_company');
            $contract->object_type = 'App\Models\Company';

        } elseif (request('checkout_to_type_contract')=='store') {
            $contract->object_id   = $request->input('assigned_store');
            $contract->object_type = 'App\Models\Store';

        } elseif (request('checkout_to_type_contract')=='department') {
            $contract->object_id   = $request->input('assigned_department');
            $contract->object_type = 'App\Models\Department';
        }

        // if ($checkName) {
        //     return redirect()->back()->with('error', trans('admin/contracts/message.create.nameduplicate'));
        // }
        // else {
            if ($contract->save()) {
                return redirect()->route('contracts.index')->with('success', trans('admin/contracts/message.create.success'));
            }
            return redirect()->back()->withInput()->withErrors($contract->getErrors());
        //}
    }

     /**
     * @param $permissions
     * @return View
     * @internal param int $id
     */
    public function edit($contractId = null)
    {
        if ($item = Contract::find($contractId)) {
            $this->authorize('update', $item);
            //$contract = new Contract();
            $item = Contract::select(
                'contracts.id',
                'contracts.name',
                'contracts.object_id',
                'contracts.object_type',
                'contracts.location_id',
                'contracts.contact_id_1',
                'contracts.contact_id_2',
                'contracts.start_date',
                'contracts.end_date',
                'contracts.billing_date',
                'contracts.payment_date',
                'contracts.terms_and_conditions',
                'contracts.notes'
            )->where('contracts.id','=',$contractId)
            ->first();;
            // if($contract->object_type = 'App\Models\Company') {
            //     $item->join('companies', 'companies.id', '=', 'contracts.object_id');
            // } else if($contract->object_type = 'App\Models\Store') {
            //     $item->join('stores', 'stores.id', '=', 'contracts.object_id');
            // } else {
            //     $item->join('departments', 'departments.id', '=', 'contracts.object_id');
            // }

            return view('contracts/edit',compact('item'));
        }
        return redirect()->route('contracts.index')->with('error', trans('admin/contracts/essage.does_not_exist'));
    }

     /**
     * @param UpdateUserRequest $request
     * @param  int $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(ImageUploadRequest $request,  $contractId = null)
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
        if (request('checkout_to_type_contract')=='company') {
            $contract->object_id   = $request->input('assigned_company');
            $contract->object_type = 'App\Models\Company';

        } elseif (request('checkout_to_type_contract')=='store') {
            $contract->object_id   = $request->input('assigned_store');
            $contract->object_type = 'App\Models\Store';

        } elseif (request('checkout_to_type_contract')=='department') {
            $contract->object_id   = $request->input('assigned_department');
            $contract->object_type = 'App\Models\Department';
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

        DB::table('contracts')
            ->where('id', $contract->id);

        $contract->delete();

        return redirect()->route('contracts.index')->with('success', trans('admin/contracts/message.delete.success'));
    }

}
