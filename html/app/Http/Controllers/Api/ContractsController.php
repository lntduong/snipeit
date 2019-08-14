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
        $contract = Contract::select('contracts.*')
            ->with('company')
            ->with('store')
            ->with('department');

        $search = $request->input('search');
        $company_search = $request->input('company_id');
        $store_search = $request->input('store_id');
        $department_search = $request->input('department_id');

        if ($search) {
            $contract = self::search($search, $company_search, $store_search, $department_search);
        }

        $contract = self::filter($company_search, $store_search, $department_search, $contract, $search);

        $limit = request('limit', 50);
        $order = $request->input('order') === 'asc' ? 'asc' : 'desc';
        $allowed_columns = [
            'id', 'name', 'company', 'store', 'department', 'start_date', 'end_date', 'billing_date', 'payment_date', 'location_id', 'contact_id_1', 'contact_id_2'
        ];

        $sort = in_array($request->input('sort'), $allowed_columns) ? $request->input('sort') : 'created_at';
        switch ($sort) {

            case 'company':
                $contract = $contract->SortCompany($order, $company_search, $store_search, $department_search, $search);
                break;
            case 'store':
                $contract = $contract->SortStore($order, $company_search, $store_search, $department_search, $contract = new Contract, $search);
                break;
            case 'department':
                $contract = $contract->SortDepartment($order, $company_search, $store_search, $department_search, $contract = new Contract, $search);
                break;
            case 'location_id':
                $contract = $contract->SortLocation($order, $company_search, $store_search, $department_search, $contract = new Contract, $search);
                break;
            case 'contact_id_1':
                $contract = $contract->SortUser($order, $company_search, $store_search, $department_search, $contract = new Contract, $search, 'contracts.contact_id_1', 'user_name_1');
                break;
            case 'contact_id_2':
                $contract = $contract->SortUser($order, $company_search, $store_search, $department_search, $contract = new Contract, $search, 'contracts.contact_id_2', 'user_name_2');
                break;
            case 'name':
                $contract = $contract->orderBy('name', $order);
                break;
            case 'start_date':
                $contract = $contract->orderBy('start_date', $order);
                break;
            case 'end_date':
                $contract = $contract->orderBy('end_date', $order);
                break;
            case 'billing_date':
                $contract = $contract->orderBy('billing_date', $order);
                break;
            case 'payment_date':
                $contract = $contract->orderBy('payment_date', $order);
                break;
        }
        $total = $contract->get()->count();
        $offset = (($contract) && (request('offset') > $contract->get()->count())) ? 0 : request('offset', 0);
        $contract = $contract->skip($offset)->take($limit)->get();

        return (new ContractsTransformer)->transformContractList($contract, $total);
    }

    public function search($search = "", $company_search = "", $store_search = "", $department_search = "")
    {
        $department =
            Contract::select(
                'contracts.*',
                'departments.name as department_name',
                'stores.name as store_name',
                'companies.name as company_name',
                \DB::raw('null AS location_name'),
                \DB::raw('null AS user_name_1'),
                \DB::raw('null AS user_name_2')
            )
            ->join('departments', 'departments.id', '=', 'contracts.object_id')
            ->join('stores', 'stores.id', '=', 'departments.store_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Department"'))
            ->Where(function ($query) use ($search) {
                $query = $query
                    ->Where('contracts.name', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.start_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.end_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.billing_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.payment_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere('companies.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('stores.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('departments.name', 'LIKE', '%' . $search . '%');
            })
            ->Where(function ($query) use ($company_search, $store_search, $department_search) {
                if ($company_search) {
                    $query->Where('companies.id', $company_search);
                }
                if ($store_search) {
                    $query->Where('stores.id', $store_search);
                }
                if ($department_search) {
                    $query->Where('departments.id', $department_search);
                }
            });

        $store =
            Contract::select(
                'contracts.*',
                \DB::raw('null AS department_name'),
                'stores.name as store_name',
                'companies.name as company_name',
                \DB::raw('null AS location_name'),
                \DB::raw('null AS user_name_1'),
                \DB::raw('null AS user_name_2')
            )
            ->join('stores', 'stores.id', '=', 'contracts.object_id')
            ->join('companies', 'companies.id', '=', 'stores.company_id')
            ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Store"'))
            ->Where(function ($query) use ($search) {
                $query = $query->Where('contracts.name', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.start_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.end_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.billing_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.payment_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere('companies.name', 'LIKE', '%' . $search . '%')
                    ->orWhere('stores.name', 'LIKE', '%' . $search . '%');
            })
            ->Where(function ($query) use ($company_search, $store_search, $department_search) {
                if ($company_search) {
                    $query->Where('companies.id', $company_search);
                }
                if ($store_search) {
                    $query->Where('stores.id', $store_search);
                }
                if ($department_search) {
                    $query->whereRaw(0);
                }
            });

        $company =
            Contract::select(
                'contracts.*',
                \DB::raw('null AS department_name'),
                \DB::raw('null AS store_name'),
                'companies.name as company_name',
                \DB::raw('null AS location_name'),
                \DB::raw('null AS user_name_1'),
                \DB::raw('null AS user_name_2')
            )
            ->join('companies', 'companies.id', '=', 'contracts.object_id')
            ->where('contracts.object_type', \DB::raw('"App\\\Models\\\Company"'))
            ->Where(function ($query) use ($search) {
                $query = $query->Where('contracts.name', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.start_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.end_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.billing_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.payment_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere('companies.name', 'LIKE', '%' . $search . '%');
            })
            ->Where(function ($query) use ($company_search, $store_search, $department_search) {
                if ($company_search) {
                    $query->Where('companies.id', $company_search);
                }
                if ($department_search || $store_search) {
                    $query->whereRaw(0);
                }
            });
        $location =
            Contract::select(
                'contracts.*',
                \DB::raw('null AS department_name'),
                \DB::raw('null AS store_name'),
                \DB::raw('null AS company_name'),
                'locations.name AS location_name',
                \DB::raw('null AS user_name_1'),
                \DB::raw('null AS user_name_2')
            )
            ->join('locations', 'locations.id', '=', 'contracts.location_id')
            ->Where(function ($query) use ($search) {
                $query = $query
                    ->Where('contracts.name', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.start_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.end_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.billing_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.payment_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere('locations.name', 'LIKE', '%' . $search . '%');
            });

        $user =
            Contract::select(
                'contracts.*',
                \DB::raw('null AS department_name'),
                \DB::raw('null AS store_name'),
                \DB::raw('null AS company_name'),
                \DB::raw('null AS location_name'),
                'users.first_name AS user_name_1',
                \DB::raw('null AS user_name_2')
            )
            ->leftJoin('users', 'users.id', '=', 'contracts.contact_id_1')
            ->Where(function ($query) use ($search) {
                $query = $query
                    ->Where('contracts.name', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.start_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.end_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.billing_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.payment_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere('users.first_name', 'LIKE', '%' . $search . '%')
                    ->orWhere('users.last_name', 'LIKE', '%' . $search . '%')
                    ->orWhereRaw('CONCAT(' . DB::getTablePrefix() . 'users.first_name," ",' . DB::getTablePrefix() . 'users.last_name) LIKE ?', ["%$search%", "%$search%"])
                    ->orWhere('users.username', 'LIKE', '%' . $search . '%');
            });

        $user2 =
            Contract::select(
                'contracts.*',
                \DB::raw('null AS department_name'),
                \DB::raw('null AS store_name'),
                \DB::raw('null AS company_name'),
                \DB::raw('null AS location_name'),
                \DB::raw('null AS user_name_1'),
                'users.first_name AS user_name_2'

            )
            ->leftJoin('users', 'users.id', '=', 'contracts.contact_id_1')
            ->Where(function ($query) use ($search) {
                $query = $query
                    ->Where('contracts.name', 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.start_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.end_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.billing_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere(DB::raw('CAST(contracts.payment_date AS CHAR)'), 'LIKE', '%' . $search . '%')
                    ->orWhere('users.first_name', 'LIKE', '%' . $search . '%')
                    ->orWhere('users.last_name', 'LIKE', '%' . $search . '%')
                    ->orWhereRaw('CONCAT(' . DB::getTablePrefix() . 'users.first_name," ",' . DB::getTablePrefix() . 'users.last_name) LIKE ?', ["%$search%", "%$search%"])
                    ->orWhere('users.username', 'LIKE', '%' . $search . '%');
            });

        return $department
            ->union($store)
            ->union($company)
            ->union($location)
            ->union($user)
            ->union($user2);
    }

    public function filter($company = "", $store = "", $department = "", $contract,  $search = "")
    {
        if ($department) {
            if ($search) {
                $contract = $contract
                    ->select(
                        'contracts.*',
                        'departments.name AS department_name',
                        'stores.name AS store_name',
                        'companies.name AS company_name',
                        \DB::raw('null AS location_name'),
                        \DB::raw('null AS user_name_1'),
                        \DB::raw('null AS user_name_2')
                    )
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->where('contracts.object_id', $department);
            }
            if (!$search) {
                $contract = $contract
                    ->select(
                        'contracts.*',
                        \DB::raw('null AS department_name'),
                        \DB::raw('null AS store_name'),
                        \DB::raw('null AS company_name'),
                        \DB::raw('null AS location_name'),
                        \DB::raw('null AS user_name_1'),
                        \DB::raw('null AS user_name_2')
                    )
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->where('contracts.object_id', $department);
                $contract->union(
                    Contract::select(
                        'contracts.*',
                        \DB::raw('null AS department_name'),
                        \DB::raw('null AS store_name'),
                        \DB::raw('null AS company_name'),
                        \DB::raw('null AS location_name'),
                        \DB::raw('null AS user_name_1'),
                        \DB::raw('null AS user_name_2')
                    )
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
            }
        } else {
            if ($store) {
                if ($search) {
                    $contract = $contract
                        ->select(
                            'contracts.*',
                            'departments.name AS department_name',
                            'stores.name AS store_name',
                            'companies.name AS company_name',
                            \DB::raw('null AS location_name'),
                            \DB::raw('null AS user_name_1'),
                            \DB::raw('null AS user_name_2')
                        )
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
                        ->select(
                            'contracts.*',
                            \DB::raw('null AS department_name'),
                            \DB::raw('null AS store_name'),
                            \DB::raw('null AS company_name'),
                            \DB::raw('null AS location_name'),
                            \DB::raw('null AS user_name_1'),
                            \DB::raw('null AS user_name_2')
                        )
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'contracts.object_id',
                            Department::select('departments.id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->where('stores.id', $store)
                        );
                    $contract->union(
                        Contract::select(
                            'contracts.*',
                            \DB::raw('null AS department_name'),
                            \DB::raw('null AS store_name'),
                            \DB::raw('null AS company_name'),
                            \DB::raw('null AS location_name'),
                            \DB::raw('null AS user_name_1'),
                            \DB::raw('null AS user_name_2')
                        )
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->where('contracts.object_id', $store)
                    )
                        ->union(
                            Contract::select(
                                'contracts.*',
                                \DB::raw('null AS department_name'),
                                \DB::raw('null AS store_name'),
                                \DB::raw('null AS company_name'),
                                \DB::raw('null AS location_name'),
                                \DB::raw('null AS user_name_1'),
                                \DB::raw('null AS user_name_2')
                            )
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
                                        ->union(
                                            Contract::select('contracts.id as id')
                                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                                ->where('contracts.object_id', '=', $store)
                                        )
                                        ->get()
                                )
                        );
                }
            } elseif ($company) {
                if ($search) {
                    $contract = $contract
                        ->select(
                            'contracts.*',
                            \DB::raw('departments.name AS department_name'),
                            \DB::raw('null AS store_name'),
                            \DB::raw('null AS company_name'),
                            \DB::raw('null AS location_name'),
                            \DB::raw('null AS user_name_1'),
                            \DB::raw('null AS user_name_2')
                        )
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
                        ->select(
                            'contracts.*',
                            \DB::raw('null AS department_name'),
                            \DB::raw('null AS store_name'),
                            \DB::raw('null AS company_name'),
                            \DB::raw('null AS location_name'),
                            \DB::raw('null AS user_name_1'),
                            \DB::raw('null AS user_name_2')
                        )
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'contracts.object_id',
                            Department::select('departments.id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->join('companies', 'companies.id', '=', 'stores.company_id')
                                ->where('companies.id', '=', $company)
                        );
                    $contract->union(
                        Contract::select(
                            'contracts.*',
                            \DB::raw('null AS department_name'),
                            \DB::raw('null AS store_name'),
                            \DB::raw('null AS company_name'),
                            \DB::raw('null AS location_name'),
                            \DB::raw('null AS user_name_1'),
                            \DB::raw('null AS user_name_2')
                        )
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
                                \DB::raw('null AS location_name'),
                                \DB::raw('null AS user_name_1'),
                                \DB::raw('null AS user_name_2')
                            )
                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                ->where('contracts.object_id', '=', $company)
                        )
                        ->union(
                            Contract::select(
                                'contracts.*',
                                \DB::raw('null AS department_name'),
                                \DB::raw('null AS store_name'),
                                \DB::raw('null AS company_name'),
                                \DB::raw('null AS location_name'),
                                \DB::raw('null AS user_name_1'),
                                \DB::raw('null AS user_name_2')
                            )
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
        if ($request->has('search')) {
            $listContract = $listContract->where('contracts.name', 'LIKE', '%' . $request->input('search') . '%');
        }


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
