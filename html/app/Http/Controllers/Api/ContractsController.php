<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Transformers\ContractsTransformer;
use App\Http\Transformers\SelectlistTransformer;
use Illuminate\Http\Request;
use App\Models\Contract;
use App\Models\Store;
use App\Models\Department;
use DB;
use Input;
use Paginator;

/**
 * @version    v1.0
 * @author [Thinh.NP] 
 */
class ContractsController extends Controller
{
    public function index(Request $request)
    {

        $this->authorize('view', Contract::class);

        $contract = Contract::select('contracts.*',  \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
            ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
            ->leftjoin('users as user1', 'user1.id', '=', 'contracts.contact_id_1')
            ->leftjoin('users as user2', 'user2.id', '=', 'contracts.contact_id_2')
            ->with('company', 'store', 'location', 'user');

        $search = $request->input('search');
        $company_search = $request->input('company_id');
        $store_search = $request->input('store_id');
        $department_search = $request->input('department_id');
        $billing_date = $request->input('billing_date');

        if ($search) {
            $contract = self::search($search, $company_search, $store_search, $department_search, $billing_date);
        }
        $contract = self::filter($company_search, $store_search, $department_search, $contract, $search, $billing_date);

        $limit = request('limit', 50);
        $order = $request->input('order') === 'asc' ? 'asc' : 'desc';
        $allowed_columns = [
            'id', 'name', 'start_date', 'end_date', 'company', 'store', 'department', 'location', 'billing_date', 'payment_date', 'location_id', 'contact_id_1', 'contact_id_2'
        ];

        $sort = in_array($request->input('sort'), $allowed_columns) ? $request->input('sort') : 'created_at';
        switch ($sort) {

            case 'company':
                $contract = $contract->SortCompany($order, $company_search, $store_search, $department_search, $billing_date, $search, $contract = new Contract);
                break;
            case 'store':
                $contract = $contract->SortStore($order, $company_search, $store_search, $department_search, $billing_date, $search, $contract = new Contract);
                break;
            case 'department':
                $contract = $contract->SortDepartment($order, $company_search, $store_search, $department_search, $billing_date, $search, $contract = new Contract);
                break;
            case 'location_id':
                $contract = $contract->orderBy('location_name', $order);
                break;
            case 'contact_id_1':
                $contract = $contract->orderBy('contact_1', $order);
                break;
            case 'contact_id_2':
                $contract = $contract->orderBy('contact_2', $order);
                break;
            default:
                $contract = $contract->orderBy($sort, $order);
                break;
        }

        $total = $contract->get()->count();
        $offset = (($contract) && (request('offset') > $contract->get()->count())) ? 0 : request('offset', 0);
        $contract = $contract->skip($offset)->take($limit)->get();
        return (new ContractsTransformer)->transformContractList($contract, $total);
    }

    public function search($search = "", $company_search = "", $store_search = "", $department_search = "", $billing_date = "")
    {
        $department =
            Contract::select('contracts.*', 'departments.name as department_name', 'stores.name as store_name', 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
            ->join('departments', 'departments.id', '=', 'contracts.object_id')
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
            ->leftjoin('users as user1', 'user1.id', '=', 'contracts.contact_id_1')
            ->leftjoin('users as user2', 'user2.id', '=', 'contracts.contact_id_2')
            ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Department"'))
            ->Where(function ($query) use ($search) {
                $query
                    ->Where('contracts.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('locations.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('companies.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('stores.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('departments.name', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw("CONCAT(user1.first_name, ' ', user1.last_name)"), 'LIKE', "%" . $search . "%")
                    ->orWhere(DB::raw("CONCAT(user2.first_name, ' ', user2.last_name)"), 'LIKE', "%" . $search . "%")
                    ->orWhere(DB::raw('CAST(contracts.start_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.end_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.billing_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.payment_date AS char)'), 'LIKE', '%' . $search . '%');
            })
            ->Where(function ($query) use ($company_search, $store_search, $department_search, $billing_date) {
                if ($company_search) {
                    $query->Where('companies.id', $company_search);
                }
                if ($store_search) {
                    $query->Where('stores.id', $store_search);
                }
                if ($department_search) {
                    $query->Where('departments.id', $department_search);
                }
                if ($billing_date) {
                    $query->Where(DB::raw('CAST(contracts.billing_date AS char)'), 'LIKE', '%' . $billing_date . '%');
                }
            });

        $store =
            Contract::select('contracts.*', \DB::raw('null AS department_name'), 'stores.name as store_name', 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
            ->join('stores', 'stores.id', '=', 'contracts.object_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
            ->leftjoin('users as user1', 'user1.id', '=', 'contracts.contact_id_1')
            ->leftjoin('users as user2', 'user2.id', '=', 'contracts.contact_id_2')
            ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Store"'))
            ->Where(function ($query) use ($search) {
                $query
                    ->Where('contracts.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('locations.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('companies.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('stores.name', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw("CONCAT(user1.first_name, ' ', user1.last_name)"), 'LIKE', "%" . $search . "%")
                    ->orWhere(DB::raw("CONCAT(user2.first_name, ' ', user2.last_name)"), 'LIKE', "%" . $search . "%")
                    ->orWhere(DB::raw('CAST(contracts.start_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.end_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.billing_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.payment_date AS char)'), 'LIKE', '%' . $search . '%');
            })
            ->Where(function ($query) use ($company_search, $store_search, $department_search, $billing_date) {
                if ($company_search) {
                    $query->Where('companies.id', $company_search);
                }
                if ($store_search) {
                    $query->Where('stores.id', $store_search);
                }
                if ($department_search) {
                    $query->whereRaw(0);
                }
                if ($billing_date) {
                    $query->Where(DB::raw('CAST(contracts.billing_date AS char)'), 'LIKE', '%' . $billing_date . '%');
                }
            });

        $company =
            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), 'companies.name as company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
            ->join('companies', 'companies.id', '=', 'contracts.object_id')
            ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
            ->leftjoin('users as user1', 'user1.id', '=', 'contracts.contact_id_1')
            ->leftjoin('users as user2', 'user2.id', '=', 'contracts.contact_id_2')
            ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Company"'))
            ->Where(function ($query) use ($search) {
                $query
                    ->Where('contracts.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('locations.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('companies.name', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw("CONCAT(user1.first_name, ' ', user1.last_name)"), 'LIKE', "%" . $search . "%")
                    ->orWhere(DB::raw("CONCAT(user2.first_name, ' ', user2.last_name)"), 'LIKE', "%" . $search . "%")
                    ->orWhere(DB::raw('CAST(contracts.start_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.end_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.billing_date AS char)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.payment_date AS char)'), 'LIKE', '%' . $search . '%');
            })
            ->Where(function ($query) use ($company_search, $store_search, $department_search, $billing_date) {
                if ($company_search) {
                    $query->Where('companies.id', $company_search);
                }
                if ($store_search) {
                    $query->whereRaw(0);
                }
                if ($department_search) {
                    $query->whereRaw(0);
                }
                if ($billing_date) {
                    $query->Where(DB::raw('CAST(contracts.billing_date AS char)'), 'LIKE', '%' . $billing_date . '%');
                }
            });
        return $department
            ->union($store)
            ->union($company);
    }

    public function filter($company = "", $store = "", $department = "", $contract = "", $search = "", $billing_date = "")
    {
        if ($department) {

            if ($search) {
                $contract = $contract
                    ->select('contracts.*', 'departments.name AS department_name', 'stores.name AS store_name', 'companies.name AS company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->where('contracts.object_id', $department);
            }
            if (!$search) {
                $contract = $contract
                    ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->where('contracts.object_id', $department);
            }
        } else {
            if ($store) {
                if ($search) {
                    $contract = $contract
                        ->select('contracts.*', 'departments.name AS department_name', 'stores.name AS store_name', 'companies.name AS company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'contracts.object_id',
                            Department::select('departments.id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->where('stores.id', $store)
                        );
                }
                if (!$search) {
                    $contract = $contract
                        ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'contracts.object_id',
                            Department::select('departments.id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->where('stores.id', $store)
                        );
                    $contract->union(
                        Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                            ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                            ->leftjoin('users as user1', 'user1.id', '=', 'contracts.contact_id_1')
                            ->leftjoin('users as user2', 'user2.id', '=', 'contracts.contact_id_2')
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->where('contracts.object_id', $store)
                    );
                }
            } elseif ($company) {

                if ($search) {
                    $contract = $contract
                        ->select('contracts.*', 'departments.name AS department_name', 'stores.name AS store_name', 'companies.name AS company_name', 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'contracts.object_id',
                            Department::select('departments.id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->join('companies', 'companies.id', '=', 'stores.company_id')
                                ->where('companies.id', '=', $company)
                        );
                }
                if (!$search) {
                    $contract = $contract
                        ->select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'contracts.object_id',
                            Department::select('departments.id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->join('companies', 'companies.id', '=', 'stores.company_id')
                                ->where('companies.id', '=', $company)
                        );
                    $contract->union(
                        Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                            ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                            ->leftjoin('users as user1', 'user1.id', '=', 'contracts.contact_id_1')
                            ->leftjoin('users as user2', 'user2.id', '=', 'contracts.contact_id_2')
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->whereIn(
                                'contracts.object_id',
                                Store::select('stores.id')
                                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                                    ->where('companies.id', '=', $company)
                            )
                    )
                        ->union(
                            Contract::select('contracts.*', \DB::raw('null AS department_name'), \DB::raw('null AS store_name'), \DB::raw('null AS company_name'), 'user1.first_name as contact_1', 'user2.first_name as contact_2', 'locations.name as location_name')
                                ->leftjoin('locations', 'locations.id', '=', 'contracts.location_id')
                                ->leftjoin('users as user1', 'user1.id', '=', 'contracts.contact_id_1')
                                ->leftjoin('users as user2', 'user2.id', '=', 'contracts.contact_id_2')
                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                ->where('contracts.object_id', '=', $company)
                        );
                }
            }
        }
        if ($billing_date) {
            $contract = $contract->Where(DB::raw('CAST(contracts.billing_date AS char)'), 'LIKE', '%' . $billing_date . '%');
        }
        return $contract;
    }

    public function selectlist(Request $request)
    {
        $page = Input::get('page', 1);
        $paginate = 50;
        $listContract = Contract::select([
            'contracts.id',
            'contracts.name',
            'contracts.start_date',
        ]);

        $company = $request->get('company_id');
        $store = $request->get('store_id');
        $department = $request->get('department_id');
        if ($request->has('search')) {
            $listContract = $listContract->where('contracts.name', 'LIKE', '%' . $request->input('search') . '%');
        }

        if ($department) {
            $listContract = $listContract
                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                ->where('contracts.object_id', $department)
                ->get();
        } else {
            if ($store) {
                $contract_store = Contract::select('contracts.id', 'contracts.name', 'contracts.start_date')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'contracts.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->where('stores.id', '=', $store)
                    );
                $listContract = $listContract
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                    ->where('contracts.object_id', $store)
                    ->union($contract_store)
                    ->get();
            } else {
                if ($company) {
                    $contract_company = Contract::select('contracts.id', 'contracts.name', 'contracts.start_date')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                        ->whereIn(
                            'contracts.object_id',
                            Store::select('stores.id')
                                ->join('companies', 'companies.id', '=', 'stores.company_id')
                                ->where('companies.id', '=', $company)
                        );
                    $contract_store = Contract::select('contracts.id', 'contracts.name', 'contracts.start_date')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'contracts.object_id',
                            Department::select('departments.id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->join('companies', 'companies.id', '=', 'stores.company_id')
                                ->where('companies.id', '=', $company)
                        );
                    $listContract = $listContract
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                        ->where('contracts.object_id', $company)
                        ->union($contract_store)
                        ->union($contract_company)
                        ->get();
                } else {
                    $listContract = $listContract->get();
                }
            }
        }
        if ($request->date_contract != null) {
            $listContract->where('contracts.start_date', '=', $request->date_contract);
        }
        $slice = array_slice($listContract->toArray(), $paginate * ($page - 1), $paginate);
        $result = new \Illuminate\Pagination\LengthAwarePaginator($slice, count($listContract), $paginate);
        return (new SelectlistTransformer)->transformSelectlistContract($result);
    }
}
