<?php
namespace App\Models;

use App\Models\SnipeModel;
use Watson\Validating\ValidatingTrait;
use App\Models\Traits\Searchable;
/**
 * @author [Duong.LNT]
 * @email: duong.lnt@vn.vinx.asia 
 */
final class ContractAssets extends SnipeModel
{
    protected $table = 'contract_assets';

    protected $presenter = 'App\Presenters\ContractPresenter';
    
    use Searchable;
    protected $fillable = ['contract_id' , 'asset_id' , 'user_id'];
    public function asset()
    {
        return $this->belongsToMany(Asset::class);
    }

    public function contract()
    {
        return $this->belongsTo(Contract::class);
    }
}
