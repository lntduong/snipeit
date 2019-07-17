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
class Inventory extends SnipeModel
{
    protected $presenter = 'App\Presenters\InventoryPresenter';
    use CompanyableTrait;
    use Loggable, Presentable;
    use SoftDeletes;

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
        'inventory_date',
    ];
    protected $table = 'inventories';
    
    // /**
    // * Category validation rules
    // */
    public $rules = array(
        'inventory_date'      => 'required',
        'contract_id'  => 'required|integer',
    );

    /**
    * Whether the model should inject it's identifier to the unique
    * validation rules before attempting validation. If this property
    * is not set in the model it will default to true.
    *
    * @var boolean
    */
    protected $injectUniqueIdentifier = true;
    use ValidatingTrait;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'contract_id',
        'inventory_date',
        'name',
        'notes',
        'user_id'
    ];

    use Searchable;
    
    /**
     * The attributes that should be included when searching the model.
     * 
     * @var array
     */
     protected $searchableAttributes = ['name','notes'];

    /**
     * The relations and their attributes that should be included when searching the model.
     * 
     * @var array
     */
    protected $searchableRelations = [
        'contract'     => ['name'],
    ];      
  
    // /**
    // * get contract
    // */
  
    public function contract()
    {
    	return $this->belongsTo('\App\Models\Contract','contract_id');
    }
    public function inventoryresult()
    {
    	return $this->belongsTo('\App\Models\InventoryResult','id','inventory_id');
    }
  
}
