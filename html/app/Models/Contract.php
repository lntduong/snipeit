<?php
namespace App\Models;

use App\Models\SnipeModel;
use Watson\Validating\ValidatingTrait;
use App\Models\Traits\Searchable;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;
use Illuminate\Database\Eloquent\Builder;
final class Contract extends SnipeModel
{
    protected $table = 'contracts';

    protected $presenter = 'App\Presenters\ContractPresenter';
    public $rules = array(
            'name' => 'required|unsame_name:contracts,object_id',
            'start_date' => 'required',
            'end_date'  => 'required',
            'billing_date' => 'required',
            'object_id' => 'required',
    );
    use ValidatingTrait;
    use Searchable;
    use Loggable;
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $searchableAttributes = [
        'name', 
        'created_at', 
        'updated_at',
        'start_date',
        'end_date',
        'billing_date',
        'payment_date',
        'terms_and_conditions',
        'notes'
    ]; 
    protected $searchableRelations = [
        'store'      => ['name'],
        'location'   => ['name'],
        'user'       => ['first_name', 'last_name', 'username'],
        'user2'      => ['first_name', 'last_name', 'username'],
        'company'    => ['name'],
        'department'  => ['name']
    ];   
    protected $fillable = [
        'id',
        'object_id' , 
        'object_type' ,
        'name' ,
        'location_id' ,
        'contact_id_1' ,
        'contact_id_2' ,
        'start_date' ,
        'end_date' ,
        'billing_date' ,
        'payment_date' ,
        'terms_and_conditions' ,
        'notes',
        'deleted_at'
    ];
    public $sortable = ['id', 'name', 'company', 'department', 'store', 'location', 'user', 'user2'];
    protected $conditionCompany;
    protected $conditionStore; 
    protected $conditionDepartment;
    protected $objectTypeCompany;
    protected $objectTypeStore;
    protected $objectTypeDepartment;

    public function __construct()
    {
        $this->objectTypeCompany = \DB::raw('"App\\\Models\\\Company"') ;
        $this->objectTypeStore = \DB::raw('"App\\\Models\\\Store"');
        $this->objectTypeDepartment = \DB::raw('"App\\\Models\\\Department"');
        $this->conditionCompany = \DB::raw('(CASE WHEN contracts.object_type = ' .$this->objectTypeCompany. 'THEN contracts.object_id ELSE null END )' );
        $this->conditionStore = \DB::raw('(CASE WHEN contracts.object_type = ' .$this->objectTypeStore. ' THEN contracts.object_id ELSE null END )' );
        $this->conditionDepartment = \DB::raw('(CASE WHEN contracts.object_type = ' .$this->objectTypeDepartment. ' THEN contracts.object_id ELSE null END )' );
    }

    public function user()
    {
        return $this->belongsTo('\App\Models\User', 'contact_id_1');
    }

    public function user2()
    {
        return $this->belongsTo('\App\Models\User', 'contact_id_2');
    }

    public function location()
    {
        return $this->belongsTo('\App\Models\Location', 'location_id');
    }

    public function company()
    {
        return $this->belongsTo('\App\Models\Company', 'object_id', 'id')
        ->select(['companies.*'])
        ->join('contracts','companies.id', '=', $this->conditionCompany);
    }

    public function store()
    {
        return $this->belongsTo('\App\Models\Store', 'object_id', 'id')
        ->select(['stores.*', 'companies.name as company_name', 'companies.id as company_id'])
        ->leftJoin('contracts','stores.id', '=', $this->conditionStore)
        ->leftJoin('companies','companies.id', '=', 'stores.company_id');
    }
    
    public function department()
    {
        return $this->belongsTo('\App\Models\Department', 'object_id', 'id')
        ->select(['departments.*', 'stores.name as store_name', 'stores.id as store_id', 'companies.name as company_name', 'companies.id as company_id'])
        ->join('contracts','departments.id', '=', 'contracts.object_id')
        ->join('stores','stores.id', '=', 'departments.store_id')
        ->join('companies','stores.company_id', '=', 'companies.id')
        ->where("contracts.object_type", "=", $this->objectTypeDepartment);
    }
    public function asset()
    {
        return $this->belongsToMany(Asset::class);
    }

    public function contract_assets()
    {
    	return $this->belongsTo('\App\Models\ContractAsset','id','contract_id');
    }

    public function assetlog()
    {
        return $this->hasMany('\App\Models\Actionlog', 'item_id')->where('item_type', Component::class)->orderBy('created_at', 'desc')->withTrashed();
    }

    /*
    * Filter Company, Store, Department
    */

