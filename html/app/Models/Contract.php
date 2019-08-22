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

    public function inventories()
    {
        return $this->belongsTo('\App\Models\Inventory', 'id', 'object_id')
            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
            ->where('inventories.object_type', '=', "App\\Models\\Contract");
    }

    public function company()
    {
        return $this->belongsTo('\App\Models\Company', 'object_id', 'id')
            ->select(['companies.*'])
            ->join(
                'contracts',
                'companies.id',
                '=',
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Company" THEN contracts.object_id ELSE null END )')
            );
    }

    public function store()
    {
        return $this->belongsTo('\App\Models\Store', 'object_id', 'id')
            ->select(['stores.*', 'companies.name as company_name', 'companies.id as company_id'])
            ->leftJoin(
                'contracts',
                'stores.id',
                '=',
                \DB::raw('(CASE WHEN contracts.object_type = "App\\\Models\\\Store" THEN contracts.object_id ELSE null END )')
            )
            ->leftJoin('companies', 'companies.id', '=', 'stores.company_id');
    }

    public function department()
    {
        return $this->belongsTo('\App\Models\Department', 'object_id', 'id')
            ->select(['departments.*', 'stores.name as store_name', 'stores.id as store_id', 'companies.name as company_name', 'companies.id as company_id'])
            ->join('contracts', 'departments.id', '=', 'contracts.object_id')
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'stores.company_id', '=', 'companies.id')
            ->where(
                "contracts.object_type",
                "=",
                "App\\Models\\Department"
            );
    }
    public function asset()
    {
        return $this->belongsToMany(Asset::class);
    }

    public function assets()
    {
        return $this->belongsToMany(Asset::class, 'contract_assets')->whereNull('contract_assets.deleted_at');
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
    public function scopeSortCompany($query, $order, $company = "", $store = "", $department = "", $billing_date, $search)
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
        $store = Contract::select('contracts.*', \DB::raw('null AS department_name'), 'stores.name as store_name', 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
            ->join('stores', 'stores.id', '=', 'contracts.object_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
            ->leftjoin('users as user1', 'user1.id', '=', 'contracts.contact_id_1')
            ->leftjoin('users as user2', 'user2.id', '=', 'contracts.contact_id_2')
            ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Store"'));
        $department =  Contract::select('contracts.*', 'departments.name as department_name', 'stores.name as store_name', 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
            ->join('departments', 'departments.id', '=', 'contracts.object_id')
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
            ->leftjoin('users as user1', 'user1.id', '=', 'contracts.contact_id_1')
            ->leftjoin('users as user2', 'user2.id', '=', 'contracts.contact_id_2')
            ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Department"'));

        if (!$search) {
            if ($billing_date) {
                return $query
                    ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                    ->join('companies', 'companies.id', '=', 'contracts.object_id')
                    ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Company"'))
                    ->where('contracts.billing_date', 'LIKE', $billing_date . '-%')
                    ->union($store->where('contracts.billing_date', 'LIKE', $billing_date . '-%'))
                    ->union($department->where('contracts.billing_date', 'LIKE', $billing_date . '-%'))
                    ->orderBy('company_name', $order);
            } else {
                return $query
                    ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                    ->join('companies', 'companies.id', '=', 'contracts.object_id')
                    ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Company"'))
                    ->union($store)
                    ->union($department)
                    ->orderBy('company_name', $order);
            }
        } else {
            return $query

                ->orderBy('company_name', $order);
        }
    }

    public function scopeSortStore($query, $order, $company = "", $store = "", $department = "", $billing_date, $search = "", $contract = "")
    {
        if ($department) {
            return $query;
        } else {
            if ($store) {
                return $query;
            } elseif ($company) {
                if ($search) {
                    return $query->orderBy('store_name', $order);
                } else {
                    $contract = $contract
                        ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('stores.name AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contact_1'), \DB::raw('null AS contact_2'), \DB::raw('null AS location_name'))
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
                            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('stores.name AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contact_1'), \DB::raw('null AS contact_2'), \DB::raw('null AS location_name'))
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
                            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contact_1'), \DB::raw('null AS contact_2'), \DB::raw('null AS location_name'))
                                ->join('companies', 'companies.id', '=', 'contracts.object_id')
                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                ->where('contracts.object_id', '=', $company)
                        );

                    return $contract->orderBy('store_name', $order);
                }
            }
        }


        $company =  Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
            ->join('companies', 'companies.id', '=', 'contracts.object_id')
            ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
            ->leftjoin('users as user1', 'user1.id', '=', 'contracts.contact_id_1')
            ->leftjoin('users as user2', 'user2.id', '=', 'contracts.contact_id_2')
            ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Company"'));
        $department =  Contract::select('contracts.*', 'departments.name as department_name', 'stores.name as store_name', 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
            ->join('departments', 'departments.id', '=', 'contracts.object_id')
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
            ->leftjoin('users as user1', 'user1.id', '=', 'contracts.contact_id_1')
            ->leftjoin('users as user2', 'user2.id', '=', 'contracts.contact_id_2')
            ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Department"'));
        if (!$search) {
            if ($billing_date) {
                return $query
                    ->select('contracts.*', \DB::raw('null AS department_name'), 'stores.name as store_name', 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                    ->join('stores', 'stores.id', '=', 'contracts.object_id')
                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                    ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Store"'))
                    ->union($company->where('contracts.billing_date', 'LIKE', $billing_date . '-%'))
                    ->union($department->where('contracts.billing_date', 'LIKE', $billing_date . '-%'))
                    ->orderBy('store_name', $order);
            } else {
                return $query
                    ->select('contracts.*', \DB::raw('null AS department_name'), 'stores.name as store_name', 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                    ->join('stores', 'stores.id', '=', 'contracts.object_id')
                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                    ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Store"'))
                    ->union($company)
                    ->union($department)
                    ->orderBy('store_name', $order);
            }
        } else {
            return $query

                ->orderBy('store_name', $order);
        }
    }

    public function scopeSortDepartment($query, $order, $company = "", $store = "", $department = "", $billing_date, $search = "", $contract = "")
    {
        if ($department) {
            return $query;
        } elseif ($store) {
            if ($search) {
                return $query->orderBy('department_name', $order);
            } else {
                return $contract
                    ->select('contracts.*', \DB::raw('departments.name AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contact_1'), \DB::raw('null AS contact_2'), \DB::raw('null AS location_name'))
                    ->leftjoin('departments', 'departments.id', '=', 'contracts.object_id')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'contracts.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->where('stores.id', $store)
                    )
                    ->union(
                        Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contact_1'), \DB::raw('null AS contact_2'), \DB::raw('null AS location_name'))
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->where('contracts.object_id', $store)
                    )

                    ->orderBy('department_name', $order);
            }
        } elseif ($company) {
            if ($search) {
                return $query->orderBy('department_name', $order);
            } else {
                $contract = $contract
                    ->select('contracts.*', \DB::raw('departments.name AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contact_1'), \DB::raw('null AS contact_2'), \DB::raw('null AS location_name'))
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
                        Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contact_1'), \DB::raw('null AS contact_2'), \DB::raw('null AS location_name'))
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->whereIn(
                                'contracts.object_id',
                                Store::select('stores.id')
                                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                                    ->where('companies.id', '=', $company)
                            )
                    )
                    ->union(
                        Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contact_1'), \DB::raw('null AS contact_2'), \DB::raw('null AS location_name'))
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                            ->where('contracts.object_id', '=', $company)
                    );
                return $contract->orderBy('department_name', $order);
            }
        }

        if (!$search) {
            if ($billing_date) {
                $company =  Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                    ->join('companies', 'companies.id', '=', 'contracts.object_id')
                    ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                    ->leftjoin('users as user1', 'user1.id', '=', 'contracts.contact_id_1')
                    ->leftjoin('users as user2', 'user2.id', '=', 'contracts.contact_id_2')
                    ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Company"'));
                $store = Contract::select('contracts.*', \DB::raw('null AS department_name'), 'stores.name as store_name', 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                    ->join('stores', 'stores.id', '=', 'contracts.object_id')
                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                    ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                    ->leftjoin('users as user1', 'user1.id', '=', 'contracts.contact_id_1')
                    ->leftjoin('users as user2', 'user2.id', '=', 'contracts.contact_id_2')
                    ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Store"'));
                return $query
                    ->select('contracts.*', 'departments.name as department_name', 'stores.name as store_name', 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                    ->join('departments', 'departments.id', '=', 'contracts.object_id')
                    ->join('stores', 'stores.id', '=', 'departments.store_id')
                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                    ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Department"'))
                    ->union($company->where('contracts.billing_date', 'LIKE', $billing_date . '-%'))
                    ->union($store->where('contracts.billing_date', 'LIKE', $billing_date . '-%'))
                    ->orderBy('department_name', $order);
            } else {
                $company =  Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                    ->join('companies', 'companies.id', '=', 'contracts.object_id')
                    ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                    ->leftjoin('users as user1', 'user1.id', '=', 'contracts.contact_id_1')
                    ->leftjoin('users as user2', 'user2.id', '=', 'contracts.contact_id_2')
                    ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Company"'));
                $store = Contract::select('contracts.*', \DB::raw('null AS department_name'), 'stores.name as store_name', 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                    ->join('stores', 'stores.id', '=', 'contracts.object_id')
                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                    ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                    ->leftjoin('users as user1', 'user1.id', '=', 'contracts.contact_id_1')
                    ->leftjoin('users as user2', 'user2.id', '=', 'contracts.contact_id_2')
                    ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Store"'));
                return $query
                    ->select('contracts.*', 'departments.name as department_name', 'stores.name as store_name', 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                    ->join('departments', 'departments.id', '=', 'contracts.object_id')
                    ->join('stores', 'stores.id', '=', 'departments.store_id')
                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                    ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Department"'))
                    ->union($company)
                    ->union($store)
                    ->orderBy('department_name', $order);
            }
        } else {
            return $query
                ->orderBy('department_name', $order);
        }
    }
}
