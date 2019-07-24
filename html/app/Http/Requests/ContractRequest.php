<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;

class ContractRequest extends Request
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        if (request('checkout_to_type_contract')=='company') {
            return [
                'name' => 'required',
                'start_date' => 'required',
                'end_date'  => 'required|after:start_date',
                'billing_date'  => 'required',
                'assigned_company' => 'required'
            ];      
        } elseif (request('checkout_to_type_contract')=='store') {
            return [
                'name' => 'required',
                'start_date' => 'required',
                'end_date'  => 'required|after:start_date',
                'billing_date'  => 'required',
                'assigned_company' => 'required',
                'assigned_store' =>'required'
            ];
        } elseif (request('checkout_to_type_contract')=='department') {
            return [
                'name' => 'required',
                'start_date' => 'required',
                'end_date'  => 'required|after:start_date',
                'billing_date'  => 'required',
                'assigned_company' => 'required',
                'assigned_store' =>'required',
                'assigned_department' =>'required'
            ];
        } else {
            return [
                'name' => 'required',
                'start_date' => 'required',
                'end_date'  => 'required|after:start_date',
                'billing_date'  => 'required',
                'assigned_company' => 'required'
            ];   
        }
    }

    public function messages()
    {
        return [
            'assigned_company.required' => 'The company field is required.',
            'assigned_store.required' => 'The store field is required.',
            'assigned_department.required' => 'The department field is required.'
        ];
    }

    public function response(array $errors)
    {
        return $this->redirector->back()->withInput()->withErrors($errors, $this->errorBag);
    }
}
