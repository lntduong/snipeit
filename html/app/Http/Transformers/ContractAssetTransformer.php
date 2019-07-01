<?php
namespace App\Http\Transformers;

use Gate;
use App\Models\Contract;
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

    public function transformContract (Contract $contract)
    {
        $array = [
            'id' => (Int) $contract->id,
            'name' => $contract->name,
           
            'asset_id' => ($contract->asset_id) ? [
                'id' => (int) $contract->asset->id,
                'name'=> e($contract->asset->name)
            ]  : null,

            'contract_id' => ($contract->contract_id) ? [
                'id' => (int) $contract->contract->id,
                'name'=> e($contract->contract->name)
            ]  : null,
           
        ];
        $permissions_array['available_actions'] = [
            'update' => (bool) Gate::allows('update', Contract::class),
        ];
        $array += $permissions_array;
        return $array;
    }
}