<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Transformers\InventoryResultTransformer;
use App\Models\InventoryResult;
use App\Models\ContractAssets;
use App\Helpers\Helper;
use DB;
use Auth;
use DateTime;
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
        select max(t2.id) as id,t2.asset_id, max(t2.checked_time) as checked_time ,max(t2.name) as name,max(t2.unrecognized) as unrecognized,max(t2.image) as image , max(t2.image_model) as image_model
        from 
        (
        select inventory_results.id,asset_id,checked_time,unrecognized,assets.name,assets.image,models.image as image_model
        from inventory_results
        JOIN assets on assets.id = inventory_results.asset_id AND assets.deleted_at is null
        JOIN models ON models.id = assets.model_id AND models.deleted_at is null
        where inventory_id=? and inventory_results.deleted_at is null
        
        UNION
        
        select inventories.id,asset_id,null,null,assets.name,assets.image,models.image as image_model
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
        $checked=$request->checked;  
        if ($checked == '0') {
            $inventoryresult=new InventoryResult;
            $inventoryresult->inventory_id=$inventory_id;
            $inventoryresult->asset_id=$asset_id;
            $inventoryresult->unrecognized=$checked;
            $inventoryresult->checked_time=$dt->format('Y-m-d H:i:s');
            $inventoryresult->user_id=Auth::id();
        } else {
            $inventoryresultflag=InventoryResult::select('*')->where('inventory_id',$inventory_id)->where('asset_id',$asset_id)->first();
            if($inventoryresultflag)// nam trong inventory result roi
            {
                $inventoryresult=InventoryResult::find($inventoryresultflag->id);
                $inventoryresult->checked_time=$dt->format('Y-m-d H:i:s');
                $inventoryresult->user_id                   = Auth::id();
            }
            else {
                $inventoryresult=new InventoryResult();
                $inventoryresult->inventory_id=$inventory_id;
                $inventoryresult->asset_id=$asset_id;
                $inventoryresult->unrecognized=$checked;
                $inventoryresult->checked_time=$dt->format('Y-m-d H:i:s');
                $inventoryresult->user_id=Auth::id();
            }
        }
        if($inventoryresult->save())
        {
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
        $asset_id=$request->asset_id;
        $contract_id=$request->contract_id;
        $contract_asset=ContractAssets::select('contract_assets.*')
                        ->where('contract_id',$contract_id)
                        ->where('asset_id',$asset_id);
        if ($contract_asset->count() !=0) {
            return (['Recongnized' => 1]);
        }
        else {
            return (['Recongnized' => 0]);
        }
        
    }
}
