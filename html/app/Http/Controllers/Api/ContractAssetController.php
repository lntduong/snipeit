<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Http\Transformers\ContractAssetTransformer;
use App\Http\Transformers\SelectlistTransformer;
use Illuminate\Http\Request;
use App\Models\ContractAssets;
use App\Models\Contract;
use App\Models\Asset;
use Illuminate\Support\Facades\Auth;
use DB;
/**
 * @version    v1.0
 * @author [Thinh.NP] 
 */
class ContractAssetController extends Controller
{
    public function index(Request $request)
    {
          $contract = ContractAssets::select([
                'contract_id',
                'asset_id',
          ]);

        if($request->input('asset_id')){
            $asset = Asset::find($request->input('asset_id'));
            $contract->where('asset_id','=',$asset->asset_id);
        }
        
        if ($request->has('search')) {
            $contract = $contract->TextSearch(e($request->input('search')));
        }
        $total = $contract->count();
        $contract = $contract->get();

        return response()->json((new ContractAssetTransformer)->transformContractList($contract, $total), 200, ['Content-Type' => 'application/json;charset=utf8'], JSON_UNESCAPED_UNICODE);

    }

    public function storeAsset(Request $request) 
    {
        $check= ContractAssets::where('contract_assets.contract_id' , '=' ,$request->contract_id)
                                ->where('contract_assets.asset_id', '=' , $request->asset_id)->count();
            if($check <= 0) {
                $contract = new ContractAssets([
                    'contract_id' => $request->contract_id,
                    'asset_id' => $request->asset_id,
                    'user_id' => Auth::id(),
                ]);

                $contract->save();
            }
                $listAssets = ContractAssets::select([
                    'assets.id',
                    'assets.image',
                    'models.name',
                    'assets.asset_tag'
                    ])->join('assets','assets.id','=','contract_assets.asset_id')
                    ->join('models','models.id' , '=' , 'assets.model_id')
                    ->where("contract_assets.contract_id" , '=', $request->contract_id)->get();
                    return response()->json($listAssets);
    }

    
    public function deleteAssetContracts(Request $request) 
    {

            DB::table('contract_assets')
                ->where('contract_id', '=' , $request->contract_id)
                ->where('asset_id','=' , $request->asset_id)->delete();

                $listAssets = ContractAssets::select([
                    'assets.id',
                    'assets.image',
                    'models.name' ,
                    'assets.asset_tag'
                    ])->join('assets','assets.id','=','contract_assets.asset_id')
                    ->join('models','models.id' , '=' , 'assets.model_id')
                    ->where("contract_assets.contract_id" , '=', $request->contract_id)->get();
                    return response()->json($listAssets);
        
    }


    public function getAssetContractByIdContract(Request $request) 
    {

    

                $listAssets = ContractAssets::select([
                    'assets.id',
                    'assets.image',
                    'models.name' ,
                    'assets.asset_tag'
                    ])->join('assets','assets.id','=','contract_assets.asset_id')
                    ->join('models','models.id' , '=' , 'assets.model_id')
                    ->where("contract_assets.contract_id" , '=', $request->contract_id)->get();
                    return response()->json($listAssets);
        
    }

}


