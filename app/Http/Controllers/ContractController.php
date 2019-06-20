<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Contract;
use App\Models\Location;
use App\Models\Store;
use Auth;
class ContractController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->authorize('index', Contract::class);
        return view('contract/index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->authorize('create', Contract::class);
        return view('contract/edit')->with('item', new contract);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->authorize(Contract::class);

        $contract = new Contract();
        $contract->store_id             = $request->input('store_id');
        $contract->name                 = $request->input('name');
        $contract->location_id          = $request->input('location_id');
        $contract->contact_id_1         = $request->input('contact_id_1');
        $contract->contact_id_2         = $request->input('contact_id_2');
        $contract->start_date           = $request->input('start_date');
        $contract->end_date             = $request->input('end_date');
        $contract->billing_date         = $request->input('billing_date');
        $contract->payment_date         = $request->input('payment_date');
        $contract->terms_and_conditions = $request->input('terms_and_conditions');
        $contract->notes                = $request->input('notes');
        $contract->user_id              = Auth::id();

        if ($contract->save()) {
            return redirect()->route('contract.index');
        }
        return response()->json(['errors' => $contract->getErrors()], 500);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Contact  $contact
     * @return \Illuminate\Http\Response
     */
    public function show(Contact $contact)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Contact  $contact
     * @return \Illuminate\Http\Response
     */
    public function edit($contactId)
    {
        if (is_null($item = Contract::find($contactId))) {
            return redirect()->route('contract.index')
                ->with('error', trans('admin/companies/message.does_not_exist'));
        }

        $this->authorize('update', $item);
        return view('contract/edit', compact('item'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Contact  $contact
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $componentId = null)
    {
        if (is_null($contract = Contract::find($componentId))) {
            return redirect()->route('contract.index')->with('error', trans('admin/components/message.does_not_exist'));
        }

        $this->authorize('update', $contract);
        $contract->store_id             = $request->input('store_id');
        $contract->name                 = $request->input('name');
        $contract->location_id          = $request->input('location_id');
        $contract->contact_id_1         = $request->input('contact_id_1');
        $contract->contact_id_2         = $request->input('contact_id_2');
        $contract->start_date           = $request->input('start_date');
        $contract->end_date             = $request->input('end_date');
        $contract->billing_date         = $request->input('billing_date');
        $contract->payment_date         = $request->input('payment_date');
        $contract->terms_and_conditions = $request->input('terms_and_conditions');
        $contract->notes                = $request->input('notes');
        $contract->user_id              = Auth::id();
        if ($contract->save()) {
            return redirect()->route('contract.index')
                ->with('success', trans('admin/companies/message.update.success'));
        }
        return redirect()->route('contract.edit', ['contract' => $componentId])
            ->with('error', trans('admin/companies/message.update.error'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Contact  $contact
     * @return \Illuminate\Http\Response
     */
    public function destroy($contactId)
    {
        if (is_null($contract = Contract::find($contactId))) {
            return redirect()->route('contract.index')
                ->with('error', trans('admin/companies/message.not_found'));
        } else {

            $this->authorize('delete', $contract);

            try {
                $contract->delete();
                return redirect()->route('contract.index')
                    ->with('success', trans('admin/companies/message.delete.success'));
            } catch (\Illuminate\Database\QueryException $exception) {
            /*
                 * NOTE: This happens when there's a foreign key constraint violation
                 * For example when rows in other tables are referencing this company
                 */
                if ($exception->getCode() == 23000) {
                    return redirect()->route('contract.index')
                        ->with('error', trans('admin/companies/message.assoc_users'));
                } else {
                    throw $exception;
                }
            }
        }
    }
}
