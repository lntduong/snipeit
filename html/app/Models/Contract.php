<?php
namespace App\Models;

use App\Models\SnipeModel;
use Watson\Validating\ValidatingTrait;
use App\Models\Traits\Searchable;
use Illuminate\Database\Eloquent\SoftDeletes;

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
        'user'       => ['last_name'],
        'user2'      => ['last_name'],
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
        'notes'
    ];
    public $sortable = ['id', 'name', 'company', 'department', 'store', 'location', 'user', 'user2'];

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
        ->join('contracts','companies.id', '=' , 
        \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Company" THEN contracts.object_id ELSE null END )' ));
    }

    public function store()
    {
        return $this->belongsTo('\App\Models\Store', 'object_id', 'id')
        ->select(['stores.*', 'companies.name as company_name', 'companies.id as company_id'])
        ->leftJoin('contracts','stores.id', '=' , 
        \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Store" THEN contracts.object_id ELSE null END )' ))
        ->leftJoin('companies','companies.id', '=' , 'stores.company_id');
    }
    
    public function department()
    {
        return $this->belongsTo('\App\Models\Department', 'object_id', 'id')
        ->select(['departments.*', 'stores.name as store_name', 'stores.id as store_id', 'companies.name as company_name', 'companies.id as company_id'])
        ->join('contracts','departments.id', '=' , 'contracts.object_id')
        ->join('stores','stores.id', '=' , 'departments.store_id')
        ->join('companies','stores.company_id', '=' , 'companies.id')
        ->where("contracts.object_type","=",\DB::raw('"App\\\Models\\\Department"'));
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
        return $query->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"') )
                ->whereIn('contracts.object_id', 
                    Department::select('departments.id')
                    ->join('stores','stores.id', '=', 'departments.store_id')
                    ->join('companies','companies.id', '=', 'stores.company_id')
                    ->where('companies.id','=',$input)
                );
    }

    public function scopeFilterStoreInCompany($query, $input) {
        return $query
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
            ->whereIn('contracts.object_id', 
                Store::select('stores.id')
                ->join('companies','companies.id', '=', 'stores.company_id')
                ->where('companies.id','=',$input)
            );
    }

    public function scopeFilterCompanyInCompany($query, $input) {
        return $query
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
            ->where('contracts.object_id', '=', $input);
    }

    public function scopeFilterDepartmentInStore($query, $input) {
        return $query
            ->orWhere('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"') )
            ->whereIn('contracts.object_id', 
                Department::select('departments.id')
                ->join('stores','stores.id', '=', 'departments.store_id')
                ->where('stores.id','=',$input)
            );
    }

    public function scopeFilterStoreInStore($query, $input) {
        return $query
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
            ->where('contracts.object_id', '=', $input);
    }

    public function scopeFilterDepartmentInDepartment($query, $input) {
        return $query
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"') )
            ->whereIn('contracts.object_id', 
                Department::select('departments.id')
                ->where('departments.id','=',$input)
            );
    }

    /*
    * Sort Company, Store, Department
    */
    public function scopeSortCompany($query, $order) {
        return $query
            ->join('companies', 'companies.id', '=', 
            \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Company" THEN contracts.object_id ELSE null END )' ))
            ->union(
                Contract::select('contracts.*', 'companies.name as companies', 'companies.id')
                ->join('stores', 'stores.id', '=', 
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Store" THEN contracts.object_id ELSE null END )' ))
                ->join('companies', 'stores.company_id', '=', 'companies.id')
                )
            ->union(
                Contract::select('contracts.*', 'companies.name as companies', 'companies.id')
                ->join('departments', 'departments.id', '=',  
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Department" THEN contracts.object_id ELSE null END )' ))
                ->join('stores', 'stores.id', '=', 'departments.store_id')
                ->join('companies', 'companies.id', '=', 'stores.company_id'))
            ->orderBy('companies', $order);
    }

    public function scopeSortStore($query, $order) {
        return $query
            ->join('stores', 'stores.id', '=', 
            \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Store" THEN contracts.object_id ELSE null END )' ))
            ->union(
                Contract::select('contracts.*', \DB::raw('null as stores'),  \DB::raw('null as stores_id'))
                ->join('companies', 'companies.id', '=', 
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Company" THEN contracts.object_id ELSE null END )' ))   
                )
            ->union(
                Contract::select('contracts.*', 'stores.name as stores', 'stores.id as stores_id')
                ->join('departments', 'departments.id', '=',  
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Department" THEN contracts.object_id ELSE null END )' ))
                ->join('stores', 'stores.id', '=', 'departments.store_id')
                )
            ->orderBy('stores', $order);
    }

    public function scopeSortStoreCompany($query, $order, $input) {
        return $query
            ->join('stores', 'stores.id', '=', 
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Store" THEN contracts.object_id ELSE null END )' ))
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('companies.id','=',$input)
            ->union(
                Contract::select('contracts.*', \DB::raw('null as stores'),  \DB::raw('null as stores_id'))
                ->join('companies', 'companies.id', '=', 
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Company" THEN contracts.object_id ELSE null END )' ))
                ->where('companies.id','=',$input)
                )
            ->union(
                Contract::select('contracts.*', 'stores.name as stores', 'stores.id as stores_id')
                ->join('departments', 'departments.id', '=',  
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Department" THEN contracts.object_id ELSE null END )' ))
                ->join('stores', 'stores.id', '=', 'departments.store_id')
                ->join('companies', 'companies.id', '=', 'stores.company_id')
                ->where('companies.id','=',$input)
                )
            ->orderBy('stores', $order);
    }

    public function scopeSortDepartment($query, $order) {
        return $query
            ->join('departments', 'departments.id', '=',  
            \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Department" THEN contracts.object_id ELSE null END )' ))
            ->join('stores', 'stores.id', '=', 'departments.store_id')
        ->union(
            Contract::select('contracts.*', \DB::raw('null as departments'),  \DB::raw('null as departments_id'))
            ->join('companies', 'companies.id', '=', 
            \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Company" THEN contracts.object_id ELSE null END )' ))   
            )
        ->union(
            Contract::select('contracts.*', \DB::raw('null as departments'),  \DB::raw('null as departments_id'))
            ->join('companies', 'companies.id', '=', 
            \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Store" THEN contracts.object_id ELSE null END )' ))          
            )
        ->orderBy('departments', $order);
    }

    public function scopeSortCompanyDepartment($query, $order, $input) {
        return $query
            ->join('departments', 'departments.id', '=',  
            \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Department" THEN contracts.object_id ELSE null END )' ))
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('companies.id','=',$input)        
            ->union(
                Contract::select('contracts.*', \DB::raw('null as departments'),  \DB::raw('null as departments'))
                ->join('companies', 'companies.id', '=', 
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Company" THEN contracts.object_id ELSE null END )' ))
                ->where('companies.id','=',$input)
                )
            ->union(
                Contract::select('contracts.*', \DB::raw('null as departments'),  \DB::raw('null as departments'))
                ->join('stores', 'stores.id', '=', 
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Store" THEN contracts.object_id ELSE null END )' ))
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('companies.id','=',$input)
                )
            ->orderBy('departments', $order);
    }

    public function scopeSortStoreDepartment($query, $order, $input) {
        return $query
            ->join('departments', 'departments.id', '=',  
            \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Department" THEN contracts.object_id ELSE null END )' ))
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->where('stores.id','=',$input)        
            ->union(
                Contract::select('contracts.*', \DB::raw('null as departments'),  \DB::raw('null as departments'))
                ->join('stores', 'stores.id', '=', 
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Store" THEN contracts.object_id ELSE null END )' ))
            ->where('stores.id','=',$input)
                )
            ->orderBy('departments', $order);
    }

    public function scopeOrderLocation($query, $order)
    {
        return $query->leftJoin('locations', 'contracts.location_id', '=', 'locations.id')->orderBy('locations.name', $order);
    }

    public function scopeOrderContactOne($query, $order)
    {
        return $query->leftJoin('users', 'users.id', '=', 'contracts.contact_id_1')->orderBy('users.last_name', $order);
    }

    public function scopeOrderContactTwo($query, $order)
    {
        return $query->leftJoin('users', 'users.id', '=', 'contracts.contact_id_2')->orderBy('users.last_name', $order);
    }

    public function scopeOrderDate($query, $fields, $order)
    {
        return $query->orderBy($fields, $order);
    }
}
