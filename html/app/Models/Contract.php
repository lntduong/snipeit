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
        'name' => 'required|duplicate_name:contracts',
        'start_date' => 'required',
        'end_date'  => 'required|after:start_date',
        'billing_date'  => 'required',
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
        'object_id',
        'object_type',
        'name',
        'location_id',
        'contact_id_1',
        'contact_id_2',
        'start_date',
        'end_date',
        'billing_date',
        'payment_date',
        'terms_and_conditions',
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
        $this->objectTypeCompany = \DB::raw('"App\\\Models\\\Company"');
        $this->objectTypeStore = \DB::raw('"App\\\Models\\\Store"');
        $this->objectTypeDepartment = \DB::raw('"App\\\Models\\\Department"');
        $this->conditionCompany = \DB::raw('(CASE WHEN contracts.object_type = ' . $this->objectTypeCompany . 'THEN contracts.object_id ELSE null END )');
        $this->conditionStore = \DB::raw('(CASE WHEN contracts.object_type = ' . $this->objectTypeStore . ' THEN contracts.object_id ELSE null END )');
        $this->conditionDepartment = \DB::raw('(CASE WHEN contracts.object_type = ' . $this->objectTypeDepartment . ' THEN contracts.object_id ELSE null END )');
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
            ->join('contracts', 'companies.id', '=', $this->conditionCompany);
    }

    public function store()
    {
        return $this->belongsTo('\App\Models\Store', 'object_id', 'id')
            ->select(['stores.*', 'companies.name as company_name', 'companies.id as company_id'])
            ->leftJoin('contracts', 'stores.id', '=', $this->conditionStore)
            ->leftJoin('companies', 'companies.id', '=', 'stores.company_id');
    }

    public function department()
    {
        return $this->belongsTo('\App\Models\Department', 'object_id', 'id')
            ->select(['departments.*', 'stores.name as store_name', 'stores.id as store_id', 'companies.name as company_name', 'companies.id as company_id'])
            ->join('contracts', 'departments.id', '=', 'contracts.object_id')
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'stores.company_id', '=', 'companies.id')
            ->where("contracts.object_type", "=", $this->objectTypeDepartment);
    }
    public function asset()
    {
        return $this->belongsToMany(Asset::class);
    }

    public function contract_assets()
    {
        return $this->belongsTo('\App\Models\ContractAsset', 'id', 'contract_id');
    }

    public function assetlog()
    {
        return $this->hasMany('\App\Models\Actionlog', 'item_id')->where('item_type', Component::class)->orderBy('created_at', 'desc')->withTrashed();
    }

    /*
    * Filter Company, Store, Department
    */

    public function scopeFilterDepartmentInCompany($query, $input)
    {
        return $query->where('contracts.object_type', '=', $this->objectTypeDepartment)
            ->whereIn(
                'contracts.object_id',
                Department::select('departments.id')
                    ->join('stores', 'stores.id', '=', 'departments.store_id')
                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                    ->where('companies.id', '=', $input)
                    ->whereNull('contracts.deleted_at')
            );
    }

    public function scopeFilterStoreInCompany($query, $input)
    {
        return $query
            ->where('contracts.object_type', '=', $this->objectTypeStore)
            ->whereIn(
                'contracts.object_id',
                Store::select('stores.id')
                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                    ->where('companies.id', '=', $input)
                    ->whereNull('contracts.deleted_at')
            );
    }

    public function scopeFilterCompanyInCompany($query, $input)
    {
        return $query
            ->where('contracts.object_type', '=', $this->objectTypeCompany)
            ->where('contracts.object_id', '=', $input)
            ->whereNull('contracts.deleted_at');
    }

    public function scopeFilterDepartmentInStore($query, $input)
    {
        return $query
            ->orWhere('contracts.object_type', '=', $this->objectTypeDepartment)
            ->whereIn(
                'contracts.object_id',
                Department::select('departments.id')
                    ->join('stores', 'stores.id', '=', 'departments.store_id')
                    ->where('stores.id', '=', $input)
                    ->whereNull('contracts.deleted_at')
            );
    }

    public function scopeFilterStoreInStore($query, $input)
    {
        return $query
            ->where('contracts.object_type', '=', $this->objectTypeStore)
            ->where('contracts.object_id', '=', $input)
            ->whereNull('contracts.deleted_at');
    }

    public function scopeFilterDepartmentInDepartment($query, $input)
    {
        return $query
            ->where('contracts.object_type', '=', $this->objectTypeDepartment)
            ->whereIn(
                'contracts.object_id',
                Department::select('departments.id')
                    ->where('departments.id', '=', $input)
                    ->whereNull('contracts.deleted_at')
            );
    }

    /*
    * Sort Company, Store, Department
    */
    public function scopeSortCompany($query, $order)
    {
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

    public function scopeSortStore($query, $order)
    {
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

    public function scopeSortStoreCompany($query, $order, $input)
    {
        $company = Contract::select('contracts.*', \DB::raw('null as stores'),  \DB::raw('null as stores_id'))
            ->join('companies', 'companies.id', '=', $this->conditionCompany)
            ->where('companies.id', '=', $input)
            ->whereNull('contracts.deleted_at');

        $department = Contract::select('contracts.*', 'stores.name as stores', 'stores.id as stores_id')
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('companies.id', '=', $input)
            ->whereNull('contracts.deleted_at');

        return $query
            ->join('stores', 'stores.id', '=', $this->conditionStore)
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('companies.id', '=', $input)
            ->union($company)
            ->union($department)
            ->whereNull('contracts.deleted_at')
            ->orderBy('stores', $order);
    }

    public function scopeSortDepartment($query, $order)
    {

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

    public function scopeSortCompanyDepartment($query, $order, $input)
    {
        $company = Contract::select('contracts.*', \DB::raw('null as departments'),  \DB::raw('null as departments'))
            ->join('companies', 'companies.id', '=', $this->conditionCompany)
            ->where('companies.id', '=', $input)
            ->whereNull('contracts.deleted_at');

        $store = Contract::select('contracts.*', \DB::raw('null as departments'),  \DB::raw('null as departments'))
            ->join('stores', 'stores.id', '=', $this->conditionStore)
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('companies.id', '=', $input)
            ->whereNull('contracts.deleted_at');

        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('companies.id', '=', $input)
            ->union($company)
            ->union($store)
            ->whereNull('contracts.deleted_at')
            ->orderBy('departments', $order);
    }

    public function scopeSortStoreDepartment($query, $order, $input)
    {
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
            ->where('companies.id', '=', $input)
            ->whereNull('contracts.deleted_at');

        $store = Contract::select('contracts.*', \DB::raw('locations.name AS location_name'))
            ->join('stores', 'stores.id', '=', $this->conditionStore)
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->leftJoin('locations', 'contracts.location_id', '=', 'locations.id')
            ->where('companies.id', '=', $input)
            ->whereNull('contracts.deleted_at');

        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->leftJoin('locations', 'contracts.location_id', '=', 'locations.id')
            ->where('companies.id', '=', $input)
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
            ->where('stores.id', '=', $input)
            ->whereNull('contracts.deleted_at');

        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->leftJoin('locations', 'contracts.location_id', '=', 'locations.id')
            ->where('stores.id', '=', $input)
            ->union($store)
            ->whereNull('contracts.deleted_at')
            ->orderBy('location_name', $order);
    }

    public function scopeOrderLocationDepartment($query, $order, $input)
    {
        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->leftJoin('locations', 'contracts.location_id', '=', 'locations.id')
            ->where('departments.id', '=', $input)
            ->whereNull('contracts.deleted_at')
            ->orderBy('location_name', $order);
    }

    public function scopeOrderContactOne($query, $order)
    {
        return $query->leftJoin('users', 'users.id', '=', 'contracts.contact_id_1')->orderBy('users.first_name', $order);
    }

    public function scopeOrderContactCompany($query, $field, $order, $input)
    {

        $company = Contract::select('contracts.*', \DB::raw('users.first_name AS first_name'))
            ->join('companies', 'companies.id', '=', $this->conditionCompany)
            ->leftJoin('users', 'users.id', '=', $field)
            ->where('companies.id', '=', $input)
            ->whereNull('contracts.deleted_at');

        $store = Contract::select('contracts.*', \DB::raw('users.first_name AS first_name'))
            ->join('stores', 'stores.id', '=', $this->conditionStore)
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->leftJoin('users', 'users.id', '=', $field)
            ->where('companies.id', '=', $input)
            ->whereNull('contracts.deleted_at');

        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->leftJoin('users', 'users.id', '=', $field)
            ->where('companies.id', '=', $input)
            ->union($company)
            ->union($store)
            ->whereNull('contracts.deleted_at')
            ->orderBy('first_name', $order);
    }

    public function scopeOrderContactStore($query, $field, $order, $input)
    {
        $store = Contract::select('contracts.*', \DB::raw('users.first_name AS first_name'))
            ->join('stores', 'stores.id', '=', $this->conditionStore)
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->leftJoin('users', 'users.id', '=', $field)
            ->where('stores.id', '=', $input)
            ->whereNull('contracts.deleted_at');

        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->leftJoin('users', 'users.id', '=', $field)
            ->where('stores.id', '=', $input)
            ->union($store)
            ->whereNull('contracts.deleted_at')
            ->orderBy('first_name', $order);
    }

    public function scopeOrderContactDepartment($query, $field, $order, $input)
    {
        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->leftJoin('users', 'users.id', '=', $field)
            ->where('departments.id', '=', $input)
            ->whereNull('contracts.deleted_at')
            ->orderBy('first_name', $order);
    }


    public function scopeOrderContactTwo($query, $order)
    {
        return $query->leftJoin('users', 'users.id', '=', 'contracts.contact_id_2')->orderBy('users.first_name', $order);
    }

    public function scopeOrderDate($query, $fields, $order)
    {
        return $query->orderBy($fields, $order);
    }

    public function scopeTotalCompany($query, $field, $input)
    {
        return $query->join('companies', 'companies.id', '=', $this->conditionCompany)
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

    public function scopeSearchStore($query, $input)
    {
        return $query
            ->leftJoin('stores', 'stores.id', '=', $this->conditionStore)
            ->orWhere('stores.name', 'LIKE', '%' . $input . '%')
            ->whereNull('contracts.deleted_at');
    }

    public function scopeSearchDepartment($query, $input)
    {
        return $query
            ->leftJoin('departments', 'departments.id', '=', $this->conditionDepartment)
            ->orWhere('departments.name', 'LIKE', '%' . $input . '%')
            ->whereNull('contracts.deleted_at');
    }

    public function scopeSearchCompany($query, $input)
    {

        return $query
            ->leftJoin('companies', 'companies.id', '=', $this->conditionCompany)
            ->orWhere('companies.name', 'LIKE', '%' . $input . '%')
            ->whereNull('contracts.deleted_at');
    }

    public function scopeSearchLocation($query, $input)
    {
        return $query
            ->leftJoin('locations', 'locations.id', '=', 'contracts.location_id')
            ->where('locations.name', 'LIKE', '%' . $input . '%')
            ->whereNull('contracts.deleted_at');
    }

    public function scopeSearchUser($query, $input)
    {
        return $query
            ->leftJoin('users as contact_1', 'contact_1.id', '=', 'contracts.contact_id_1')
            ->leftJoin('users as contact_2', 'contact_2.id', '=', 'contracts.contact_id_2')
            ->orWhere('contact_1.first_name', 'LIKE', '%' . $input . '%')
            ->orWhere('contact_1.last_name', 'LIKE', '%' . $input . '%')
            ->orWhere('contact_1.username', 'LIKE', '%' . $input . '%')
            ->orWhereRaw('CONCAT(' . DB::getTablePrefix() . 'contact_1.first_name," ",' . DB::getTablePrefix() . 'contact_1.last_name) LIKE ?', ["%$input%", "%$input%"])
            ->orWhere('contact_2.first_name', 'LIKE', '%' . $input . '%')
            ->orWhere('contact_2.last_name', 'LIKE', '%' . $input . '%')
            ->orWhere('contact_2.username', 'LIKE', '%' . $input . '%')
            ->orWhereRaw('CONCAT(' . DB::getTablePrefix() . 'contact_2.first_name," ",' . DB::getTablePrefix() . 'contact_2.last_name) LIKE ?', ["%$input%", "%$input%"])
            ->whereNull('contracts.deleted_at');
    }

    public function scopeSearchContract($query, $input)
    {
        return $query
            ->orWhere('contracts.name', 'LIKE', '%' . $input . '%')
            ->orWhere('contracts.start_date', 'LIKE', '%' . $input . '%')
            ->orWhere('contracts.end_date', 'LIKE', '%' . $input . '%')
            ->orWhere('contracts.billing_date', 'LIKE', '%' . $input . '%')
            ->orWhere('contracts.payment_date', 'LIKE', '%' . $input . '%')
            ->whereNull('contracts.deleted_at');
    }


    public function scopeSearchSortCompany($query, $order, $input)
    {
        $store = Contract::select('contracts.*', 'companies.name as company_name')
            ->join('stores', 'stores.id', '=', $this->conditionStore)
            ->join('companies', 'stores.company_id', '=', 'companies.id')
            ->whereNull('contracts.deleted_at')
            ->where('companies.name', 'LIKE', '%' . $input . '%');

        $department = Contract::select('contracts.*', 'companies.name as company_name')
            ->whereNull('contracts.deleted_at')
            ->join('departments', 'departments.id', '=',  $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('companies.name', 'LIKE', '%' . $input . '%')
            ->orWhere('departments.name', 'LIKE', '%' . $input . '%')
            ->orWhere('stores.name', 'LIKE', '%' . $input . '%');

        return $query
            ->join('companies', 'companies.id', '=', $this->conditionCompany)
            ->whereNull('contracts.deleted_at')
            ->where('companies.name', 'LIKE', '%' . $input . '%')
            ->union($store)
            ->union($department)
            ->whereNull('contracts.deleted_at')
            ->orderBy('company_name', $order);
    }

    public function scopeSearchSortStore($query, $order, $input)
    {
        $company = Contract::select('contracts.*', \DB::raw('null as stores'),  \DB::raw('null as stores_id'))
            ->join('companies', 'companies.id', '=', $this->conditionCompany)
            ->whereNull('contracts.deleted_at')
            ->where('companies.name', 'LIKE', '%' . $input . '%');

        $department = Contract::select('contracts.*', 'stores.name as stores', 'stores.id as stores_id')
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->whereNull('contracts.deleted_at')
            ->where('stores.name', 'LIKE', '%' . $input . '%')
            ->orWhere('departments.name', 'LIKE', '%' . $input . '%');

        return $query
            ->join('stores', 'stores.id', '=', $this->conditionStore)
            ->leftJoin('companies', 'companies.id', '=', 'stores.company_id')
            ->whereNull('contracts.deleted_at')
            ->where('stores.name', 'LIKE', '%' . $input . '%')
            ->orWhere('companies.name', 'LIKE', '%' . $input . '%')
            ->union($company)
            ->union($department)
            ->whereNull('contracts.deleted_at')
            ->orderBy('stores', $order);
    }

    public function scopeSearchSortDepartment($query, $order, $input)
    {

        $company = Contract::select('contracts.*', \DB::raw('null as departments'),  \DB::raw('null as departments_id'))
            ->join('companies', 'companies.id', '=', $this->conditionCompany)
            ->whereNull('contracts.deleted_at')
            ->where('companies.name', 'LIKE', '%' . $input . '%')
            ->whereNull('contracts.deleted_at');

        $store = Contract::select('contracts.*', \DB::raw('null as departments'),  \DB::raw('null as departments_id'))
            ->join('stores', 'stores.id', '=', $this->conditionStore)
            ->whereNull('contracts.deleted_at')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('stores.name', 'LIKE', '%' . $input . '%')
            ->orWhere('companies.name', 'LIKE', '%' . $input . '%')
            ->whereNull('contracts.deleted_at');

        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->where('stores.name', 'LIKE', '%' . $input . '%')
            ->orWhere('departments.name', 'LIKE', '%' . $input . '%')
            ->union($company)
            ->union($store)
            ->whereNull('contracts.deleted_at')
            ->orderBy('departments', $order);
    }

    public function scopeSearchSortLocation($query, $order, $input)
    {

        $company = Contract::select('contracts.*', \DB::raw('locations.name AS location_name'))
            ->join('companies', 'companies.id', '=', $this->conditionCompany)
            ->leftJoin('locations', 'contracts.location_id', '=', 'locations.id')
            ->where('companies.name', 'LIKE', '%' . $input . '%')
            ->whereNull('contracts.deleted_at');

        $store = Contract::select('contracts.*', \DB::raw('locations.name AS location_name'))
            ->join('stores', 'stores.id', '=', $this->conditionStore)
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->leftJoin('locations', 'contracts.location_id', '=', 'locations.id')
            ->whereNull('contracts.deleted_at')
            ->where('companies.name', 'LIKE', '%' . $input . '%')
            ->orWhere('stores.name', 'LIKE', '%' . $input . '%')
            ->whereNull('contracts.deleted_at');

        return $query
            ->join('departments', 'departments.id', '=', $this->conditionDepartment)
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->leftJoin('locations', 'contracts.location_id', '=', 'locations.id')
            ->where('companies.name', 'LIKE', '%' . $input . '%')
            ->orWhere('stores.name', 'LIKE', '%' . $input . '%')
            ->orWhere('departments.name', 'LIKE', '%' . $input . '%')
            ->union($company)
            ->union($store)
            ->whereNull('contracts.deleted_at')
            ->orderBy('location_name', $order);
    }
}
