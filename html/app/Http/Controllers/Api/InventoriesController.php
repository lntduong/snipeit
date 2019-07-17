<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\Store;
use App\Models\Contract;
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

/**
 * @version    v1.0
 * @author [Thinh.NP] 
 */
class InventoriesController extends Controller
{
    public function offlineDataSync()
    {
        $listAllCompany = Company::select('id','name')->orderBy('name', 'ASC')->paginate();
        $listAllStore = Store::select('id','name','company_id')->orderBy('name', 'ASC')->paginate();
        $listAllContract = Contract::select('id','name','store_id')->orderBy('name', 'ASC')->paginate();
        $listAllInventory = Inventory::select('id','name','contract_id', 'inventory_date')->orderBy('name', 'ASC')->paginate();

        return response()->json([
                                'listCompany'  => $listAllCompany,
                                'listStore'    => $listAllStore, 
                                'listContract' => $listAllContract,
                                'listInventory' => $listAllInventory
        ]);
    }

    public function create(Request $request)
    {
        $asset_Id =Asset::select(['id'])
        ->where('asset_tag', '=' ,substr($request->asset_tag,4 ))->get();
        $arrayAssets = ContractAsset::select([
            'assets.asset_tag',
            'assets.id'
        ])->join('assets','assets.id','=','contract_assets.asset_id')
        ->where("assets.asset_tag", '=' , substr($request->asset_tag,4 ))
        ->get();

        $inventory = new InventoryResult();
        $inventory->inventory_id = $request->inventory_id ;
        $inventory->checked_time = Carbon::now()->toDateTimeString();
        $inventory->user_id = Auth::id();

        if($arrayAssets->count() <= 0){
            $inventory->asset_id = $asset_Id !=null ? $asset_Id[0]->id : '' ;
            $inventory->unrecognized= 1;
            $inventory->save();

            return response()->json(['unrecognized_scan'=> trans('admin/inventory/api.unrecognized_scan') ], 200);
        }
        else{
            $inventory->asset_id = $arrayAssets[0]->id ;
            $inventory->unrecognized = 0;
            $inventory->save();

            return response()->json(['success_scan'=> trans('admin/inventory/api.success_scan') ], 200);
        }
        
    }

    public function selectlist(Request $request)
    {
   
      $listInventory = Inventory::where('inventories.contract_id', '=', $request->contract_id);
      $listInventory = $listInventory->orderBy('name', 'ASC')->paginate();
      return (new SelectlistInventoryTransformer)->transformSelectlist($listInventory);
    }  

    public function savelist(Request $request)
    {
        $msg ="" ;
        $arrayAssetOff = json_decode($request->item, true);
        for($i = 0 ; $i < count($arrayAssetOff); $i++){
            $asset_Id =Asset::select(['id'])->where('asset_tag', '=' ,substr($arrayAssetOff[$i]['asset_number'],4) )->get();
            $arrayAssets = ContractAsset::select([
                'assets.asset_tag',
                'assets.id'
            ])->join('assets','assets.id','=','contract_assets.asset_id')
            ->where("assets.asset_tag" , '=', substr($arrayAssetOff[$i]['asset_number'],4))->get();

            $inventory = new InventoryResult();
            $inventory->inventory_id = $request->inventory_id ;
            $inventory->checked_time = Carbon::parse($arrayAssetOff[$i]['date_scan'])->format('Y-m-d h:i:s');
            $inventory->user_id = Auth::id();

            if($arrayAssets->count() <= 0){
                $inventory->asset_id = $asset_Id !=null ? $asset_Id[0]->id : '' ;
                $inventory->unrecognized= 1;
                $inventory->save(); 
                $msg .= trans('admin/inventory/api.device'). $arrayAssetOff[$i]['asset_number'] . trans('admin/inventory/api.unrecognized_scan') . "**";
            }else {
                $inventory->asset_id = $arrayAssets[0]->id ;
                $inventory->unrecognized = 0;
                $inventory->save();
                $msg .= trans('admin/inventory/api.device'). $arrayAssetOff[$i]['asset_number'] . trans('admin/inventory/api.success_scan') . "**";
            }
        }
        return response()->json(['success_scan'=> $msg ], 200);
        
    }  

}


