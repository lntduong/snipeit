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
        'inventory_date'    => 'required',
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
        'object_type',
        'object_id',
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
     protected $searchableAttributes = [
         'name',
         'notes',
         'inventory_date'
        ];
      
    /**
     * The relations and their attributes that should be included when searching the model.
     * 
     * @var array
     */
    protected $searchableRelations = [
        'store'      => ['name'],
        'company'    => ['name'],
        'department' => ['name'],
        'contract'   => ['name']
    ];       
  
    // /**
    // * get contract
    // */
  
    public function contract()
    {
    	return $this->belongsTo('\App\Models\Contract','object_id');
    }
    public function company()
    {
        return $this->belongsTo('\App\Models\Company','object_id')
        ->select(['companies.*'])
        ->join('inventories','companies.id', '=' , 
        \DB::raw('(CASE WHEN inventories.object_type = "App\\\Models\\\Company" THEN inventories.object_id ELSE null END )' ));
    }
    public function store()
    {
        return $this->belongsTo('\App\Models\Store','object_id')
        ->select(['stores.*', 'companies.name as company_name', 'companies.id as company_id'])
        ->leftJoin('inventories','stores.id', '=' , 
        \DB::raw('(CASE WHEN inventories.object_type = "App\\\Models\\\Store" THEN inventories.object_id ELSE null END )' ))
        ->leftJoin('companies','companies.id', '=' , 'stores.company_id');
    }
    public function department()
    {
        return $this->belongsTo('\App\Models\Department','object_id')
        ->select(['departments.*', 'stores.name as store_name', 'stores.id as store_id', 'companies.name as company_name', 'companies.id as company_id'])
        ->join('inventories','departments.id', '=' , 'inventories.object_id')
        ->join('stores','stores.id', '=' , 'departments.store_id')
        ->join('companies','stores.company_id', '=' , 'companies.id')
        ->where("inventories.object_type","=",\DB::raw('"App\\\Models\\\Department"'));
    }
    public function inventoryresult()
    {
    	return $this->belongsTo('\App\Models\InventoryResult','id','inventory_id');
    }
  
}
