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
        if($request->input('inventory_id')) {
            $inventory=Inventory::find($request->input('inventory_id'));
            $inventory_result=InventoryResult::Select('inventory_results.id','asset_id','checked_time','familiar','assets.name','assets.image','models.image as image_model','status_labels.id as status_id','status_labels.name as status_name','status_labels.deployable as status_dep','status_labels.pending as pen','status_labels.archived as arc','assets.asset_tag as asset_tag','assets.assigned_to as assigned_to')
                            ->join('assets', 'assets.id', '=', 'inventory_results.asset_id')
                            ->join('models', 'models.id', '=', 'assets.model_id')
                            ->join('status_labels', 'status_labels.id', '=', 'inventory_results.status_id')
                            ->where('inventory_results.inventory_id',$inventory->id);
                            if($inventory->object_type == 'App\Models\Company')
                            {
                                $inventory_result ->union(
                                    Contract::select('contracts.deleted_at','asset_id','contracts.deleted_at','contracts.deleted_at','assets.name','assets.image','models.image as image_model','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','assets.asset_tag as asset_tag','assets.assigned_to as assigned_to')
                                    ->join('contract_assets','contract_assets.contract_id','=','contracts.id')
                                    ->join('assets','assets.id','=','contract_assets.asset_id')
                                    ->join('models','models.id','=','assets.model_id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"') )
                                    ->whereIn('contracts.object_id', 
                                        Department::select('departments.id')
                                        ->join('stores','stores.id', '=', 'departments.store_id')
                                        ->join('companies','companies.id', '=', 'stores.company_id')
                                        ->where('companies.id','=',$inventory->object_id)
                                    )
                                )
                                ->union(
                                    Contract::select('contracts.deleted_at','asset_id','contracts.deleted_at','contracts.deleted_at','assets.name','assets.image','models.image as image_model','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','assets.asset_tag as asset_tag','assets.assigned_to as assigned_to')
                                    ->join('contract_assets','contract_assets.contract_id','=','contracts.id')
                                    ->join('assets','assets.id','=','contract_assets.asset_id')
                                    ->join('models','models.id','=','assets.model_id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                    ->whereIn('contracts.object_id', 
                                        Store::select('stores.id')
                                        ->join('companies','companies.id', '=', 'stores.company_id')
                                        ->where('companies.id','=',$inventory->object_id)
                                    )
                                    
                                )
                                ->union(
                                    Contract::select('contracts.deleted_at','asset_id','contracts.deleted_at','contracts.deleted_at','assets.name','assets.image','models.image as image_model','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','assets.asset_tag as asset_tag','assets.assigned_to as assigned_to')
                                    ->join('contract_assets','contract_assets.contract_id','=','contracts.id')
                                    ->join('assets','assets.id','=','contract_assets.asset_id')
                                    ->join('models','models.id','=','assets.model_id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                    ->where('contracts.object_id', '=', $inventory->object_id)
                                );
                            }
                            if($inventory->object_type == 'App\Models\Store'){
                                $inventory_result ->union(
                                    Contract::select('contracts.deleted_at','asset_id','contracts.deleted_at','contracts.deleted_at','assets.name','assets.image','models.image as image_model','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','assets.asset_tag as asset_tag','assets.assigned_to as assigned_to')
                                    ->join('contract_assets','contract_assets.contract_id','=','contracts.id')
                                    ->join('assets','assets.id','=','contract_assets.asset_id')
                                    ->join('models','models.id','=','assets.model_id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"') )
                                    ->whereIn('contracts.object_id', 
                                        Department::select('departments.id')
                                        ->join('stores','stores.id', '=', 'departments.store_id')
                                        ->where('stores.id','=',$inventory->object_id)
                                    )
                                )
                                ->union(
                                    Contract::select('contracts.deleted_at','asset_id','contracts.deleted_at','contracts.deleted_at','assets.name','assets.image','models.image as image_model','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','assets.asset_tag as asset_tag','assets.assigned_to as assigned_to')
                                    ->join('contract_assets','contract_assets.contract_id','=','contracts.id')
                                    ->join('assets','assets.id','=','contract_assets.asset_id')
                                    ->join('models','models.id','=','assets.model_id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                    ->where('contracts.object_id', '=', $inventory->object_id)
                                    
                                );
                            }
                            if($inventory->object_type == 'App\Models\Department'){
                                $inventory_result ->union(
                                    Contract::select('contracts.deleted_at','asset_id','contracts.deleted_at','contracts.deleted_at','assets.name','assets.image','models.image as image_model','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','assets.asset_tag as asset_tag','assets.assigned_to as assigned_to')
                                    ->join('contract_assets','contract_assets.contract_id','=','contracts.id')
                                    ->join('assets','assets.id','=','contract_assets.asset_id')
                                    ->join('models','models.id','=','assets.model_id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"') )
                                    ->where('contracts.object_id', '=', $inventory->object_id)
                                );
                            }
                            if($inventory->object_type == 'App\Models\Contract'){
                                $inventory_result ->union(
                                    Contract::select('contracts.deleted_at','asset_id','contracts.deleted_at','contracts.deleted_at','assets.name','assets.image','models.image as image_model','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','contracts.deleted_at','assets.asset_tag as asset_tag','assets.assigned_to as assigned_to')
                                    ->join('contract_assets','contract_assets.contract_id','=','contracts.id')
                                    ->join('assets','assets.id','=','contract_assets.asset_id')
                                    ->join('models','models.id','=','assets.model_id')
                                    ->where('contracts.id', '=', $inventory->object_id)
                                );
                            }
                           
            $result = DB::table( DB::raw("({$inventory_result->toSql()}) as sub") )
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
                'sub.assigned_to as assigned_to')
            ;
            $total=$result->get()->count();
            $offset = (($result) && (request('offset') > $total)) ? 0 : request('offset', 0);
            $limit = request('limit', 50);
            $result = $result->skip($offset)->take($limit)->get();
            return (new InventoryResultsTransformer)->transformInventoryresults($result, $request->input('inventory_id'),$total);
        } else {
            return (new DatatablesTransformer)->transformDatatables($array= array(),0);
        }
        

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
        $inventory_id=$request->inventory_id;
        $asset_id=$request->asset_id;
        $inventoryresultflag=InventoryResult::select('*')->where('inventory_id',$inventory_id)->where('asset_id',$asset_id)->first();
        if($inventoryresultflag) {
            //update inventory_result
                $inventoryresult=InventoryResult::find($inventoryresultflag->id);
                $inventoryresult->checked_time=$dt->format('Y-m-d H:i:s');
                $inventoryresult->status_id=$request->status_id;
                $inventoryresult->user_id = Auth::id();

        } else {
            //create inventory_result
            $inventoryresult=new InventoryResult();
            $inventoryresult->inventory_id=$inventory_id;
            $inventoryresult->asset_id=$asset_id;
            $inventoryresult->familiar=$request->checked;
            $inventoryresult->status_id=$request->status_id;
            $inventoryresult->checked_time=$dt->format('Y-m-d H:i:s');
            $inventoryresult->user_id=Auth::id();
        }

        if($inventoryresult->save()) {
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
    public function checkasset(InventoryResultRequest $request)
    {

        $device=Asset::find($request->asset_id)->first();
        $status_lable=Statuslabel::find($device->status_id)->first();
        $inventory=Inventory::find($request->inventory_id); 
        if($inventory->object_type == 'App\Models\Company')
        {
            
            $contract=Contract::select('contract_assets.*')
                ->join('contract_assets','contract_assets.contract_id','=','contracts.id')
                ->join('assets','assets.id','=','contract_assets.asset_id')
                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"') )
                ->whereIn('contracts.object_id', 
                    Department::select('departments.id')
                    ->join('stores','stores.id', '=', 'departments.store_id')
                    ->join('companies','companies.id', '=', 'stores.company_id')
                    ->where('companies.id','=',$inventory->object_id)
                )
                ->where('contract_assets.asset_id', '=', $request->asset_id)
            
            ->union(
                Contract::select('contract_assets.*')
                ->join('contract_assets','contract_assets.contract_id','=','contracts.id')
                ->join('assets','assets.id','=','contract_assets.asset_id')
                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                ->whereIn('contracts.object_id', 
                    Store::select('stores.id')
                    ->join('companies','companies.id', '=', 'stores.company_id')
                    ->where('companies.id','=',$inventory->object_id)
                )
                ->where('contract_assets.asset_id', '=', $request->asset_id)
                
            )
            ->union(
                Contract::select('contract_assets.*')
                ->join('contract_assets','contract_assets.contract_id','=','contracts.id')
                ->join('assets','assets.id','=','contract_assets.asset_id')
                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                ->where('contracts.object_id', '=', $inventory->object_id)
                ->where('contract_assets.asset_id', '=', $request->asset_id)
            );
        }
        if($inventory->object_type == 'App\Models\Store'){

            $contract=Contract::select('contract_assets.*')
                ->join('contract_assets','contract_assets.contract_id','=','contracts.id')
                ->join('assets','assets.id','=','contract_assets.asset_id')
                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"') )
                ->whereIn('contracts.object_id', 
                    Department::select('departments.id')
                    ->join('stores','stores.id', '=', 'departments.store_id')
                    ->where('stores.id','=',$inventory->object_id)
                )
                ->where('contract_assets.asset_id', '=', $request->asset_id)
    
            ->union(
                Contract::select('contract_assets.*')
                ->join('contract_assets','contract_assets.contract_id','=','contracts.id')
                ->join('assets','assets.id','=','contract_assets.asset_id')
                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                ->where('contracts.object_id', '=', $inventory->object_id)
                ->where('contract_assets.asset_id', '=', $request->asset_id)
                
            );
        }
        if($inventory->object_type == 'App\Models\Department'){
            
            $contract=Contract::select('contract_assets.*')
                ->join('contract_assets','contract_assets.contract_id','=','contracts.id')
                ->join('assets','assets.id','=','contract_assets.asset_id')
                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"') )
                ->where('contracts.object_id', '=', $inventory->object_id)
                ->where('contract_assets.asset_id', '=', $request->asset_id);
            
        }
        if($inventory->object_type == 'App\Models\Contract'){
            
            $contract=Contract::select('contract_assets.*')
                ->join('contract_assets','contract_assets.contract_id','=','contracts.id')
                ->join('assets','assets.id','=','contract_assets.asset_id')
                ->where('contracts.id', '=', $inventory->object_id)
                ->where('contract_assets.asset_id', '=', $request->asset_id);
        
        }

        if ($contract->get()->count() !=0) {
            return (['Recongnized' => 1,'status_id' => $status_lable->id,'status_name' => $status_lable->name]);
        } else {
            return (['Recongnized' => 0,'status_id' => $status_lable->id,'status_name' => $status_lable->name]);
        }

    }

    /**
     * Insert or Update Inventory Results
     *
     * @param Request $request
     * @return JSON
    */
    public function scan(Request $request)
    {
        // Remove Prefix
        $setting = Setting::first();
        $assetTag = str_replace($setting->auto_increment_prefix, '', $request->asset_tag);

        // Get Asset ID
        $asset =Asset::select(['id'])
                    ->where('asset_tag', '=', $assetTag)->first();
        $assetId = 0;

        if (empty($asset)) {
            return response()->json(Helper::formatStandardApiResponse('error', null, "Asset not found!"));
        } else {
            $assetId = $asset->id;
        }

        //Get Contract Asset
        $contractAsset = ContractAsset::select(['contract_assets.id'])
                            ->join('assets', 'assets.id','=', 'contract_assets.asset_id')
                            ->where("contract_assets.asset_id", '=', $assetId)
                            ->where("contract_assets.contract_id", '=', $request->contract_id)
                            ->first();
        $familiar = (empty($contractAsset)) ? 0 : 1;

        // Get Inventory Result
        $inventoryResult = InventoryResult::select(['inventory_results.*'])
                                ->where("inventory_results.asset_id", '=', $assetId)
                                ->where("inventory_results.inventory_id", '=', $request->inventory_id)
                                ->first();

        if (empty($inventoryResult)) {
            // Insert new Inventory Result
            $data = new InventoryResult();
            $data->inventory_id = $request->inventory_id;
            $data->asset_id = $assetId;
        } else {
            // Update existing
            $data = $inventoryResult;
        }

        $data->status_id = $request->status_id;
        $data->checked_time = Carbon::now()->toDateTimeString();
        $data->user_id = Auth::id();
        $data->familiar= $familiar;

        if($data->save()) {
            if ($familiar) {
                return response()->json(Helper::formatStandardApiResponse('success', ['familiar' => $familiar, 'message' => trans('admin/inventories/api.device') . ' ' . $assetTag . ' ' . trans('admin/inventories/api.success_scan')], null));
            } else {
                return response()->json(Helper::formatStandardApiResponse('success', ['familiar' => $familiar, 'message' => trans('admin/inventories/api.unrecognized_scan')], null));
            }
        }

        return response()->json(Helper::formatStandardApiResponse('error', null,  $data->getErrors()));
    }
}
