<?php

namespace App\Models;

use App\Models\SnipeModel;
use Watson\Validating\ValidatingTrait;
use App\Models\Traits\Searchable;
use Illuminate\Database\Eloquent\SoftDeletes;


final class ContractAsset extends SnipeModel
{
    protected $table = 'contract_assets';

    protected $rules = [
        'contract_id' => 'required',
        'asset_id' => 'required',
        'user_id' => 'required',
    ];
    use ValidatingTrait;
    use Searchable;
    use Loggable;
    use SoftDeletes;
    protected $dates = ['deleted_at'];

    protected $fillable = ['contract_id', 'asset_id', 'user_id', 'deleted_at'];
    public function asset()
    {
        return $this->belongsTo('\App\Models\Asset', 'asset_id');
    }

    public function contract()
    {
        return $this->belongsTo(Contract::class);
    }
}
