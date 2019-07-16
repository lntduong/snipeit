<?php
namespace App\Http\Transformers;

use Gate;
use App\Models\ContractAsset;
use Illuminate\Support\Collection;
/**
 * @author [Duong.LNT]
 */
class ContractAssetTransformer
{
    public function transformContractList(Collection $contractList, $total)
    {
        $array = array();
      
        foreach ($contractList as $contract) {
            $array[] = self::transformContract($contract);
        }
        return (new DatatablesTransformer)->transformDatatables($array, $total);
    }

    public function transformContract (ContractAsset $contract)
    {
        $array = [
            'id' => (Int) $contract->id,      
            'asset_id' => $contract->asset_id,
           
        ];
        $permissions_array['available_actions'] = [
            'update' => (bool) Gate::allows('update', Contract::class),
        ];
        $array += $permissions_array;
        return $array;
    }
}