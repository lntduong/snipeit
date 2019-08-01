<?php
namespace App\Models;

use App\Models\Traits\Searchable;
use App\Presenters\Presentable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Watson\Validating\ValidatingTrait;

/**
 * Model for Components.
 *
 * @version    v1.0
 */
class InventoryResult extends SnipeModel
{
    protected $presenter = 'App\Presenters\InventoryResultPresenter';
    use CompanyableTrait;
    use Loggable, Presentable;
    use SoftDeletes;

    protected $dates = [
        'created_at',
        'updated_at',
        'checked_time',
    ];
    protected $table = 'inventory_results';

    public $rules = array(
        'asset_id'      => 'required',
        'inventory_id'      => 'required',
    );
    protected $searchableAttributes = [
        'name',
        'notes',
        'inventory_date'
       ];
    protected $injectUniqueIdentifier = true;
    use ValidatingTrait;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'inventory_id',
        'familiar',
        'asset_id',
        'checked_time',
        'user_id'

    ];

    use Searchable;

    /**
     * The attributes that should be included when searching the model.
     *
     * @var array
     */


    public function inventories()
    {
    	return $this->belongsTo('\App\Models\Inventory','inventory_id');
    }
    public function asset()
    {
    	return $this->belongsTo('\App\Models\Asset','asset_id');
    }


}
