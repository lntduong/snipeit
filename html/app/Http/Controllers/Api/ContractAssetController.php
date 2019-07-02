<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Http\Transformers\ContractAssetTransformer;
use App\Http\Transformers\SelectlistTransformer;
use Illuminate\Http\Request;
use App\Models\ContractAssets;
use App\Models\Contract;
use App\Models\Asset;
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

}


