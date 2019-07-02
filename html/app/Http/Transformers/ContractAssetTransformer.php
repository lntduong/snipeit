<?php
namespace App\Http\Transformers;

use Gate;
use App\Models\ContractAssets;
use Illuminate\Support\Collection;

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

    public function transformContract (ContractAssets $contract)
    {
        $array = [
            'id' => (Int) $contract->id,
           
            'asset_id' => $contract->asset_id,

            // 'asset' => ($contract->asset) ? [
            //     'id' => (int) $contract->asset->id,
            //     'name'=> ($contract->asset->name) ? e($contract->asset->name) : null,
            //     'image'=> e($contract->asset->image)

            // ]  : null,
           
        ];
        $permissions_array['available_actions'] = [
            'update' => (bool) Gate::allows('update', Contract::class),
        ];
        $array += $permissions_array;
        return $array;
    }
}