    public function scopeFilterDepartmentInCompany($query, $input) {
        return $query->where('contracts.object_type', '=' ,$this->objectTypeDepartment)
                ->whereIn('contracts.object_id', 
                    Department::select('departments.id')
                    ->join('stores','stores.id', '=', 'departments.store_id')
                    ->join('companies','companies.id', '=', 'stores.company_id')
                    ->where('companies.id', '=', $input)
                    ->whereNull('contracts.deleted_at')
                );
    }

    public function scopeFilterStoreInCompany($query, $input) {
        return $query
            ->where('contracts.object_type', '=', $this->objectTypeStore)
            ->whereIn('contracts.object_id', 
                Store::select('stores.id')
                ->join('companies','companies.id', '=', 'stores.company_id')
                ->where('companies.id', '=', $input)
                ->whereNull('contracts.deleted_at')
            );
    }

    public function scopeFilterCompanyInCompany($query, $input) {
        return $query
            ->where('contracts.object_type', '=', $this->objectTypeCompany)
            ->where('contracts.object_id', '=', $input)
            ->whereNull('contracts.deleted_at');
    }

    public function scopeFilterDepartmentInStore($query, $input) {
        return $query
            ->orWhere('contracts.object_type', '=', $this->objectTypeDepartment)
            ->whereIn('contracts.object_id', 
                Department::select('departments.id')
                ->join('stores','stores.id', '=', 'departments.store_id')
                ->where('stores.id', '=', $input)
                ->whereNull('contracts.deleted_at')
            );
    }

    public function scopeFilterStoreInStore($query, $input) {
        return $query
            ->where('contracts.object_type', '=', $this->objectTypeStore)
            ->where('contracts.object_id', '=', $input)
            ->whereNull('contracts.deleted_at');
    }

    public function scopeFilterDepartmentInDepartment($query, $input) {
        return $query
            ->where('contracts.object_type', '=', $this->objectTypeDepartment)
            ->whereIn('contracts.object_id', 
                Department::select('departments.id')
                ->where('departments.id', '=', $input)
                ->whereNull('contracts.deleted_at')
            );
    }

    /*
    * Sort Company, Store, Department
    */
    public function scopeSortCompany($query, $order) {
        $store = Contract::select('contracts.*', 'companies.name as company_name')
                ->join('stores', 'stores.id', '=', $this->conditionStore)               
                ->join('companies', 'stores.company_id', '=', 'companies.id')
                ->whereNull('contracts.deleted_at');
        
        $department = Contract::select('contracts.*', 'companies.name as company_name')
                ->join('departments', 'departments.id', '=',  $this->conditionDepartment)
                ->join('stores', 'stores.id', '=', 'departments.store_id')
                ->join('companies', 'companies.id', '=', 'stores.company_id')
                ->whereNull('contracts.deleted_at');

        return $query
            ->join('companies', 'companies.id', '=', $this->conditionCompany)
            ->union($store)
            ->union($department)
            ->whereNull('contracts.deleted_at')
            ->orderBy('company_name', $order);
    }

    public function scopeSortStore($query, $order) {
        $company = Contract::select('contracts.*', \DB::raw('null as stores'),  \DB::raw('null as stores_id'))
            ->join('companies', 'companies.id', '=', $this->conditionCompany)
            ->whereNull('contracts.deleted_at');

        $department = Contract::select('contracts.*', 'stores.name as stores', 'stores.id as stores_id')
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->whereNull('contracts.deleted_at');

        return $query
            ->join('stores', 'stores.id', '=', $this->conditionStore)
            ->union($company)
            ->union($department)
            ->whereNull('contracts.deleted_at')
            ->orderBy('stores', $order);
    }

    public function scopeSortStoreCompany($query, $order, $input) {
        $company = Contract::select('contracts.*', \DB::raw('null as stores'),  \DB::raw('null as stores_id'))
                ->join('companies', 'companies.id', '=', $this->conditionCompany)
                ->where('companies.id','=',$input)
                ->whereNull('contracts.deleted_at');

        $department = Contract::select('contracts.*', 'stores.name as stores', 'stores.id as stores_id')
                ->join('departments', 'departments.id', '=', $this->conditionDepartment)
                ->join('stores', 'stores.id', '=', 'departments.store_id')
                ->join('companies', 'companies.id', '=', 'stores.company_id')
                ->where('companies.id','=',$input)
                ->whereNull('contracts.deleted_at');

        return $query
            ->join('stores', 'stores.id', '=', $this->conditionStore)
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('companies.id','=',$input)
            ->union($company)
            ->union($department)
            ->whereNull('contracts.deleted_at')
            ->orderBy('stores', $order);
    }

