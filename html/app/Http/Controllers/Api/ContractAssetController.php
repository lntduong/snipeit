<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ContractAsset;
use App\Models\Contract;
use App\Models\Asset;
use Illuminate\Support\Facades\Auth;
use DB;
/**
 * @author [Duong.LNT]
 */
class ContractAssetController extends Controller
{
    public function storeAsset(Request $request) 
    {
        $check = ContractAsset::where('contract_assets.contract_id' , '=' ,$request->contract_id)
                ->where('contract_assets.asset_id', '=' , $request->asset_id)
                ->count();
        if($check <= 0) {
            $contract = new ContractAsset([
                'contract_id' => $request->contract_id,
                'asset_id' => $request->asset_id,
                'user_id' => Auth::id(),
            ]);
            $contract->save();
        }
        $listAssets = ContractAsset::select([
            'assets.id',
            'assets.image',
            'models.name',
            'assets.asset_tag'
            ])
            ->join('assets','assets.id','=','contract_assets.asset_id')
            ->join('models','models.id' , '=' , 'assets.model_id')
            ->where("contract_assets.contract_id" , '=', $request->contract_id)->get();
        return response()->json($listAssets);
    }

    public function deleteAssetContracts(Request $request) 
    {
        DB::table('contract_assets')
            ->where('contract_id', '=' , $request->contract_id)
            ->where('asset_id','=' , $request->asset_id)
            ->delete();

        $listAssets = ContractAsset::select([
            'assets.id',
            'assets.image',
            'models.name',
            'assets.asset_tag'
            ])
            ->join('assets','assets.id','=','contract_assets.asset_id')
            ->join('models','models.id' , '=' , 'assets.model_id')
            ->where("contract_assets.contract_id" , '=', $request->contract_id)
            ->get();
        return response()->json($listAssets); 
    }

    public function getAssetContractByIdContract(Request $request) 
    {
        $listAssets = ContractAsset::select([
            'assets.id',
            'assets.image',
            'models.name',
            'assets.asset_tag'
            ])
            ->join('assets','assets.id','=','contract_assets.asset_id')
            ->join('models','models.id' , '=' , 'assets.model_id')
            ->where("contract_assets.contract_id" , '=', $request->contract_id)
            ->get();
        return response()->json($listAssets);     
    }
}


