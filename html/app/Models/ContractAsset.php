<?php

namespace App\Models;

use App\Models\SnipeModel;
use Watson\Validating\ValidatingTrait;
use App\Models\Traits\Searchable;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Presenters\Presentable;

final class ContractAsset extends SnipeModel
{
    protected $presenter = 'App\Presenters\ContractAssetsPresenter';
    protected $table = 'contract_assets';

    protected $rules = [
        'contract_id' => 'required',
        'asset_id' => 'required',
        'user_id' => 'required',
    ];
    use ValidatingTrait;
    use Searchable;
    use Loggable, Presentable;
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

    public function assetlog()
    {
        return $this->hasMany('\App\Models\Actionlog', 'item_id')->where('item_type', Component::class)->orderBy('created_at', 'desc')->withTrashed();
    }
}
