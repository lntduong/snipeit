<?php

namespace App\Http\Controllers;
use App\Models\Company;
use App\Models\Contract;
use App\Models\ContractAssets;
use App\Models\Asset;
use App\Http\Requests\ImageUploadRequest;
use Request;

/**
 * @version    v1.0
 * @author [Thinh.NP] 
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
    public function store(ImageUploadRequest $request)
    {
        $contract = new Contract([
            'name' => $request->get('name'),
            'store_id' => $request->get('store_id'),
            'location_id' => $request->get('location_id'),
            'contact_id_1' => $this->nullToBlank($request->input('contact_id_1')),
            'contact_id_2' => $this->nullToBlank($request->input('contact_id_2')),
            'start_date' => $request->get('start_date'),
            'end_date' => $request->get('end_date'),
            'billing_date' => $request->get('billing_date'),
            'payment_date' => $request->get('payment_date'),
            'terms_and_conditions' => $request->get('terms_and_conditions'),
            'notes' => $request->get('notes'),
        ]);
        $contract->save();
        return response()->json(['success'=> trans('admin/contracts/message.create.success')], 200);

    }

     /**
     * @param $permissions
     * @return View
     * @internal param int $id
     */
    public function edit($contractId = null)
    {
        if ($item = Contract::find($contractId)) {
           
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
        $contract->name                  = $this->nullToBlank($request->input('name'));
        $contract->store_id              = $this->nullToBlank($request->input('store_id'));
        $contract->location_id           = $this->nullToZero($request->input('location_id'));
        $contract->contact_id_1          = $this->nullToBlank($request->input('contact_id_1'));
        $contract->contact_id_2          = $this->nullToBlank($request->input('contact_id_2'));
        $contract->start_date            = $this->nullToBlank($request->input('start_date'));
        $contract->end_date              = $this->nullToBlank($request->input('end_date'));
        $contract->billing_date          = $this->nullToBlank($request->input('billing_date'));
        $contract->payment_date          = $this->nullToBlank($request->input('payment_date'));
        $contract->terms_and_conditions  = $this->nullToBlank($request->input('terms_and_conditions'));
        $contract->notes                 = $this->nullToBlank($request->input('notes'));
        
        if ($contract->save()) {
            return redirect()->route('contracts.index')->with('success', trans('admin/contracts/message.update.success'));
        }
        return redirect()->back()->withInput()->withErrors($contract->getErrors());
    }

     /**
     * @param $text
     * @return String
     */
    function nullToBlank($text){
        if($text === null || $text === ''){
            return '';
        }
        return $text ;
    }

     /**
     * @param $text
     * @return String
     */
    function nullToZero($number){
        if($number === null || $number === ''){
            return '0';
        }
        return $number ;
    }
    

}