    public function scopeSortDepartment($query, $order) {

        $company = Contract::select('contracts.*', \DB::raw('null as departments'),  \DB::raw('null as departments_id'))
                ->join('companies', 'companies.id', '=', $this->conditionCompany)
                ->whereNull('contracts.deleted_at');  

        $store = Contract::select('contracts.*', \DB::raw('null as departments'),  \DB::raw('null as departments_id'))
            ->join('stores', 'stores.id', '=', $this->conditionStore)    
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->whereNull('contracts.deleted_at');

        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->union($company)
            ->union($store)
            ->whereNull('contracts.deleted_at')
            ->orderBy('departments', $order);
    }

    public function scopeSortCompanyDepartment($query, $order, $input) {
        $company = Contract::select('contracts.*', \DB::raw('null as departments'),  \DB::raw('null as departments'))
                ->join('companies', 'companies.id', '=', $this->conditionCompany)
                ->where('companies.id','=',$input)
                ->whereNull('contracts.deleted_at');

        $store = Contract::select('contracts.*', \DB::raw('null as departments'),  \DB::raw('null as departments'))
                ->join('stores', 'stores.id', '=', $this->conditionStore)
                ->join('companies', 'companies.id', '=', 'stores.company_id')
                ->where('companies.id','=',$input)
                ->whereNull('contracts.deleted_at');

        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('companies.id','=',$input)        
            ->union($company)
            ->union($store)
            ->whereNull('contracts.deleted_at')
            ->orderBy('departments', $order);
    }

    public function scopeSortStoreDepartment($query, $order, $input) {
        $store =  Contract::select('contracts.*', \DB::raw('null as departments'),  \DB::raw('null as departments'))
                ->join('stores', 'stores.id', '=', $this->conditionStore)
                ->where('stores.id', '=', $input)
                ->whereNull('contracts.deleted_at');

        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->where('stores.id', '=', $input)        
            ->union($store)
            ->whereNull('contracts.deleted_at')
            ->orderBy('departments', $order);
    }

    public function scopeOrderLocation($query, $order)
    {
        return $query->leftJoin('locations', 'contracts.location_id', '=', 'locations.id')->orderBy('locations.name', $order);
    }

    public function scopeOrderLocationCompany($query, $order, $input)
    {

        $company = Contract::select('contracts.*', \DB::raw('locations.name AS location_name'))
                ->join('companies', 'companies.id', '=', $this->conditionCompany)
                ->leftJoin('locations', 'contracts.location_id', '=', 'locations.id')
                ->where('companies.id','=',$input)
                ->whereNull('contracts.deleted_at');

        $store = Contract::select('contracts.*', \DB::raw('locations.name AS location_name'))
                ->join('stores', 'stores.id', '=', $this->conditionStore)
                ->join('companies', 'companies.id', '=', 'stores.company_id')
                ->leftJoin('locations', 'contracts.location_id', '=', 'locations.id')
                ->where('companies.id','=',$input)
                ->whereNull('contracts.deleted_at');

        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->leftJoin('locations', 'contracts.location_id', '=', 'locations.id')
            ->where('companies.id','=',$input)     
            ->union($company)
            ->union($store)
            ->whereNull('contracts.deleted_at')
            ->orderBy('location_name', $order);
    }

    public function scopeOrderLocationStore($query, $order, $input)
    {
        $store = Contract::select('contracts.*', \DB::raw('locations.name AS location_name'))
                ->join('stores', 'stores.id', '=', $this->conditionStore)
                ->join('companies', 'companies.id', '=', 'stores.company_id')
                ->leftJoin('locations', 'contracts.location_id', '=', 'locations.id')
                ->where('stores.id','=',$input)
                ->whereNull('contracts.deleted_at');

        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->leftJoin('locations', 'contracts.location_id', '=', 'locations.id')
            ->where('stores.id','=',$input)     
            ->union($store)
            ->whereNull('contracts.deleted_at')
            ->orderBy('location_name', $order);
    }

    public function scopeOrderLocationDepartment($query, $order, $input)
    {
        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->leftJoin('locations', 'contracts.location_id', '=', 'locations.id')
            ->where('departments.id','=',$input)   
            ->whereNull('contracts.deleted_at')  
            ->orderBy('location_name', $order);
    }

    public function scopeOrderContactOne($query, $order)
    {
        return $query->leftJoin('users', 'users.id', '=', 'contracts.contact_id_1')->orderBy('users.last_name', $order);
    }

