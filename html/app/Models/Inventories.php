<?php
namespace App\Models;

use App\Models\Traits\Searchable;
use App\Presenters\Presentable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Watson\Validating\ValidatingTrait;

/** 
 * Model for Inventories.
 *
 * @version    v1.0
 */
class Inventories extends SnipeModel
{
    protected $presenter = 'App\Presenters\InventoryPresenter';
    
    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
        'inventory_date',
        'last_checkout',
        'expected_checkin',
        'last_audit_date',
        'next_audit_date'
    ];
    protected $table = 'inventories';
    
    public $rules = array(
        'inventory_date'      => 'required'
    );

    use ValidatingTrait;

    protected $fillable = [
        'contract_id',
        'inventory_date',
        'name',
        'notes',
        'user_id'
    ];

    use Searchable;
    public function contract()
    {
    	return $this->belongsTo('\App\Models\Contract','contract_id');
    }
  
}
