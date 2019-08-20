<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\Store;
use App\Models\Department;
use App\Models\Contract;
use App\Models\Setting;
use Illuminate\Http\Request;
use App\Models\ContractAsset;
use App\Models\Inventory;
use App\Http\Transformers\SelectlistTransformer;
use App\Models\InventoryResult;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use App\Models\Asset;
use DateTime;
use App\Http\Transformers\SelectlistInventoryTransformer;
use App\Http\Transformers\InventoriesTransformer;
use Input;
use DB;

/**
 * @version    v1.0
 * @author [Thinh.NP]
 */
class InventoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return list Tableinventory
     */
    public function index(Request $request)
    {
        $this->authorize('view', Inventory::class);
        $inventory = Inventory::select('inventories.*')
            ->with('company')
            ->with('store')
            ->with('department')
            ->with('contract');

        $search = $request->input('search');
        $company_search = $request->input('company_id');
        $store_search = $request->input('store_id');
        $department_search = $request->input('department_id');
        $contract_search = $request->input('contract_id');

        if ($search) {
            $inventory = self::search($search, $company_search, $store_search, $department_search, $contract_search);
        }

        $inventory = self::filter($company_search, $store_search, $department_search, $contract_search, $inventory, $search);

        $limit = request('limit', 50);
        $order = $request->input('order') === 'asc' ? 'asc' : 'desc';
        $allowed_columns = [
            'id', 'name', 'date', 'notes', 'company', 'store', 'department', 'contract', 'location',
        ];

        $sort = in_array($request->input('sort'), $allowed_columns) ? $request->input('sort') : 'created_at';
        switch ($sort) {

            case 'company':
                $inventory = $inventory->SortCompany($order, $company_search, $store_search, $department_search, $contract_search, $inventory = new Inventory, $search);
                break;
            case 'store':
                $inventory = $inventory->SortStore($order, $company_search, $store_search, $department_search, $contract_search, $inventory = new Inventory, $search);
                break;
            case 'department':
                $inventory = $inventory->SortDepartment($order, $company_search, $store_search, $department_search, $contract_search, $inventory = new Inventory, $search);
                break;
            case 'contract':
                $inventory = $inventory->SortContract($order, $company_search, $store_search, $department_search, $contract_search, $inventory = new Inventory, $search);
                break;
            case 'location':
                $inventory = $inventory->SortLocation($order, $company_search, $store_search, $department_search, $contract_search, $inventory = new Inventory, $search);
                break;
            case 'name':
                $inventory = $inventory->orderBy('name', $order);
                break;
            case 'date':
                $inventory = $inventory->orderBy('inventory_date', $order);
                break;
            case 'notes':
                $inventory = $inventory->orderBy('notes', $order);
                break;
            case 'id':
                $inventory = $inventory->orderBy('id', $order);
                break;
        }
        $total = $inventory->get()->count();
        $offset = (($inventory) && (request('offset') > $inventory->get()->count())) ? 0 : request('offset', 0);
        $inventory = $inventory->skip($offset)->take($limit)->get();

        return (new InventoriesTransformer)->transformInventories($inventory, $total);
    }


    /**
     * Display all assets attached to a component
     * @param Request $request
     * @return List Selectlistinventory
     */
    public function selectlist(Request $request)
    {
        $page = Input::get('page', 1);
        $paginate = 50;
        $inventories = Inventory::select([
            'inventories.*'
        ]);
        $company = $request->input('company_id');
        $store = $request->input('store_id');
        $department = $request->input('department_id');
        $contract = $request->input('contract_id');
        $inventories = self::filter($company, $store, $department, $contract, $inventories);
        if ($request->input('search')) {
            $inventories = self::search($request->input('search'), $company, $store, $department, $contract);
        }
        $inventories = $inventories->get();
        $slice = array_slice($inventories->toArray(), $paginate * ($page - 1), $paginate);
        $result = new \Illuminate\Pagination\LengthAwarePaginator($slice, count($inventories), $paginate);

        return (new SelectlistTransformer)->transformSelectlistContract($result);
    }
    /**
     * Search inventory
     * @param search,company_search,store_search,department_search,contract_search
     * @return Inventory
     */
    public function search($search = "", $company_search = "", $store_search = "", $department_search = "", $contract_search = "")
    {
        $department =
            Inventory::select('inventories.*', 'departments.name as department_name', 'stores.name as store_name', 'companies.name as company_name', \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
            ->join('departments', 'departments.id', '=', 'inventories.object_id')
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('inventories.object_type', \DB::raw('"App\\\Models\\\Department"'))
            ->Where(function ($query) use ($search) {
                $query = $query
                    ->Where('inventories.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('inventories.notes', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(inventories.inventory_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere('companies.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('stores.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('departments.name', 'LIKE', '%' . $search . '%');
            })
            ->Where(function ($query) use ($company_search, $store_search, $department_search, $contract_search) {
                if ($company_search) {
                    $query->Where('companies.id', $company_search);
                }
                if ($store_search) {
                    $query->Where('stores.id', $store_search);
                }
                if ($department_search) {
                    $query->Where('departments.id', $department_search);
                }
                if ($contract_search) {
                    $query->whereRaw(0);
                }
            });

        $store =
            Inventory::select('inventories.*', \DB::raw('null AS department_name'), 'stores.name as store_name', 'companies.name as company_name', \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
            ->join('stores', 'stores.id', '=', 'inventories.object_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('inventories.object_type', \DB::raw('"App\\\Models\\\Store"'))
            ->Where(function ($query) use ($search) {
                $query = $query->Where('inventories.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('inventories.notes', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(inventories.inventory_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere('companies.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('stores.name', 'LIKE', '%' . $search . '%');
            })
            ->Where(function ($query) use ($company_search, $store_search, $department_search, $contract_search) {
                if ($company_search) {
                    $query->Where('companies.id', $company_search);
                }
                if ($store_search) {
                    $query->Where('stores.id', $store_search);
                }
                if ($contract_search || $department_search) {
                    $query->whereRaw(0);
                }
            });


        $company =
            Inventory::select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), 'companies.name as company_name', \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
            ->join('companies', 'companies.id', '=', 'inventories.object_id')
            ->where('inventories.object_type', \DB::raw('"App\\\Models\\\Company"'))
            ->Where(function ($query) use ($search) {
                $query = $query->Where('inventories.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('inventories.notes', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(inventories.inventory_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere('companies.name', 'LIKE', '%' . $search . '%');
            })
            ->Where(function ($query) use ($company_search, $store_search, $department_search, $contract_search) {
                if ($company_search) {
                    $query->Where('companies.id', $company_search);
                }
                if ($contract_search || $department_search || $store_search) {
                    $query->whereRaw(0);
                }
            });
        $location =
            Inventory::select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), 'locations.name AS location_name')
            ->join('locations', 'locations.id', '=', 'inventories.object_id')
            ->where('inventories.object_type', \DB::raw('"App\\\Models\\\Location"'))
            ->Where(function ($query) use ($search) {
                $query = $query
                    ->Where('inventories.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('inventories.notes', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(inventories.inventory_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere('locations.name', 'LIKE', '%' . $search . '%');
            })
            ->Where(function ($query) use ($company_search, $store_search, $department_search, $contract_search) {
                if ($contract_search || $department_search || $store_search || $company_search) {
                    $query->whereRaw(0);
                }
            });

        $contract_department =
            Inventory::select('inventories.*', 'departments.name as department_name', 'stores.name as store_name', 'companies.name as company_name', 'contracts.name as contract_name', \DB::raw('null AS name_sort'), 'locations.name as location_name')
            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
            ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
            ->join('departments', 'departments.id', '=', 'contracts.object_id')
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('inventories.object_type', \DB::raw('"App\\\Models\\\Contract"'))
            ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Department"'))
            ->Where(function ($query) use ($search) {
                $query = $query->Where('inventories.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('inventories.notes', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(inventories.inventory_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere('companies.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('stores.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('departments.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('contracts.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('locations.name', 'LIKE', '%' . $search . '%');
            })
            ->Where(function ($query) use ($company_search, $store_search, $department_search, $contract_search) {
                if ($company_search) {
                    $query->Where('companies.id', $company_search);
                }
                if ($store_search) {
                    $query->Where('stores.id', $store_search);
                }
                if ($department_search) {
                    $query->Where('departments.id', $department_search);
                }
                if ($contract_search) {
                    $query->Where('contracts.id', $contract_search);
                }
            });

        $contract_store =
            Inventory::select('inventories.*', \DB::raw('null AS department_name'), 'stores.name as store_name', 'companies.name as company_name', 'contracts.name as contract_name', \DB::raw('null AS name_sort'), 'locations.name as location_name')
            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
            ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
            ->join('stores', 'stores.id', '=', 'contracts.object_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('inventories.object_type', \DB::raw('"App\\\Models\\\Contract"'))
            ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Store"'))
            ->Where(function ($query) use ($search) {
                $query = $query->Where('inventories.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('inventories.notes', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(inventories.inventory_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere('companies.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('stores.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('contracts.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('locations.name', 'LIKE', '%' . $search . '%');
            })
            ->Where(function ($query) use ($company_search, $store_search, $department_search, $contract_search) {
                if ($company_search) {
                    $query->Where('companies.id', $company_search);
                }
                if ($store_search) {
                    $query->Where('stores.id', $store_search);
                }
                if ($department_search) {
                    $query->whereRaw(0);
                }
                if ($contract_search) {
                    $query->Where('contracts.id', $contract_search);
                }
            });

        $contract_company =
            Inventory::select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), 'companies.name as company_name', 'contracts.name as contract_name', \DB::raw('null AS name_sort'), 'locations.name as location_name')
            ->join('contracts', 'contracts.id', '=', 'inventories.object_id')
            ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
            ->join('companies', 'companies.id', '=', 'contracts.object_id')
            ->where('inventories.object_type', \DB::raw('"App\\\Models\\\Contract"'))
            ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Company"'))
            ->Where(function ($query) use ($search) {
                $query = $query->Where('inventories.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('inventories.notes', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(inventories.inventory_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere('companies.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('contracts.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('locations.name', 'LIKE', '%' . $search . '%');
            })
            ->Where(function ($query) use ($company_search, $store_search, $department_search, $contract_search) {
                if ($company_search) {
                    $query->Where('companies.id', $company_search);
                }
                if ($department_search || $store_search) {
                    $query->whereRaw(0);
                }
                if ($contract_search) {
                    $query->Where('contracts.id', $contract_search);
                }
            });

        return $department
            ->union($store)
            ->union($company)
            ->union($location)
            ->union($contract_department)
            ->union($contract_store)
            ->union($contract_company);
    }
    /**
     * Fillter inventory
     * @param company,store,department,contract,inventory
     * @return Inventory
     */
    public function filter($company = "", $store = "", $department = "", $contract = "", $inventory, $search = "")
    {
        if ($department) {
            if ($contract) {
                $inventory = $inventory
                    ->select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), 'contracts.name AS contract_name', \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
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
                if ($search) {
                    $inventory = $inventory
                        ->select('inventories.*', 'departments.name AS department_name', 'stores.name AS store_name', 'companies.name AS company_name', \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
                        ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->where('inventories.object_id', $department);
                }
                if (!$search) {
                    $inventory = $inventory
                        ->select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
                        ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->where('inventories.object_id', $department);
                    $inventory->union(
                        Inventory::select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
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
            }
        } else {
            if ($store) {
                if ($contract) {
                    $inventory = $inventory
                        ->select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), 'contracts.name AS contract_name', \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
                        ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                        ->whereIn(
                            'inventories.object_id',
                            Contract::select('contracts.id as id')
                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                                ->whereIn(
                                    'contracts.object_id',
                                    Department::select('departments.id')
                                        ->join('stores', 'stores.id', '=', 'departments.store_id')
                                        ->where('stores.id', '=', $store)
                                )
                                ->union(
                                    Contract::select('contracts.id as id')
                                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                        ->where('contracts.object_id', '=', $store)
                                )
                                ->get()
                        );
                } else {
                    if ($search) {
                        $inventory = $inventory
                            ->select('inventories.*', 'departments.name AS department_name', 'stores.name AS store_name', 'companies.name AS company_name', \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                            ->whereIn(
                                'inventories.object_id',
                                Department::select('departments.id')
                                    ->join('stores', 'stores.id', '=', 'departments.store_id')
                                    ->where('stores.id', $store)
                            );
                    }
                    if (!$search) {
                        $inventory = $inventory
                            ->select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                            ->whereIn(
                                'inventories.object_id',
                                Department::select('departments.id')
                                    ->join('stores', 'stores.id', '=', 'departments.store_id')
                                    ->where('stores.id', $store)
                            );
                        $inventory->union(
                            Inventory::select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
                                ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                ->where('inventories.object_id', $store)
                        )
                            ->union(
                                Inventory::select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
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
                            );
                    }
                }
            } elseif ($company) {
                if ($contract) {
                    $inventory = $inventory
                        ->select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), 'contracts.name AS contract_name', \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
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
                                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                        ->whereIn(
                                            'contracts.object_id',
                                            Store::select('stores.id')
                                                ->join('companies', 'companies.id', '=', 'stores.company_id')
                                                ->where('companies.id', '=', $company)
                                        )
                                )
                                ->union(
                                    Contract::select('contracts.id as id')
                                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                        ->where('contracts.object_id', '=', $company)
                                )
                                ->get()


                        );
                } else {
                    if ($search) {
                        $inventory = $inventory
                            ->select('inventories.*', \DB::raw('departments.name AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                            ->whereIn(
                                'inventories.object_id',
                                Department::select('departments.id')
                                    ->join('stores', 'stores.id', '=', 'departments.store_id')
                                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                                    ->where('companies.id', '=', $company)
                            );
                    }
                    if (!$search) {
                        $inventory = $inventory
                            ->select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
                            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                            ->whereIn(
                                'inventories.object_id',
                                Department::select('departments.id')
                                    ->join('stores', 'stores.id', '=', 'departments.store_id')
                                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                                    ->where('companies.id', '=', $company)
                            );
                        $inventory->union(
                            Inventory::select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
                                ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                ->whereIn(
                                    'inventories.object_id',
                                    Store::select('stores.id')
                                        ->join('companies', 'companies.id', '=', 'stores.company_id')
                                        ->where('companies.id', '=', $company)
                                )
                        )
                            ->union(
                                Inventory::select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
                                    ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                    ->where('inventories.object_id', '=', $company)
                            )
                            ->union(
                                Inventory::select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
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
                            );
                    }
                }
            }
        }
        if ($contract) {
            $inventory = $inventory
                ->select('inventories.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), \DB::raw('null AS contract_name'), \DB::raw('null AS name_sort'), \DB::raw('null AS location_name'))
                ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                ->where('inventories.object_id', $contract);
        }
        return $inventory;
    }
    public function offlineDataSync()
    {
        $listAllCompany = Company::select('id', 'name')->orderBy('name', 'ASC')->paginate();
        $listAllStore = Store::select('id', 'name', 'company_id')->orderBy('name', 'ASC')->paginate();
        $listAllContract = Contract::select('id', 'name', 'store_id')->orderBy('name', 'ASC')->paginate();
        $listAllInventory = Inventories::select('id', 'name', 'contract_id', 'inventory_date')->orderBy('name', 'ASC')->paginate();

        return response()->json([
            'listCompany'  => $listAllCompany,
            'listStore'    => $listAllStore,
            'listContract' => $listAllContract,
            'listInventory' => $listAllInventory
        ]);
    }

    public function savelist(Request $request)
    {
        $msg = "";
        $arrayAssetOff = json_decode($request->item, true);
        for ($i = 0; $i < count($arrayAssetOff); $i++) {
            $asset_Id = Asset::select(['id'])->where('asset_tag', '=', substr($arrayAssetOff[$i]['asset_number'], 4))->get();
            $arrayAssets = ContractAsset::select([
                'assets.asset_tag',
                'assets.id'
            ])->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                ->where("assets.asset_tag", '=', substr($arrayAssetOff[$i]['asset_number'], 4))->get();

            $inventory = new InventoryResults();
            $inventory->inventory_id = $request->inventory_id;
            $inventory->checked_time = Carbon::parse($arrayAssetOff[$i]['date_scan'])->format('Y-m-d h:i:s');
            $inventory->user_id = Auth::id();

            if ($arrayAssets->count() <= 0) {
                $inventory->asset_id = $asset_Id != null ? $asset_Id[0]->id : '';
                $inventory->unrecognized = 1;
                $inventory->save();
                $msg .= trans('admin/inventories/api.device') . $arrayAssetOff[$i]['asset_number'] . trans('admin/inventories/api.unrecognized_scan') . "**";
            } else {
                $inventory->asset_id = $arrayAssets[0]->id;
                $inventory->unrecognized = 0;
                $inventory->save();
                $msg .= trans('admin/inventories/api.device') . $arrayAssetOff[$i]['asset_number'] . trans('admin/inventories/api.success_scan') . "**";
            }
        }
        return response()->json(['success_scan' => $msg], 200);
    }
}