    public function scopeOrderContactCompany($query, $field, $order, $input)
    {

        $company = Contract::select('contracts.*', \DB::raw('users.last_name AS last_name'))
                ->join('companies', 'companies.id', '=', $this->conditionCompany)
                ->leftJoin('users', 'users.id', '=', $field)
                ->where('companies.id','=',$input)
                ->whereNull('contracts.deleted_at');

        $store = Contract::select('contracts.*', \DB::raw('users.last_name AS last_name'))
                ->join('stores', 'stores.id', '=', $this->conditionStore)
                ->join('companies', 'companies.id', '=', 'stores.company_id')
                ->leftJoin('users', 'users.id', '=', $field)
                ->where('companies.id','=',$input)
                ->whereNull('contracts.deleted_at');

        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->leftJoin('users', 'users.id', '=', $field)
            ->where('companies.id','=',$input)     
            ->union($company)
            ->union($store)
            ->whereNull('contracts.deleted_at')
            ->orderBy('last_name', $order);
    }

    public function scopeOrderContactStore($query, $field, $order, $input)
    {
        $store = Contract::select('contracts.*', \DB::raw('users.last_name AS last_name'))
                ->join('stores', 'stores.id', '=', $this->conditionStore)
                ->join('companies', 'companies.id', '=', 'stores.company_id')
                ->leftJoin('users', 'users.id', '=', $field)
                ->where('stores.id','=',$input)
                ->whereNull('contracts.deleted_at');

        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->leftJoin('users', 'users.id', '=', $field)
            ->where('stores.id','=',$input)     
            ->union($store)
            ->whereNull('contracts.deleted_at')
            ->orderBy('last_name', $order);
    }

    public function scopeOrderContactDepartment($query, $field, $order, $input)
    {
        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->leftJoin('users', 'users.id', '=', $field)
            ->where('departments.id','=',$input)
            ->whereNull('contracts.deleted_at')     
            ->orderBy('last_name', $order);
    }


    public function scopeOrderContactTwo($query, $order)
    {
        return $query->leftJoin('users', 'users.id', '=', 'contracts.contact_id_2')->orderBy('users.last_name', $order);
    }

    public function scopeOrderDate($query, $fields, $order)
    {
        return $query->orderBy($fields, $order);
    }

    public function scopeTotalCompany($query, $field, $input)
    {
        return $query ->join('companies', 'companies.id', '=', $this->conditionCompany)
            ->where($field, '=', $input)
            ->whereNull('contracts.deleted_at');
    }

    public function scopeTotalStore($query, $field, $input)
    {
        return $query 
            ->join('stores', 'stores.id', '=', $this->conditionStore)
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where($field, '=', $input)
            ->whereNull('contracts.deleted_at');
    }

    public function scopeTotalDepartment($query, $field, $input)
    {
        return $query 
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where($field, '=', $input)
            ->whereNull('contracts.deleted_at');
    }

    public function scopeDeleted($query)
    {
        return $query->whereNotNull('contracts.deleted_at');
    }

    public function advancedTextSearch(Builder $query, array $terms) {
      
        /**
         *  Users
         */
        $query = $query->leftJoin('users as contracts_users',function ($leftJoin) {
            $leftJoin->on("contracts_users.id", "=", "contracts.contact_id_1");
        });

        foreach($terms as $term) {

            $query = $query
            ->orWhere('contracts_users.first_name', 'LIKE', '%'.$term.'%')
            ->orWhere('contracts_users.last_name', 'LIKE', '%'.$term.'%')
            ->orWhere('contracts_users.username', 'LIKE', '%'.$term.'%')
            ->orWhereRaw('CONCAT('.DB::getTablePrefix().'contracts_users.first_name," ",'.DB::getTablePrefix().'contracts_users.last_name) LIKE ?', ["%$term%", "%$term%"]);      

        }

        /**
         *  Companies
         */
        $query = $query->leftJoin('companies as contracts_companies',function ($leftJoin) {
              $leftJoin->on("contracts_companies.id", "=", "contracts.object_id")
                  ->where("contracts.object_type", "=", $this->objectTypeCompany );
        });
  
        foreach($terms as $term) {
  
          $query = $query
            ->orWhere('contracts_companies.name', 'LIKE', '%'.$term.'%');
        }

        /**
         *  Stores
         */
        $query = $query->leftJoin('stores as contracts_store',function ($leftJoin) {
            $leftJoin->on("contracts_store.id", "=", "contracts.object_id")
                ->where("contracts.object_type", "=", $this->objectTypeStore );
        });

        foreach($terms as $term) {

            $query = $query
            ->orWhere('contracts_store.name', 'LIKE', '%'.$term.'%');
        }

        /**
         *  Departments
         */
        $query = $query->leftJoin('departments as contracts_department',function ($leftJoin) {
            $leftJoin->on("contracts_department.id", "=", "contracts.object_id")
                ->where("contracts.object_type", "=", $this->objectTypeDepartment );
        });

        foreach($terms as $term) {

            $query = $query
            ->orWhere('contracts_department.name', 'LIKE', '%'.$term.'%');
        }
        return $query;
      }
        
}