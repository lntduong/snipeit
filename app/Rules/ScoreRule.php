<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class ScoreRule implements Rule
{
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        $check = (double)$value * 10;
        if($check % 5 == 0 && strlen($check) <= 2) {
            return true;
            echo strlen($check);
        }
        return false;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'The :attribute should be 0 | 0.5 | 1 | 1.5 | ... | 9.5 | 10';
    }
}
