<?php

namespace App\Http\Requests;
use App\Helpers\Helper;

use Illuminate\Foundation\Http\FormRequest;
class StoreRequest extends FormRequest
{

    // protected $rules = [
    //     'user_id' => 'required',
    //     'score' => 'required|numeric|min:0|max:10',
    // ];

    public function rules()
    {
        return $rules = [
            'name' => 'required',
        ];
    }
    public function authorize()
    {
        return true;
    }

    public function response(array $errors)
    {
        if ($this->ajax() || $this->wantsJson())
        {
            return Helper::formatStandardApiResponse('error', null, $errors);
        }

        return $this->redirector->to($this->getRedirectUrl())
            ->withInput($this->except($this->dontFlash))
            ->withErrors($errors, $this->errorBag);
    }
}
