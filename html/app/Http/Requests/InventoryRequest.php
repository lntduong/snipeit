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
        $rules = [
            "company_id"                => 'required_without:contract_id',
            'contract_id'               => 'required_without:company_id',
            'inventory_date'            => 'required',
      
            
        ];
        return $rules;
    }
}
