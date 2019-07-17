<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Transformers\InventoryResultTransformer;
use App\Models\InventoryResult;
use App\Models\ContractAssets;
use App\Models\Asset;
use App\Helpers\Helper;
use DB;
use Auth;
use DateTime;
use App\Models\Statuslabel;

/**
     * Display a listing of the resource.
     *
     * @author [Dang.HT]
     * @since [v1.0]
     *
     */
class InventoryResultController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return List table inventory_result
     */
    public function index(Request $request)
    {
        $this->authorize('view', InventoryResult::class);

        $inventoryresult = DB::select('
        select   max(t2.inventory_id) as id,
        t2.asset_id,
        max(t2.checked_time) as checked_time ,
        max(t2.name) as name,
        max(t2.familiar) as familiar,
        max(t2.image) as image , 
        max(t2.image_model) as image_model,
        max(t2.status_id) as status_id,
        max(t2.status_name) as status_name,
        max(t2.status_dep) as status_dep,
        max(t2.pen) as status_pen,
        max(t2.arc) as status_arc,
        max(t2.asset_tag) as asset_tag,
        max(t2.assigned_to) as assigned_to
       from 
       (
       select inventory_results.inventory_id,asset_id,checked_time,familiar,assets.name,assets.image,models.image as image_model,status_labels.id as status_id,status_labels.name as status_name,status_labels.deployable as status_dep,status_labels.pending as pen,status_labels.archived as arc,assets.asset_tag as asset_tag,assets.assigned_to as assigned_to
       from inventory_results
       JOIN assets on assets.id = inventory_results.asset_id AND assets.deleted_at is null
       JOIN models ON models.id = assets.model_id AND models.deleted_at is null
       LEFT JOIN status_labels ON status_labels.id = inventory_results.status_id AND status_labels.deleted_at is null
       where inventory_id=? and inventory_results.deleted_at is null
       
       UNION
       
       select inventories.id,asset_id,null,null,assets.name,assets.image,models.image as image_model,null,null,null,null,null,assets.asset_tag as asset_tag,assets.assigned_to as assigned_to
       from inventories
       JOIN contracts ON inventories.contract_id = contracts.id  and contracts.deleted_at IS NULL
       JOIN contract_assets ON contracts.id = contract_assets.contract_id   and contract_assets.deleted_at IS NULL
       JOIN assets on assets.id = contract_assets.asset_id AND assets.deleted_at is null
       JOIN models ON models.id = assets.model_id AND models.deleted_at is null
       where inventories.id=? and inventories.deleted_at is null
       ) as t2
       group by t2.asset_id', [$request->input('inventory_id'),$request->input('inventory_id')]);
        return (new InventoryResultTransformer)->transformInventoryresults($inventoryresult, 0);
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
                $inventoryresult->user_id                   = Auth::id();
            
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
    public function checkasset(Request $request)
    {
  
        $device=Asset::find($request->asset_id)->first();
        $status_lable=Statuslabel::find($device->status_id)->first();
        
        $contract_asset=ContractAssets::select('contract_assets.*')
                        ->where('contract_id',$request->contract_id)
                        ->where('asset_id',$request->asset_id);

        if ($contract_asset->count() !=0) {
            return (['Recongnized' => 1,'status_id' => $status_lable->id,'status_name' => $status_lable->name]);
        } else {
            return (['Recongnized' => 0,'status_id' => $status_lable->id,'status_name' => $status_lable->name]);
        }
        
    }
}
