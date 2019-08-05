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

        $contract = Contract::select('contracts.*')->with('company', 'store', 'location', 'user');

        if ($request->has('department')) {
            $contract = $contract->FilterDepartmentInDepartment($request->input('department'));
        } else {
            if ($request->has('store')) {
                $contract = $contract->FilterDepartmentInStore($request->input('store'))
                    ->union(Contract::select('contracts.*')->FilterStoreInStore($request->input('store')));
            } else if ($request->input('company')) {
                $contract = $contract->FilterDepartmentInCompany($request->input('company'))
                    ->union(Contract::select('contracts.*')->FilterStoreInCompany($request->input('company')))
                    ->union(Contract::select('contracts.*')->FilterCompanyInCompany($request->input('company')));
            }
        }

        if ($request->input('search')) {
            $contract = $contract->SearchCompany($request->input('search'))
                ->union(Contract::select('contracts.*')->SearchStore($request->input('search'))->whereNull('contracts.deleted_at'))
                ->union(Contract::select('contracts.*')->SearchDepartment($request->input('search'))->whereNull('contracts.deleted_at'));
        }

        if ($request->input('department')) {
            $department = Contract::select('contracts.*')->TotalDepartment('departments.id', $request->input('department'))->count();
            $countSort = $department;
        } else if ($request->input('store')) {
            $store = Contract::select('contracts.*')->TotalStore('stores.id', $request->input('store'))->count();
            $department = Contract::select('contracts.*')->TotalDepartment('stores.id', $request->input('store'))->count();
            $countSort = $store + $department;
        } else if ($request->input('company')) {
            $company = Contract::select('contracts.*')->TotalCompany('companies.id', $request->input('company'))->count();
            $store = Contract::select('contracts.*')->TotalStore('companies.id', $request->input('company'))->count();
            $department = Contract::select('contracts.*')->TotalDepartment('companies.id', $request->input('company'))->count();
            $countSort = $company + $store + $department;
        } else if ($request->input('billing_date')) {
            $countSort = Contract::select('contracts.*')
                ->where('contracts.billing_date', 'LIKE', $request->input('billing_date') . '-%')->whereNull('contracts.deleted_at')->count();
        } else if ($request->input('search')) {
            $company = Contract::select('contracts.*')->SearchCompany($request->input('search'))->whereNull('contracts.deleted_at')->count();
            $store = Contract::select('contracts.*')->SearchStore($request->input('search'))->whereNull('contracts.deleted_at')->count();
            $department = Contract::select('contracts.*')->SearchDepartment($request->input('search'))->whereNull('contracts.deleted_at')->count();
            $countSort = $company + $store + $department;
        } else {
            $countSort = $contract->count();
        }

        $allowed_columns = ['location_id', 'store', 'contact_id_1', 'contact_id_2', 'company', 'department'];
        $order = $request->input('order') === 'asc' ? 'asc' : 'desc';
        $sort = in_array($request->input('sort'), $allowed_columns) ? e($request->input('sort')) : 'name';
        $offset = (($contract) && (request('offset') > $countSort)) ? 0 : request('offset', 0);
        $limit = $request->input('limit', 50);

        switch ($request->input('sort')) {
            case 'company':
                if ($request->input('department')) {
                    $contract = $contract;
                } else if ($request->input('store')) {
                    $contract = $contract;
                } else if ($request->input('company')) {
                    $contract = $contract;
                } else if ($request->input('search')) {
                    $contract = $contract;
                } else {
                    $contract = Contract::select('contracts.*', 'companies.name as company_name')->SortCompany($order);
                }
                break;

            case 'store':
                if ($request->input('department')) {
                    $contract = $contract;
                } else if ($request->input('store')) {
                    $contract = $contract;
                } else if ($request->input('company')) {
                    $contract = Contract::select('contracts.*', 'stores.name as stores', 'stores.id as stores_id')->SortStoreCompany($order, $request->input('company'));
                } else if ($request->input('search')) {
                    $contract = $contract;
                } else {
                    $contract = Contract::select('contracts.*', 'stores.name as stores', 'stores.id as stores_id')->SortStore($order);
                }
                break;

            case 'department':
                if (($request->input('department'))) {
                    $contract = $contract;
                } else if ($request->input('store')) {
                    $contract = Contract::select('contracts.*', 'departments.name as departments', 'departments.id as departments_id')->SortStoreDepartment($order, $request->input('store'));
                } else if ($request->input('company')) {
                    $contract = Contract::select('contracts.*', 'departments.name as departments', 'departments.id as departments_id')->SortCompanyDepartment($order, $request->input('company'));
                } else if ($request->input('search')) {
                    $contract = $contract;
                } else {
                    $contract = Contract::select('contracts.*', 'departments.name as departments', 'departments.id as departments_id')->SortDepartment($order);
                }
                break;

            case 'location_id':
                if (($request->input('department'))) {
                    $contract = Contract::select('contracts.*', \DB::raw('locations.name AS location_name'))->OrderLocationDepartment($order, $request->input('department'));
                } else if ($request->input('store')) {
                    $contract = Contract::select('contracts.*', \DB::raw('locations.name AS location_name'))->OrderLocationStore($order, $request->input('store'));
                } else if ($request->input('company')) {
                    $contract = Contract::select('contracts.*', \DB::raw('locations.name AS location_name'))->OrderLocationCompany($order, $request->input('company'));
                } else {
                    $contract = $contract->OrderLocation($order);
                }
                break;

            case 'contact_id_1':
                if (($request->input('department'))) {
                    $contract = Contract::select('contracts.*', \DB::raw('users.last_name AS last_name'))->OrderContactDepartment('contact_id_1', $order, $request->input('department'));
                } else if ($request->input('store')) {
                    $contract = Contract::select('contracts.*', \DB::raw('users.last_name AS last_name'))->OrderContactStore('contact_id_1', $order, $request->input('store'));
                } else if ($request->input('company')) {
                    $contract = Contract::select('contracts.*', \DB::raw('users.last_name AS last_name'))->OrderContactCompany('contact_id_1', $order, $request->input('company'));
                } else {
                    $contract = $contract->OrderContactOne($order);
                }
                break;

            case 'contact_id_2':
                if (($request->input('department'))) {
                    $contract = Contract::select('contracts.*', \DB::raw('users.last_name AS last_name'))->OrderContactDepartment('contact_id_2', $order, $request->input('department'));
                } else if ($request->input('store')) {
                    $contract = Contract::select('contracts.*', \DB::raw('users.last_name AS last_name'))->OrderContactStore('contact_id_2', $order, $request->input('store'));
                } else if ($request->input('company')) {
                    $contract = Contract::select('contracts.*', \DB::raw('users.last_name AS last_name'))->OrderContactCompany('contact_id_2', $order, $request->input('company'));
                } else {
                    $contract = $contract->OrderContactTwo($order);
                }
                break;

            case 'start_date':
                $contract = $contract->OrderDate('start_date', $order);
                break;

            case 'end_date':
                $contract = $contract->OrderDate('end_date', $order);
                break;

            case 'billing_date':
                $contract = $contract->OrderDate('billing_date', $order);
                break;

            case 'payment_date':
                $contract = $contract->OrderDate('payment_date', $order);
                break;

            default:
                $contract = $contract->orderBy($sort, $order);
                break;
        }

        if ($request->input('department')) {
            $department = Contract::select('contracts.*')->TotalDepartment('departments.id', $request->input('department'))->count();
            $total = $department;
        } else if ($request->input('store')) {
            $store = Contract::select('contracts.*')->TotalStore('stores.id', $request->input('store'))->count();
            $department = Contract::select('contracts.*')->TotalDepartment('stores.id', $request->input('store'))->count();
            $total = $store + $department;
        } else if ($request->input('company')) {
            $company = Contract::select('contracts.*')->TotalCompany('companies.id', $request->input('company'))->count();
            $store = Contract::select('contracts.*')->TotalStore('companies.id', $request->input('company'))->count();
            $department = Contract::select('contracts.*')->TotalDepartment('companies.id', $request->input('company'))->count();
            $total = $company + $store + $department;
        } else if ($request->input('billing_date')) {
            $total = Contract::select('contracts.*')
                ->where('contracts.billing_date', 'LIKE', $request->input('billing_date') . '-%')->whereNull('contracts.deleted_at')->count();
        } else if ($request->input('search')) {
            $company = Contract::select('contracts.*')->SearchCompany($request->input('search'))->whereNull('contracts.deleted_at')->count();
            $store = Contract::select('contracts.*')->SearchStore($request->input('search'))->whereNull('contracts.deleted_at')->count();
            $department = Contract::select('contracts.*')->SearchDepartment($request->input('search'))->whereNull('contracts.deleted_at')->count();
            $total = $company + $store + $department;
        } else {
            $total = Contract::select('contract.*')->whereNull('contracts.deleted_at')->count();
        }

        if ($request->has('billing_date')) {
            if ($request->input('sort') == 'company' || $request->input('sort') == 'store' || $request->input('sort') == 'department') {
                $contract = Contract::where('contracts.billing_date', 'LIKE', $request->input('billing_date') . '-%');
            } else {
                $contract = $contract->where('contracts.billing_date', 'LIKE', $request->input('billing_date') . '-%');
            }
        }

        $contract = $contract->skip($offset)->take($limit)->whereNull('contracts.deleted_at')->get();
        return (new ContractsTransformer)->transformContractList($contract, $total);
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

        $company = $request->get('company');
        $store = $request->get('store');
        $department = $request->get('department');
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
