<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Transformers\InventoryResultsTransformer;
use App\Http\Transformers\DatatablesTransformer;
use App\Models\Setting;
use App\Models\InventoryResult;
use App\Models\Inventory;
use App\Models\ContractAsset;
use App\Models\Asset;
use App\Models\Contract;
use App\Models\Store;
use App\Models\Department;
use App\Helpers\Helper;
use Carbon\Carbon;
use DB;
use Auth;
use DateTime;
use App\Models\Statuslabel;
use App\Http\Requests\InventoryResultRequest;

/**
 * Display a listing of the resource.
 *
 * @author [Dang.HT]
 * @since [v1.0]
 *
 */
class InventoryResultsController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return List table inventory_result
     */
    public function index(Request $request)
    {
        $this->authorize('view', InventoryResult::class);
        $search = $request->input('search');
        if ($request->input('inventory_id')) {
            $inventory = Inventory::find($request->input('inventory_id'));
            $inventory_result = InventoryResult::Select('inventory_results.id', 'asset_id', 'checked_time', 'familiar', 'assets.name', 'assets.image', 'models.image as image_model', 'status_labels.id as status_id', 'status_labels.name as status_name', 'status_labels.deployable as status_dep', 'status_labels.pending as pen', 'status_labels.archived as arc', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                ->join('assets', 'assets.id', '=', 'inventory_results.asset_id')
                ->join('models', 'models.id', '=', 'assets.model_id')
                ->leftJoin('status_labels', 'status_labels.id', '=', 'inventory_results.status_id')
                ->where('inventory_results.inventory_id', $inventory->id);
            if ($inventory->object_type == 'App\Models\Company') {
                $inventory_result->union(
                    Contract::select('contracts.deleted_at', 'asset_id', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.name', 'assets.image', 'models.image as image_model', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                        ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                        ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                        ->join('models', 'models.id', '=', 'assets.model_id')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'contracts.object_id',
                            Department::select('departments.id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->join('companies', 'companies.id', '=', 'stores.company_id')
                                ->where('companies.id', '=', $inventory->object_id)
                        )
                        ->Where(function ($query) use ($search) {
                            if ($search) {
                                $query = self::search($query, $search);
                            }
                        })
                )
                    ->union(
                        Contract::select('contracts.deleted_at', 'asset_id', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.name', 'assets.image', 'models.image as image_model', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                            ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                            ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                            ->join('models', 'models.id', '=', 'assets.model_id')
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->whereIn(
                                'contracts.object_id',
                                Store::select('stores.id')
                                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                                    ->where('companies.id', '=', $inventory->object_id)
                            )
                            ->Where(function ($query) use ($search) {
                                if ($search) {
                                    $query = self::search($query, $search);
                                }
                            })

                    )
                    ->union(
                        Contract::select('contracts.deleted_at', 'asset_id', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.name', 'assets.image', 'models.image as image_model', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                            ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                            ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                            ->join('models', 'models.id', '=', 'assets.model_id')
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                            ->where('contracts.object_id', '=', $inventory->object_id)
                            ->Where(function ($query) use ($search) {
                                if ($search) {
                                    $query = self::search($query, $search);
                                }
                            })
                    );
            }
            if ($inventory->object_type == 'App\Models\Store') {
                $inventory_result->union(
                    Contract::select('contracts.deleted_at', 'asset_id', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.name', 'assets.image', 'models.image as image_model', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                        ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                        ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                        ->join('models', 'models.id', '=', 'assets.model_id')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'contracts.object_id',
                            Department::select('departments.id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->where('stores.id', '=', $inventory->object_id)
                        )
                        ->Where(function ($query) use ($search) {
                            if ($search) {
                                $query = self::search($query, $search);
                            }
                        })
                )
                    ->union(
                        Contract::select('contracts.deleted_at', 'asset_id', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.name', 'assets.image', 'models.image as image_model', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                            ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                            ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                            ->join('models', 'models.id', '=', 'assets.model_id')
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->where('contracts.object_id', '=', $inventory->object_id)
                            ->Where(function ($query) use ($search) {
                                if ($search) {
                                    $query = self::search($query, $search);
                                }
                            })

                    );
            }
            if ($inventory->object_type == 'App\Models\Department') {
                $inventory_result->union(
                    Contract::select('contracts.deleted_at', 'asset_id', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.name', 'assets.image', 'models.image as image_model', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                        ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                        ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                        ->join('models', 'models.id', '=', 'assets.model_id')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->where('contracts.object_id', '=', $inventory->object_id)
                        ->Where(function ($query) use ($search) {
                            if ($search) {
                                $query = self::search($query, $search);
                            }
                        })
                );
            }
            if ($inventory->object_type == 'App\Models\Contract') {
                $inventory_result->union(
                    Contract::select('contracts.deleted_at', 'asset_id', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.name', 'assets.image', 'models.image as image_model', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                        ->where('contracts.id', '=', $inventory->object_id)
                        ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                        ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                        ->join('models', 'models.id', '=', 'assets.model_id')
                        ->Where(function ($query) use ($search) {
                            if ($search) {
                                $query = self::search($query, $search);
                            }
                        })

                );
            }
            if ($inventory->object_type == 'App\Models\Location') {
                $inventory_result->union(
                    Contract::select('contracts.deleted_at', 'asset_id', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.name', 'assets.image', 'models.image as image_model', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                        ->where('contracts.location_id', '=', $inventory->object_id)
                        ->where('contracts.start_date', '<=', $inventory->inventory_date)
                        ->where('contracts.end_date', '>=', $inventory->inventory_date)
                        ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                        ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                        ->join('models', 'models.id', '=', 'assets.model_id')
                        ->Where(function ($query) use ($search) {
                            if ($search) {
                                $query = self::search($query, $search);
                            }
                        })

                );
            }

            if ($request->has('search')) {
                $inventory_result = $inventory_result->Where(function ($query) use ($search) {
                    $query = $query
                        ->Where('assets.name', 'LIKE', '%' . $search . '%')
                        ->orWhere('status_labels.name', 'LIKE', '%' . $search . '%')
                        ->orWhere('assets.asset_tag', 'LIKE', '%' . $search . '%')
                        ->orWhere('checked_time', 'LIKE', '%' . $search . '%')
                        ->orWhere(DB::raw('(CASE WHEN familiar = 1 THEN "Farmilar" ELSE "Unknown" END)'), 'LIKE', '%' . $search . '%');
                });
            }
            $result = DB::table(DB::raw("({$inventory_result->toSql()}) as sub"))
                ->mergeBindings($inventory_result->getQuery())
                ->groupBy('sub.asset_id')
                ->select(
                    'sub.id as id',
                    'sub.asset_id',
                    'sub.checked_time as checked_time',
                    'sub.name as name',
                    'sub.familiar as familiar',
                    'sub.image as image',
                    'sub.image_model as image_model',
                    'sub.status_id as status_id',
                    'sub.status_name as status_name',
                    'sub.status_dep as status_dep',
                    'sub.pen as status_pen',
                    'sub.arc as status_arc',
                    'sub.asset_tag as asset_tag',
                    'sub.assigned_to as assigned_to'
                );

            $order = $request->input('order') === 'asc' ? 'asc' : 'desc';
            $allowed_columns = [
                'deviece', 'asset_tag', 'checked', 'familiar', 'status_label'
            ];
            $sort = in_array($request->input('sort'), $allowed_columns) ? $request->input('sort') : 'created_at';
            switch ($sort) {

                case 'deviece':
                    $result = $result->orderBy('name', $order);
                    break;
                case 'asset_tag':
                    $result = $result->orderBy('asset_tag', $order);
                    break;
                case 'checked':
                    $result = $result->orderBy('checked_time', $order);
                    break;
                case 'familiar':
                    $result = $result->orderBy('familiar', $order);
                    break;
                case 'status_label':
                    $result = $result->orderBy('status_name', $order);
                    break;
            }
            $total = $result->get()->count();
            $offset = (($result) && (request('offset') > $total)) ? 0 : request('offset', 0);
            $limit = request('limit', 50);
            $result = $result->skip($offset)->take($limit)->get();
            return (new InventoryResultsTransformer)->transformInventoryresults($result, $request->input('inventory_id'), $total);
        } else {
            return (new DatatablesTransformer)->transformDatatables($array = array(), 0);
        }
    }
    /**
     * Display all assets attached to a component
     *
     * @param $query,$value
     * @return Contractselect
     */
    public function search($query, $value)
    {
        return $query
            ->orWhere('assets.name', 'LIKE', '%' . $value . '%')
            ->orWhere('assets.asset_tag', 'LIKE', '%' . $value . '%');
    }
    /**
     * Display all assets attached to a component
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $dt = new DateTime();
        $inventory_id = $request->inventory_id;
        $asset_id = $request->asset_id;
        $inventoryresultflag = InventoryResult::select('*')->where('inventory_id', $inventory_id)->where('asset_id', $asset_id)->first();
        if ($inventoryresultflag) {
            //update inventory_result
            $inventoryresult = InventoryResult::find($inventoryresultflag->id);
            $inventoryresult->checked_time = $dt->format('Y-m-d H:i:s');
            $inventoryresult->status_id = $request->status_id;
            $inventoryresult->user_id = Auth::id();
        } else {
            //create inventory_result
            $inventoryresult = new InventoryResult();
            $inventoryresult->inventory_id = $inventory_id;
            $inventoryresult->asset_id = $asset_id;
            $inventoryresult->familiar = $request->checked;
            $inventoryresult->status_id = $request->status_id;
            $inventoryresult->checked_time = $dt->format('Y-m-d H:i:s');
            $inventoryresult->user_id = Auth::id();
        }

        if ($inventoryresult->save()) {
            return response()->json(Helper::formatStandardApiResponse('success', $inventoryresult, trans('admin/suppliers/message.create.success')));
        }
        return response()->json(Helper::formatStandardApiResponse('error', null,  $inventoryresult->getErrors()));
    }

    /**
     * Display all assets attached to a component
     *
     * @param Request $request
     * @return Recongnized
     */
    public function checkasset(Request $request)
    {

        $device = Asset::find($request->asset_id)->first();
        $status_lable = Statuslabel::find($device->status_id)->first();
        $inventory = Inventory::find($request->inventory_id);
        if ($inventory) {
            if ($inventory->object_type == 'App\Models\Company') {

                $contract = Contract::select('contract_assets.*')
                    ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                    ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'contracts.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->join('companies', 'companies.id', '=', 'stores.company_id')
                            ->where('companies.id', '=', $inventory->object_id)
                    )
                    ->where('contract_assets.asset_id', '=', $request->asset_id)

                    ->union(
                        Contract::select('contract_assets.*')
                            ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                            ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->whereIn(
                                'contracts.object_id',
                                Store::select('stores.id')
                                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                                    ->where('companies.id', '=', $inventory->object_id)
                            )
                            ->where('contract_assets.asset_id', '=', $request->asset_id)

                    )
                    ->union(
                        Contract::select('contract_assets.*')
                            ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                            ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                            ->where('contracts.object_id', '=', $inventory->object_id)
                            ->where('contract_assets.asset_id', '=', $request->asset_id)
                    );
            }
            if ($inventory->object_type == 'App\Models\Store') {

                $contract = Contract::select('contract_assets.*')
                    ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                    ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'contracts.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->where('stores.id', '=', $inventory->object_id)
                    )
                    ->where('contract_assets.asset_id', '=', $request->asset_id)

                    ->union(
                        Contract::select('contract_assets.*')
                            ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                            ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->where('contracts.object_id', '=', $inventory->object_id)
                            ->where('contract_assets.asset_id', '=', $request->asset_id)

                    );
            }
            if ($inventory->object_type == 'App\Models\Department') {

                $contract = Contract::select('contract_assets.*')
                    ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                    ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->where('contracts.object_id', '=', $inventory->object_id)
                    ->where('contract_assets.asset_id', '=', $request->asset_id);
            }
            if ($inventory->object_type == 'App\Models\Contract') {

                $contract = Contract::select('contract_assets.*')
                    ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                    ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                    ->where('contracts.id', '=', $inventory->object_id)
                    ->where('contract_assets.asset_id', '=', $request->asset_id);
            }
            if ($inventory->object_type == 'App\Models\Location') {

                $contract = Contract::select('contract_assets.*')
                    ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                    ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                    ->where('contracts.location_id', '=', $inventory->object_id)
                    ->where('contracts.start_date', '<=', $inventory->inventory_date)
                    ->where('contracts.end_date', '>=', $inventory->inventory_date)
                    ->where('contract_assets.asset_id', '=', $request->asset_id);
            }
        } else {
            return (['Recongnized' => 0, 'status_id' => $status_lable->id, 'status_name' => $status_lable->name]);
        }


        if ($contract->get()->count() != 0) {
            return (['Recongnized' => 1, 'status_id' => $status_lable->id, 'status_name' => $status_lable->name]);
        } else {
            return (['Recongnized' => 0, 'status_id' => $status_lable->id, 'status_name' => $status_lable->name]);
        }
    }

    /**
     * Store scanned result in storage [Online Mode].
     *
     * @author [Thong.LT]
     * @since [v1.0]
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeByScan(Request $request)
    {
        // $this->authorize('update', InventoryResult::class);
        $date = new DateTime();
        $checkedTime = $request->checked_time;
        $inventoryId = $request->inventory_id;
        $asset = Asset::select(['assets.*'])
            ->where("assets.asset_tag", '=', $request->asset_tag)
            ->first();
        if ($asset) {
            $assetId = $asset->id;
            $request->asset_id = $asset->id;
        } else {
            return response()->json(Helper::formatStandardApiResponse('error', null, trans('admin/inventories/result.asset_not_found')));
        }

        $result = InventoryResult::select(['inventory_results.*'])
            ->where("inventory_results.asset_id", '=', $assetId)
            ->where("inventory_results.inventory_id", '=', $request->inventory_id)
            ->first();
        if ($result) {
            // Update inventory_result
            $inventoryresult = InventoryResult::findOrFail($request->id);
        } else {
            // Create inventory_result
            $inventoryresult = new InventoryResult();
            $inventoryresult->inventory_id = $inventoryId;
            $inventoryresult->asset_id = $assetId;
        }

        $checkRecongnized = $this->checkasset($request);

        $inventoryresult->checked_time = $checkedTime;
        $inventoryresult->status_id = $request->status_id;
        $inventoryresult->familiar = $checkRecongnized['Recongnized'];
        $inventoryresult->user_id = Auth::id();

        if ($inventoryresult->save()) {
            $inventoryresult->asset = $asset;
            if ($inventoryresult->status_id) {
                $status = StatusLabel::findOrFail($inventoryresult->status_id);
                $inventoryresult->status_name = $status->name;
            }
            return response()->json(Helper::formatStandardApiResponse('success', $inventoryresult, trans('admin/inventories/result.update.success')));
        }
        return response()->json(Helper::formatStandardApiResponse('error', null, $inventoryresult->getErrors()));
    }

    /**
     * Store scanned result in storage. [Offline Mode]
     *
     * @author [Thong.LT]
     * @since [v1.0]
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeByOfflineScan(Request $request)
    {
        // $this->authorize('update', InventoryResult::class);
        $res = ['rows' => array(), 'total' => 0];

        // Delete
        if ($request->has('deleted')) {
            foreach ($request->deleted as $delete) {
                $action['type'] = 'delete';
                $result = InventoryResult::select(['inventory_results.*'])
                    ->where("inventory_results.id", '=', $delete['id'])
                    ->first();
                if ($result) {
                    if ($result->delete()) {
                        $action['status'] = 'success';
                        $action['message'] = '';
                    } else {
                        $action['status'] = 'error';
                        $action['message'] = $result->getErrors();
                    }
                } else {
                    $action['status'] = 'error';
                    $action['message'] = trans('admin/inventories/result.asset_not_found');
                }
                $delete['action'] = $action;
                $res['rows'][] = $delete;
                $res['total'] += 1;
            }
        }

        // Update
        if ($request->has('stored')) {
            $tmp = $request->stored;
            foreach ($tmp as $key => $storedResult) {
                if ($storedResult['checked'] && $storedResult['checked']['datetime']) {
                    $action['type'] = '';
                    $date = new DateTime();
                    $checkedTime = $storedResult['checked']['datetime'];
                    $inventoryId = $request->inventory_id;
                    $asset = Asset::select(['assets.*'])
                        ->where("assets.asset_tag", '=', $storedResult['asset_tag'])
                        ->first();
                    if ($asset) {
                        $assetId = $asset->id;
                        $result = InventoryResult::select(['inventory_results.*'])
                            ->where("inventory_results.asset_id", '=', $assetId)
                            ->where("inventory_results.inventory_id", '=', $request->inventory_id)
                            ->first();
                        if ($result) {
                            // Update inventory_result
                            $action['type'] = 'update';
                            $inventoryresult = $result;
                        } else {
                            // Create inventory_result
                            $action['type'] = 'create';
                            $inventoryresult = new InventoryResult();
                            $inventoryresult->inventory_id = $inventoryId;
                            $inventoryresult->asset_id = $assetId;
                        }

                        $checkFamiliarRequest = new Request();
                        $checkFamiliarRequest->asset_id = $assetId;
                        $checkFamiliarRequest->inventory_id = $inventoryId;
                        $checkRecongnized = $this->checkasset($checkFamiliarRequest);

                        $inventoryresult->checked_time = $checkedTime;
                        $inventoryresult->status_id = $storedResult['status_label']['id'];
                        $inventoryresult->familiar = $checkRecongnized['Recongnized'];
                        $inventoryresult->user_id = Auth::id();

                        if ($inventoryresult->save()) {
                            $action['status'] = 'success';
                            $action['message'] = trans('admin/inventories/result.update.success');
                        } else {
                            $action['status'] = 'error';
                            $action['message'] = $inventoryresult->getErrors();
                        }
                    } else {
                        $action['status'] = 'error';
                        $action['message'] = trans('admin/inventories/result.asset_not_found');
                    }

                    $storedResult['action'] = $action;
                    $res['rows'][] = $storedResult;
                    $res['total'] += 1;
                }
            }
        }

        return response()->json(Helper::formatStandardApiResponse('success', $res, trans('admin/inventories/result.update.success')));
    }

    /**
     * Show results.
     *
     * @author [Thong.LT]
     * @param Request $request
     * @since [v1.0]
     * @return \Illuminate\Http\Response
     */
    public function showByScan(Request $request)
    {
        $this->authorize('view', InventoryResult::class);
        $inventory = Inventory::find($request->input('inventory_id'));
        $inventory_result = InventoryResult::Select('inventory_results.id', 'asset_id', 'checked_time', 'familiar', 'assets.name', 'assets.image', 'models.image as image_model', 'status_labels.id as status_id', 'status_labels.name as status_name', 'status_labels.deployable as status_dep', 'status_labels.pending as pen', 'status_labels.archived as arc', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
            ->join('assets', 'assets.id', '=', 'inventory_results.asset_id')
            ->join('models', 'models.id', '=', 'assets.model_id')
            ->leftjoin('status_labels', 'status_labels.id', '=', 'inventory_results.status_id')
            ->where('inventory_results.inventory_id', $inventory->id);
        if ($inventory->object_type == 'App\Models\Company') {
            $inventory_result->union(
                Contract::select('contracts.deleted_at', 'asset_id', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.name', 'assets.image', 'models.image as image_model', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                    ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                    ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                    ->join('models', 'models.id', '=', 'assets.model_id')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'contracts.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->join('companies', 'companies.id', '=', 'stores.company_id')
                            ->where('companies.id', '=', $inventory->object_id)
                    )
            )
                ->union(
                    Contract::select('contracts.deleted_at', 'asset_id', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.name', 'assets.image', 'models.image as image_model', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                        ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                        ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                        ->join('models', 'models.id', '=', 'assets.model_id')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                        ->whereIn(
                            'contracts.object_id',
                            Store::select('stores.id')
                                ->join('companies', 'companies.id', '=', 'stores.company_id')
                                ->where('companies.id', '=', $inventory->object_id)
                        )

                )
                ->union(
                    Contract::select('contracts.deleted_at', 'asset_id', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.name', 'assets.image', 'models.image as image_model', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                        ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                        ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                        ->join('models', 'models.id', '=', 'assets.model_id')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                        ->where('contracts.object_id', '=', $inventory->object_id)
                );
        }
        if ($inventory->object_type == 'App\Models\Store') {
            $inventory_result->union(
                Contract::select('contracts.deleted_at', 'asset_id', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.name', 'assets.image', 'models.image as image_model', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                    ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                    ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                    ->join('models', 'models.id', '=', 'assets.model_id')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'contracts.object_id',
                        Department::select('departments.id')
                            ->join('stores', 'stores.id', '=', 'departments.store_id')
                            ->where('stores.id', '=', $inventory->object_id)
                    )
            )
                ->union(
                    Contract::select('contracts.deleted_at', 'asset_id', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.name', 'assets.image', 'models.image as image_model', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                        ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                        ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                        ->join('models', 'models.id', '=', 'assets.model_id')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                        ->where('contracts.object_id', '=', $inventory->object_id)

                );
        }
        if ($inventory->object_type == 'App\Models\Department') {
            $inventory_result->union(
                Contract::select('contracts.deleted_at', 'asset_id', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.name', 'assets.image', 'models.image as image_model', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                    ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                    ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                    ->join('models', 'models.id', '=', 'assets.model_id')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->where('contracts.object_id', '=', $inventory->object_id)
            );
        }
        if ($inventory->object_type == 'App\Models\Contract') {
            $inventory_result->union(
                Contract::select('contracts.deleted_at', 'asset_id', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.name', 'assets.image', 'models.image as image_model', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'contracts.deleted_at', 'assets.asset_tag as asset_tag', 'assets.assigned_to as assigned_to')
                    ->join('contract_assets', 'contract_assets.contract_id', '=', 'contracts.id')
                    ->join('assets', 'assets.id', '=', 'contract_assets.asset_id')
                    ->join('models', 'models.id', '=', 'assets.model_id')
                    ->where('contracts.id', '=', $inventory->object_id)
            );
        }

        $result = DB::table(DB::raw("({$inventory_result->toSql()}) as sub"))
            ->mergeBindings($inventory_result->getQuery())
            ->groupBy('sub.asset_id')
            ->select(
                'sub.id as id',
                'sub.asset_id',
                'sub.checked_time as checked_time',
                'sub.name as name',
                'sub.familiar as familiar',
                'sub.image as image',
                'sub.image_model as image_model',
                'sub.status_id as status_id',
                'sub.status_name as status_name',
                'sub.status_dep as status_dep',
                'sub.pen as status_pen',
                'sub.arc as status_arc',
                'sub.asset_tag as asset_tag',
                'sub.assigned_to as assigned_to'
            )
            ->get();

        return (new InventoryResultsTransformer)->transformScanInventoryResults($result);
    }

    /**
     * Validates and deletes selected results.
     *
     * @author [Thong.LT]
     * @param Request $request
     * @since [v1.0]
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $this->authorize('delete', InventoryResult::class);
        $results = InventoryResult::findOrFail($request->id);
        $results->delete();

        return response()->json(Helper::formatStandardApiResponse('success', $results, trans('admin/inventories/result.delete.success')));
    }
}