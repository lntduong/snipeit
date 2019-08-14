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

    public function scopeSortCompany($query, $order, $company = "", $store = "", $department = "", $search)
    {
        if ($department) {
            return $query;
        } else {
            if ($store) {
                return $query;
            } elseif ($company) {
                return $query;
            }
        }
        $store = Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('companies.name AS name_sort'))
            ->join('stores', 'stores.id', '=', 'contracts.object_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'));
        $department = Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), 'companies.name AS company_name', \DB::raw('companies.name AS name_sort'))
            ->join('departments', 'departments.id', '=', 'contracts.object_id')
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'));
        $location = Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
            ->join('locations', 'locations.id', '=', 'contracts.object_id')
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Location"'));
        if (!$search) {
            return $query
                ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('companies.name AS name_sort'))
                ->join('companies', 'companies.id', '=', 'contracts.object_id')
                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                ->union($store)
                ->union($department)
                ->union($location)
                ->orderBy('name_sort', $order);
        } else {
            return $query
                ->orderBy('company_name', $order);
        }
    }

    public function scopeSortStore($query, $order, $company = "", $store = "", $department = "", $contract, $search = "")
    {
        if ($department) {
            return $contract
                ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                ->whereIn(
                    'contracts.object_id',
                    Department::select('departments.id')
                        ->join('stores', 'stores.id', '=', 'departments.store_id')
                        ->join('companies', 'companies.id', '=', 'stores.company_id')
                        ->where('departments.id', '=', $department)
                )
                ->union(
                    Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
                        ->leftjoin('stores', 'stores.id', '=', 'contracts.object_id')
                        ->whereIn(
                            'contracts.object_id',
                            Contract::select('contracts.id')
                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                                ->whereIn(
                                    'contracts.object_id',
                                    Department::select('departments.id')
                                        ->where('departments.id', '=', $department)
                                )
                        )
                );
        } else {
            if ($store) {
                return $query;
            } elseif ($company) {
                if ($search) {
                    return $query->orderBy('store_name', $order);
                } else {
                    $contract = $contract
                        ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('stores.name AS name_sort'))
                        ->join('departments', 'departments.id', '=', 'contracts.object_id')
                        ->join('stores', 'stores.id', '=', 'departments.store_id')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'contracts.object_id',
                            Department::select('departments.id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->join('companies', 'companies.id', '=', 'stores.company_id')
                                ->where('companies.id', '=', $company)
                        )

                        ->union(
                            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('stores.name AS name_sort'))
                                ->leftjoin('stores', 'stores.id', '=', 'contracts.object_id', 'and', 'contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                ->whereIn(
                                    'contracts.object_id',
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
                            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('stores.name AS name_sort'))
                                ->leftjoin('departments', 'departments.id', '=', 'contracts.object_id', 'and', 'contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                                ->leftjoin('stores', 'stores.id', '=', 'departments.store_id')
                                ->whereIn(
                                    'contracts.object_id',
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
                            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('stores.name AS name_sort'))
                                ->join('stores', 'stores.id', '=', 'contracts.object_id')
                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                ->whereIn(
                                    'contracts.object_id',
                                    Store::select('stores.id')
                                        ->join('companies', 'companies.id', '=', 'stores.company_id')
                                        ->where('companies.id', '=', $company)
                                )
                        )
                        ->union(
                            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
                                ->join('companies', 'companies.id', '=', 'contracts.object_id')
                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                ->where('contracts.object_id', '=', $company)
                        )
                        ->union(
                            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
                                ->whereIn(
                                    'contracts.object_id',
                                    Contract::select('contracts.id as id')
                                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                        ->where('contracts.object_id', '=', $company)
                                )
                        );
                    return $contract->orderBy('name_sort', $order);
                }
            }
        }

        $company = Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
            ->join('companies', 'companies.id', '=', 'contracts.object_id')
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'));
        $department = Contract::select('contracts.*', \DB::raw('null AS department_name'), 'stores.name AS store_name', \DB::raw('null AS company_name'), \DB::raw('stores.name AS name_sort'))
            ->join('departments', 'departments.id', '=', 'contracts.object_id')
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'));
        $location = Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
            ->join('locations', 'locations.id', '=', 'contracts.object_id')
            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Location"'));
        if (!$search) {

            return $query
                ->join('stores', 'stores.id', '=', 'contracts.object_id')
                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('stores.name AS name_sort'))
                ->union($company)
                ->union($department)
                ->union($location)
                ->orderBy('name_sort', $order);
        } else {
            return $query
                ->orderBy('store_name', $order);
        }
    }

    public function scopeSortDepartment($query, $order, $company = "", $store = "", $department = "", $contract, $search = "")
    {
        if ($department) {
            return $query;
        } elseif ($store) {
            if ($search) {
                return $query->orderBy('department_name', $order);
            } else {
                return $contract
                    ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('departments.name AS name_sort'))
                    ->leftjoin('departments', 'departments.id', '=', 'contracts.object_id')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'contracts.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->where('stores.id', $store)
                    )
                    ->union(
                        Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->where('contracts.object_id', $store)
                    )
                    ->union(
                        Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('departments.name AS name_sort'))
                            ->leftjoin('departments', 'departments.id', '=', 'contracts.object_id', 'and', 'contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                            ->whereIn(
                                'contracts.object_id',
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
                        Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
                            ->whereIn(
                                'contracts.object_id',
                                Contract::select('contracts.id as id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                    ->where('contracts.object_id', '=', $store)
                            )
                    )
                    ->orderBy('name_sort', $order);
            }
        } elseif ($company) {

            if ($search) {
                return $query->orderBy('department_name', $order);
            } else {
                $contract = $contract
                    ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('departments.name AS name_sort'))
                    ->join('departments', 'departments.id', '=', 'contracts.object_id')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'contracts.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->join('companies', 'companies.id', '=', 'stores.company_id')
                            ->where('companies.id', '=', $company)
                    )
                    ->union(
                        Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->whereIn(
                                'contracts.object_id',
                                Store::select('stores.id')
                                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                                    ->where('companies.id', '=', $company)
                            )
                    )
                    ->union(
                        Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                            ->where('contracts.object_id', '=', $company)
                    )
                    ->union(
                        Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
                            ->whereIn(
                                'contracts.object_id',
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
                        Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('departments.name AS name_sort'))
                            ->leftjoin('departments', 'departments.id', '=', 'contracts.object_id', 'and', 'contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                            ->whereIn(
                                'contracts.object_id',
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
                        Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
                            ->whereIn(
                                'contracts.object_id',
                                Contract::select('contracts.id as id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                    ->where('contracts.object_id', '=', $company)
                            )
                    );
                return $contract->orderBy('name_sort', $order);
            }
        }

        if (!$search) {
            $company = Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
                ->join('companies', 'companies.id', '=', 'contracts.object_id')
                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'));
            $store = Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
                ->join('stores', 'stores.id', '=', 'contracts.object_id')
                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'));
            $location = Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS name_sort'))
                ->join('locations', 'locations.id', '=', 'contracts.object_id')
                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Location"'));

            return $query
                ->join('departments', 'departments.id', '=', 'contracts.object_id')
                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('departments.name AS name_sort'))
                ->union($company)
                ->union($store)
                ->union($location)
                ->orderBy('name_sort', $order);
        } else {
            return $query
                ->orderBy('department_name', $order);
        }
    }

    public function scopeSortLocation($query, $order, $company = "", $store = "", $department = "", $contract, $search)
    {
        if ($department) {
            if ($search) {
                return $query->orderBy('location_name', $order);
            } else {
                return $contract
                    ->select(
                        'contracts.*',
                        \DB::raw('null AS department_name'),
                        \DB::raw('null AS store_name'),
                        \DB::raw('null AS company_name'),
                        \DB::raw('locations.name AS name_sort')
                    )
                    ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'contracts.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->join('companies', 'companies.id', '=', 'stores.company_id')
                            ->where('departments.id', '=', $department)
                    )->orderBy('name_sort', $order);
            }
        } else {
            if ($store) {
                if ($search) {
                    return $query->orderBy('location_name', $order);
                } else {
                    return $contract
                        ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('locations.name AS name_sort'))
                        ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'contracts.object_id',
                            Department::select('departments.id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->where('stores.id', $store)
                        )
                        ->union(
                            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('locations.name AS name_sort'))
                                ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                ->where('contracts.object_id', $store)
                        )
                        ->union(
                            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('locations.name AS name_sort'))
                                ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                                ->whereIn(
                                    'contracts.object_id',
                                    Contract::select('contracts.id')
                                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                                        ->whereIn(
                                            'contracts.object_id',
                                            Department::select('departments.id as id')
                                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                                ->where('stores.id', '=', $store)
                                        )
                                )
                        )->orderBy('name_sort', $order);
                }
            } elseif ($company) {
                if ($search) {
                    return $query->orderBy('location_name', $order);
                } else {
                    $contract = $contract
                        ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('locations.name AS name_sort'))
                        ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'contracts.object_id',
                            Department::select('departments.id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->join('companies', 'companies.id', '=', 'stores.company_id')
                                ->where('companies.id', '=', $company)
                        )
                        ->union(
                            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('locations.name AS name_sort'))
                                ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                ->whereIn(
                                    'contracts.object_id',
                                    Store::select('stores.id')
                                        ->join('companies', 'companies.id', '=', 'stores.company_id')
                                        ->where('companies.id', '=', $company)
                                )
                        )
                        ->union(
                            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('locations.name AS name_sort'))
                                ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                ->where('contracts.object_id', '=', $company)
                        )
                        ->union(
                            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('locations.name AS name_sort'))
                                ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                                ->whereIn(
                                    'contracts.object_id',
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
                            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('locations.name AS name_sort'))
                                ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                                ->whereIn(
                                    'contracts.object_id',
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
                            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('locations.name AS name_sort'))
                                ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                                ->whereIn(
                                    'contracts.object_id',
                                    Contract::select('contracts.id as id')
                                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                        ->where('contracts.object_id', '=', $company)
                                )
                        );
                    return $contract->orderBy('name_sort', $order);
                }
            }
        }
        if (!$search) {
            return $query
                ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('locations.name AS name_sort'))
                ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                ->orderBy('name_sort', $order);
        } else {
            return $query
                ->orderBy('location_name', $order);
        }
    }

    public function scopeSortUser($query, $order, $company = "", $store = "", $department = "", $contract, $search, $field, $orderBy)
    {
        if ($department) {
            if ($search) {
                return $query->orderBy($orderBy, $order);
            } else {
                return $contract
                    ->select(
                        'contracts.*',
                        \DB::raw('null AS department_name'),
                        \DB::raw('null AS store_name'),
                        \DB::raw('null AS company_name'),
                        \DB::raw('users.first_name AS name_sort')
                    )
                    ->leftjoin('users', 'users.id', '=', $field)
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'contracts.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->join('companies', 'companies.id', '=', 'stores.company_id')
                            ->where('departments.id', '=', $department)
                    )->orderBy('name_sort', $order);
            }
        } else {
            if ($store) {
                if ($search) {
                    return $query->orderBy($orderBy, $order);
                } else {
                    return $contract
                        ->select(
                            'contracts.*',
                            \DB::raw('null AS department_name'),
                            \DB::raw('null AS store_name'),
                            \DB::raw('null AS company_name'),
                            \DB::raw('users.first_name AS name_sort')
                        )
                        ->leftjoin('users', 'users.id', '=', $field)
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'contracts.object_id',
                            Department::select('departments.id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->where('stores.id', $store)
                        )
                        ->union(
                            Contract::select(
                                'contracts.*',
                                \DB::raw('null AS department_name'),
                                \DB::raw('null AS store_name'),
                                \DB::raw('null AS company_name'),
                                \DB::raw('users.first_name AS name_sort')
                            )
                                ->leftjoin('users', 'users.id', '=', $field)
                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                ->where('contracts.object_id', $store)
                        )
                        ->union(
                            Contract::select(
                                'contracts.*',
                                \DB::raw('null AS department_name'),
                                \DB::raw('null AS store_name'),
                                \DB::raw('null AS company_name'),
                                \DB::raw('users.first_name AS name_sort')
                            )
                                ->leftjoin('users', 'users.id', '=', $field)
                                ->whereIn(
                                    'contracts.object_id',
                                    Contract::select('contracts.id')
                                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                                        ->whereIn(
                                            'contracts.object_id',
                                            Department::select('departments.id as id')
                                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                                ->where('stores.id', '=', $store)
                                        )
                                )
                        )->orderBy('name_sort', $order);
                }
            } elseif ($company) {
                if ($search) {
                    return $query->orderBy($orderBy, $order);
                } else {
                    $contract = $contract
                        ->select(
                            'contracts.*',
                            \DB::raw('null AS department_name'),
                            \DB::raw('null AS store_name'),
                            \DB::raw('null AS company_name'),
                            \DB::raw('users.first_name AS name_sort')
                        )
                        ->leftjoin('users', 'users.id', '=', $field)
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'contracts.object_id',
                            Department::select('departments.id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->join('companies', 'companies.id', '=', 'stores.company_id')
                                ->where('companies.id', '=', $company)
                        )
                        ->union(
                            Contract::select(
                                'contracts.*',
                                \DB::raw('null AS department_name'),
                                \DB::raw('null AS store_name'),
                                \DB::raw('null AS company_name'),
                                \DB::raw('users.first_name AS name_sort')
                            )
                                ->leftjoin('users', 'users.id', '=', $field)
                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                ->whereIn(
                                    'contracts.object_id',
                                    Store::select('stores.id')
                                        ->join('companies', 'companies.id', '=', 'stores.company_id')
                                        ->where('companies.id', '=', $company)
                                )
                        )
                        ->union(
                            Contract::select(
                                'contracts.*',
                                \DB::raw('null AS department_name'),
                                \DB::raw('null AS store_name'),
                                \DB::raw('null AS company_name'),
                                \DB::raw('users.first_name AS name_sort')
                            )
                                ->leftjoin('users', 'users.id', '=', $field)
                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                ->where('contracts.object_id', '=', $company)
                        )
                        ->union(
                            Contract::select(
                                'contracts.*',
                                \DB::raw('null AS department_name'),
                                \DB::raw('null AS store_name'),
                                \DB::raw('null AS company_name'),
                                \DB::raw('users.first_name AS name_sort')
                            )
                                ->leftjoin('users', 'users.id', '=', $field)
                                ->whereIn(
                                    'contracts.object_id',
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
                            Contract::select(
                                'contracts.*',
                                \DB::raw('null AS department_name'),
                                \DB::raw('null AS store_name'),
                                \DB::raw('null AS company_name'),
                                \DB::raw('users.first_name AS name_sort')
                            )
                                ->leftjoin('users', 'users.id', '=', $field)
                                ->whereIn(
                                    'contracts.object_id',
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
                            Contract::select(
                                'contracts.*',
                                \DB::raw('null AS department_name'),
                                \DB::raw('null AS store_name'),
                                \DB::raw('null AS company_name'),
                                \DB::raw('users.first_name AS name_sort')
                            )
                                ->leftjoin('users', 'users.id', '=', $field)
                                ->whereIn(
                                    'contracts.object_id',
                                    Contract::select('contracts.id as id')
                                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                        ->where('contracts.object_id', '=', $company)
                                )
                        );
                    return $contract->orderBy('name_sort', $order);
                }
            }
        }
        if (!$search) {
            return $query
                ->select(
                    'contracts.*',
                    \DB::raw('null AS department_name'),
                    \DB::raw('null AS store_name'),
                    \DB::raw('null AS company_name'),
                    \DB::raw('users.first_name AS name_sort')
                )
                ->leftjoin('users', 'users.id', '=', $field)
                ->orderBy('name_sort', $order);
        } else {
            return $query
                ->orderBy($orderBy, $order);
        }
    }
}
