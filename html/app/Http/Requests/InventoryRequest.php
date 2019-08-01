<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;

class InventoryRequest extends Request
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
        if (request('company_id') === null && request('store_id') === null && request('department_id') === null && request('contract_id') === null) {
            return [
                "company_id"                => 'required',
                "store_id"                  => 'required',
                "department_id"             => 'required',
                'contract_id'               => 'required',
                'inventory_date'            => 'required',
            ];      
        } else {
            return [
                'inventory_date'            => 'required',
            ];  
        }
    }
}
