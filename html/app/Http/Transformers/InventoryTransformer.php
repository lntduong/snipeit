<?php
namespace App\Http\Transformers;

use App\Models\Inventories;
use Illuminate\Database\Eloquent\Collection;
use Gate;
use App\Helpers\Helper;

class InventoryTransformer
{
    public function transformInventories(Collection $inventories, $total)
    {
        $array = array();
        foreach ($inventories as $inventory) {
            $array[] = self::transformInventory($inventory);
        }
        return (new DatatablesTransformer)->transformDatatables($array, $total);
    }

    public function transformInventory(Inventories $inventory)
    {
        $array = [
            'id' => (int) $inventory->id,
            'name' => e($inventory->name),
            'date' => Helper::getFormattedDateObject($inventory->inventory_date, 'datetime'),
            'notes' => e($inventory->notes),
            'contract' => ($inventory->contract) ? e($inventory->contract->name) : null,
            'store'   => ($inventory->contract->store) ? [
                'id' => (int) $inventory->contract->store->id,
                'name' => e($inventory->contract->store->name)
            ] : null,
            'company'   => ($inventory->contract->store->company) ? [
                'id' => (int) $inventory->contract->store->company->id,
                'name' => e($inventory->contract->store->company->name)
            ] : null,
           
        ];

        $permissions_array['available_actions'] = [
            'update' => (bool) Gate::allows('update', Inventories::class),
            'delete' => (bool) Gate::allows('delete', Inventories::class),
            'result' => (bool) Gate::allows('result', Inventories::class),
        ];
        $array += $permissions_array;

        return $array;
    }

}
