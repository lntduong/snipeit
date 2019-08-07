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
        'company1'    => ['name'],
        'department' => ['name'],
        'contract'   => ['name']
    ];

    // /**
    // * get contract
    // */

    public function contract()
    {
        return $this->belongsTo('\App\Models\Contract', 'object_id');
    }
    public function company()
    {
        return $this->belongsTo('\App\Models\Company', 'object_id')
            ->select(['companies.*'])
            ->join(
                'inventories',
                'companies.id',
                '=',
                \DB::raw('(CASE WHEN inventories.object_type = "App\\\Models\\\Company" THEN inventories.object_id ELSE null END )')
            );
    }
    public function company1()
    {
        return $this->belongsTo('\App\Models\Company', 'object_id')
            ->select(['companies.*'])
            ->join(
                'inventories',
                'companies.id',
                '=',
                \DB::raw('(CASE WHEN inventories.object_type = "App\\\Models\\\Company" THEN inventories.object_id ELSE null END )')
            );
    }
    public function store()
    {
        return $this->belongsTo('\App\Models\Store', 'object_id')
            ->select(['stores.*', 'companies.name as company_name', 'companies.id as company_id'])
            ->leftJoin(
                'inventories',
                'stores.id',
                '=',
                \DB::raw('(CASE WHEN inventories.object_type = "App\\\Models\\\Store" THEN inventories.object_id ELSE null END )')
            )
            ->leftJoin('companies', 'companies.id', '=', 'stores.company_id');
    }
    public function department()
    {
        return $this->belongsTo('\App\Models\Department', 'object_id')
            ->select(['departments.*', 'stores.name as store_name', 'stores.id as store_id', 'companies.name as company_name', 'companies.id as company_id'])
            ->join('inventories', 'departments.id', '=', 'inventories.object_id')
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'stores.company_id', '=', 'companies.id')
            ->where("inventories.object_type", "=", \DB::raw('"App\\\Models\\\Department"'));
    }
    public function inventoryresult()
    {
        return $this->belongsTo('\App\Models\InventoryResult', 'id', 'inventory_id');
    }
    public function scopeSortCompany($query, $order, $company = "", $store = "", $department = "", $contract = "", $inventory)
    {
        if ($department) {
            if ($contract) {
                return $query;
            } else {
                return $query;
            }
        } else {
            if ($store) {
                if ($contract) {
                    return $query;
                } else {
                    return $query;
                }
            } elseif ($company) {
                if ($contract) {
                    return $query;
                } else {
                    return $query;
                }
            }
        }
        if ($contract) {
            return $query;
        }
        $store = Inventory::select('inventories.*', \DB::raw('companies.name AS name_sort'))
            ->join('stores', 'stores.id', '=', 'inventories.object_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Store"'));
        $department = Inventory::select('inventories.*', \DB::raw('companies.name AS name_sort'))
            ->join('departments', 'departments.id', '=', 'inventories.object_id')
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'));
        $contract_company = Inventory::select('inventories.*', \DB::raw('companies.name AS name_sort'))
            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
            ->join('companies', 'companies.id', '=', 'contracts.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'));
        $contract_store = Inventory::select('inventories.*', \DB::raw('companies.name AS name_sort'))
            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
            ->join('stores', 'stores.id', '=', 'contracts.object_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'));
        $contract_department = Inventory::select('inventories.*', \DB::raw('companies.name AS name_sort'))
            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
            ->join('departments', 'departments.id', '=', 'contracts.object_id')
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'));
        return $query
            ->join('companies', 'companies.id', '=', 'inventories.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
            ->union($store)
            ->union($department)
            ->union($contract_company)
            ->union($contract_store)
            ->union($contract_department)
            ->orderBy('name_sort', $order);
    }
    public function scopeSortStore($query, $order, $company = "", $store = "", $department = "", $contract = "", $inventory)
    {
        if ($department) {
            if ($contract) {
                return $inventory
                    ->select('inventories.*', \DB::raw('null AS name_sort'))
                    ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                    ->leftjoin('stores', 'stores.id', '=', 'contracts.object_id')
                    ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                    ->whereIn(
                        'inventories.object_id',
                        Contract::select('contracts.id')
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                            ->whereIn(
                                'contracts.object_id',
                                Department::select('departments.id')
                                    ->where('departments.id', '=', $department)
                            )
                    );
            } else {
                return $inventory
                    ->select('inventories.*', \DB::raw('null AS name_sort'))
                    ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'inventories.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->join('companies', 'companies.id', '=', 'stores.company_id')
                            ->where('departments.id', '=', $department)
                    )
                    ->union(
                        Inventory::select('inventories.*')
                            ->select('inventories.*', \DB::raw('null AS name_sort'))
                            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                            ->leftjoin('stores', 'stores.id', '=', 'contracts.object_id')
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                            ->whereIn(
                                'inventories.object_id',
                                Contract::select('contracts.id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                                    ->whereIn(
                                        'contracts.object_id',
                                        Department::select('departments.id')
                                            ->where('departments.id', '=', $department)
                                    )
                            )
                    );
            }
        } else {
            if ($store) {
                return $query;
            } elseif ($company) {
                if ($contract) {
                    return $query;
                } else {
                    return $inventory
                        ->select('inventories.*', \DB::raw('stores.name AS name_sort'))
                        ->join('departments', 'departments.id', '=', 'inventories.object_id')
                        ->join('stores', 'stores.id', '=', 'departments.store_id')
                        ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'inventories.object_id',
                            Department::select('departments.id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->join('companies', 'companies.id', '=', 'stores.company_id')
                                ->where('companies.id', '=', $company)
                        )
                        ->union(
                            Inventory::select('inventories.*', \DB::raw('stores.name AS name_sort'))
                                ->join('stores', 'stores.id', '=', 'inventories.object_id')
                                ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                ->whereIn(
                                    'inventories.object_id',
                                    Store::select('stores.id')
                                        ->join('companies', 'companies.id', '=', 'stores.company_id')
                                        ->where('companies.id', '=', $company)
                                )
                        )
                        ->union(
                            Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
                                ->join('companies', 'companies.id', '=', 'inventories.object_id')
                                ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                ->where('inventories.object_id', '=', $company)
                        )
                        ->union(
                            Inventory::select('inventories.*', \DB::raw('stores.name AS name_sort'))
                                ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                                ->leftjoin('stores', 'stores.id', '=', 'contracts.object_id', 'and', 'contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                                ->whereIn(
                                    'inventories.object_id',
                                    Contract::select('contracts.id as id')
                                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                        ->whereIn(
                                            'contracts.object_id',
                                            Store::select('stores.id')
                                                ->join('companies', 'companies.id', '=', 'stores.company_id')
                                                ->where('companies.id', '=', $company)
                                        )
                                )
                        )
                        ->union(
                            Inventory::select('inventories.*', \DB::raw('stores.name AS name_sort'))
                                ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                                ->leftjoin('departments', 'departments.id', '=', 'contracts.object_id', 'and', 'contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                                ->leftjoin('stores', 'stores.id', '=', 'departments.store_id')
                                ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                                ->whereIn(
                                    'inventories.object_id',
                                    Contract::select('contracts.id')
                                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                                        ->whereIn(
                                            'contracts.object_id',
                                            Department::select('departments.id as id')
                                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                                ->join('companies', 'companies.id', '=', 'stores.company_id')
                                                ->where('companies.id', '=', $company)
                                        )
                                )
                        )
                        ->union(
                            Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
                                ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                                ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                                ->whereIn(
                                    'inventories.object_id',
                                    Contract::select('contracts.id as id')
                                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                        ->where('contracts.object_id', '=', $company)
                                )
                        )
                        ->orderBy('name_sort', $order);
                }
            }
        }
        if ($contract) {
            return $inventory
                ->select('inventories.*', \DB::raw('null AS name_sort'))
                ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                ->where('inventories.object_id', $contract);
        }
        $company = Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
            ->join('companies', 'companies.id', '=', 'inventories.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Company"'));
        $department = Inventory::select('inventories.*', \DB::raw('stores.name AS name_sort'))
            ->join('departments', 'departments.id', '=', 'inventories.object_id')
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'));
        $contract_company = Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
            ->join('companies', 'companies.id', '=', 'contracts.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'));
        $contract_store = Inventory::select('inventories.*', \DB::raw('stores.name AS name_sort'))
            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
            ->join('stores', 'stores.id', '=', 'contracts.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'));
        $contract_department = Inventory::select('inventories.*', \DB::raw('stores.name AS name_sort'))
            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
            ->join('departments', 'departments.id', '=', 'contracts.object_id')
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'));
        return $query
            ->join('stores', 'stores.id', '=', 'inventories.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
            ->select('inventories.*', \DB::raw('stores.name AS name_sort'))
            ->union($company)
            ->union($department)
            ->union($contract_company)
            ->union($contract_store)
            ->union($contract_department)
            ->orderBy('name_sort', $order);
    }
    public function scopeSortDepartment($query, $order, $company = "", $store = "", $department = "", $contract = "", $inventory)
    {
        if ($department) {
            return $query;
        } elseif ($store) {
            if ($contract) {
                return $query;
            } else {
                return $inventory
                    ->select('inventories.*', \DB::raw('departments.name AS name_sort'))
                    ->leftjoin('departments', 'departments.id', '=', 'inventories.object_id')
                    ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'inventories.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->where('stores.id', $store)
                    )
                    ->union(
                        Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->where('inventories.object_id', $store)
                    )
                    ->union(
                        Inventory::select('inventories.*', \DB::raw('departments.name AS name_sort'))
                            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                            ->leftjoin('departments', 'departments.id', '=', 'contracts.object_id', 'and', 'contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                            ->whereIn(
                                'inventories.object_id',
                                Contract::select('contracts.id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                                    ->whereIn(
                                        'contracts.object_id',
                                        Department::select('departments.id as id')
                                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                                            ->where('stores.id', '=', $store)
                                    )
                            )
                    )
                    ->union(
                        Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
                            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                            ->whereIn(
                                'inventories.object_id',
                                Contract::select('contracts.id as id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                    ->where('contracts.object_id', '=', $store)
                            )
                    )
                    ->orderBy('name_sort', $order);
            }
        } elseif ($company) {
            if ($contract) {
                return $query;
            } else {
                return $inventory
                    ->select('inventories.*', \DB::raw('departments.name AS name_sort'))
                    ->join('departments', 'departments.id', '=', 'inventories.object_id')
                    ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'inventories.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->join('companies', 'companies.id', '=', 'stores.company_id')
                            ->where('companies.id', '=', $company)
                    )
                    ->union(
                        Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->whereIn(
                                'inventories.object_id',
                                Store::select('stores.id')
                                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                                    ->where('companies.id', '=', $company)
                            )
                    )
                    ->union(
                        Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                            ->where('inventories.object_id', '=', $company)
                    )
                    ->union(
                        Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
                            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                            ->whereIn(
                                'inventories.object_id',
                                Contract::select('contracts.id as id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                    ->whereIn(
                                        'contracts.object_id',
                                        Store::select('stores.id')
                                            ->join('companies', 'companies.id', '=', 'stores.company_id')
                                            ->where('companies.id', '=', $company)
                                    )
                            )
                    )
                    ->union(
                        Inventory::select('inventories.*', \DB::raw('departments.name AS name_sort'))
                            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                            ->leftjoin('departments', 'departments.id', '=', 'contracts.object_id', 'and', 'contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                            ->whereIn(
                                'inventories.object_id',
                                Contract::select('contracts.id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                                    ->whereIn(
                                        'contracts.object_id',
                                        Department::select('departments.id as id')
                                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                                            ->join('companies', 'companies.id', '=', 'stores.company_id')
                                            ->where('companies.id', '=', $company)
                                    )
                            )
                    )
                    ->union(
                        Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
                            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                            ->whereIn(
                                'inventories.object_id',
                                Contract::select('contracts.id as id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                    ->where('contracts.object_id', '=', $company)
                            )
                    )
                    ->orderBy('name_sort', $order);
            }
        }
        if ($contract) {
            return $inventory
                ->select('inventories.*', \DB::raw('null AS name_sort'))
                ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                ->where('inventories.object_id', $contract);
        }

        $company = Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
            ->join('companies', 'companies.id', '=', 'inventories.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Company"'));
        $store = Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
            ->join('stores', 'stores.id', '=', 'inventories.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Store"'));
        $contract_company = Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
            ->join('companies', 'companies.id', '=', 'contracts.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'));
        $contract_store = Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
            ->join('stores', 'stores.id', '=', 'contracts.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'));
        $contract_department = Inventory::select('inventories.*', \DB::raw('departments.name AS name_sort'))
            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
            ->join('departments', 'departments.id', '=', 'contracts.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'));
        return $query
            ->join('departments', 'departments.id', '=', 'inventories.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
            ->select('inventories.*', \DB::raw('departments.name AS name_sort'))
            ->union($company)
            ->union($store)
            ->union($contract_company)
            ->union($contract_store)
            ->union($contract_department)
            ->orderBy('name_sort', $order);
    }
    public function scopeSortContract($query, $order, $company = "", $store = "", $department = "", $contract = "", $inventory)
    {
        if ($department) {
            if ($contract) {
                return $query;
            } else {
                return $inventory
                    ->select('inventories.*', \DB::raw('null AS name_sort'))
                    ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'inventories.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->join('companies', 'companies.id', '=', 'stores.company_id')
                            ->where('departments.id', '=', $department)
                    )
                    ->union(
                        Inventory::select('inventories.*')
                            ->select('inventories.*', \DB::raw('contracts.name AS name_sort'))
                            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                            ->whereIn(
                                'inventories.object_id',
                                Contract::select('contracts.id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                                    ->whereIn(
                                        'contracts.object_id',
                                        Department::select('departments.id')
                                            ->where('departments.id', '=', $department)
                                    )
                            )
                    )
                    ->orderBy('name_sort', $order);
            }
        } elseif ($store) {
            if ($contract) {
                return $query;
            } else {
                return $inventory
                    ->select('inventories.*', \DB::raw('null AS name_sort'))
                    ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'inventories.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->where('stores.id', $store)
                    )
                    ->union(
                        Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->where('inventories.object_id', $store)
                    )
                    ->union(
                        Inventory::select('inventories.*', \DB::raw('contracts.name AS name_sort'))
                            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                            ->whereIn(
                                'inventories.object_id',
                                Contract::select('contracts.id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                                    ->whereIn(
                                        'contracts.object_id',
                                        Department::select('departments.id as id')
                                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                                            ->where('stores.id', '=', $store)
                                    )
                                    ->union(
                                        Contract::select('contracts.id as id')
                                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                            ->where('contracts.object_id', '=', $store)
                                    )
                                    ->get()
                            )
                    )
                    ->orderBy('name_sort', $order);
            }
        } elseif ($company) {
            if ($contract) {
                return $query;
            } else {
                return $inventory
                    ->select('inventories.*', \DB::raw('null AS name_sort'))
                    ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'inventories.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->join('companies', 'companies.id', '=', 'stores.company_id')
                            ->where('companies.id', '=', $company)
                    )
                    ->union(
                        Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->whereIn(
                                'inventories.object_id',
                                Store::select('stores.id')
                                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                                    ->where('companies.id', '=', $company)
                            )
                    )
                    ->union(
                        Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                            ->where('inventories.object_id', '=', $company)
                    )
                    ->union(
                        Inventory::select('inventories.*', \DB::raw('contracts.name AS name_sort'))
                            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                            ->whereIn(
                                'inventories.object_id',
                                Contract::select('contracts.id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                                    ->whereIn(
                                        'contracts.object_id',
                                        Department::select('departments.id as id')
                                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                                            ->join('companies', 'companies.id', '=', 'stores.company_id')
                                            ->where('companies.id', '=', $company)
                                    )
                                    ->union(
                                        Contract::select('contracts.id as id')
                                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                            ->where('contracts.object_id', '=', $company)
                                    )

                                    ->union(
                                        Contract::select('contracts.id as id')
                                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                            ->whereIn(
                                                'contracts.object_id',
                                                Store::select('stores.id')
                                                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                                                    ->where('companies.id', '=', $company)
                                            )
                                    )
                                    ->get()
                            )
                    )
                    ->orderBy('name_sort', $order);
            }
        }
        if ($contract) {
            return $query;
        }
        $company = Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
            ->join('companies', 'companies.id', '=', 'inventories.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Company"'));
        $store = Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
            ->join('stores', 'stores.id', '=', 'inventories.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Store"'));
        $department = Inventory::select('inventories.*', \DB::raw('null AS name_sort'))
            ->join('departments', 'departments.id', '=', 'inventories.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'));
        return $query
            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
            ->select('inventories.*', \DB::raw('contracts.name AS name_sort'))
            ->union($company)
            ->union($store)
            ->union($department)
            ->orderBy('name_sort', $order);
    }
}