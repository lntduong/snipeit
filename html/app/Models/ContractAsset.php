<?php
namespace App\Models;

use App\Models\SnipeModel;
use Watson\Validating\ValidatingTrait;


final class ContractAsset extends SnipeModel
{
    protected $table = 'contracts_assets';

    protected $rules = [
        'contract_id' => 'required',
        'asset_id' => 'required',
        'user_id' => 'required',
    ];

    // protected $presenter = 'App\Presenters\ContractPresenter';

    use ValidatingTrait;

    // protected $searchableAttributes = ['name', 'created_at', 'updated_at']; 
    protected $fillable = [
                            'contract_id' , 
                            'asset_id' ,
                            'user_id',
                        ];
}
