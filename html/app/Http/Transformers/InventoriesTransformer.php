<?php
namespace App\Http\Transformers;

use App\Models\Inventory;
use Illuminate\Database\Eloquent\Collection;
use Gate;
use App\Helpers\Helper;

class InventoriesTransformer
{
    public function transformInventories(Collection $inventories, $total)
    {
        $array = array();
        foreach ($inventories as $inventory) {
            $array[] = self::transformInventory($inventory);
        }
        return (new DatatablesTransformer)->transformDatatables($array, $total);
    }

    public function transformInventory(Inventory $inventory)
    {
        $array = [
            'id'       => (int) $inventory->id,
            'name'     => e($inventory->name),
            'date'     => Helper::getFormattedDateObject($inventory->inventory_date, 'date'),
            'notes'    => e($inventory->notes),
           
           
        ];
        switch($inventory->object_type)
        {
            case 'App\Models\Company';
            {
                $arraycompany['company']=[
                        'id'        => (int) $inventory->company->id,
                        'name'      => e($inventory->company->name)
                ];
                $arraystore['store']=null;
                $arraydepartment['department']=null;
                $arraycontract['contract']=null;
                $array +=$arraycompany+$arraystore+$arraydepartment+$arraycontract;
                break;
            }
            case 'App\Models\Store';
            {
                $arraycompany['company']=[
                    'id'        => (int) $inventory->store->company->id,
                    'name'      => e($inventory->store->company->name)
                ];
                $arraystore['store']=[
                    'id'        => (int) $inventory->store->id,
                    'name'      => e($inventory->store->name)
                ];
                $arraydepartment['department']=null;
                $arraycontract['contract']=null;
                $array +=$arraycompany+$arraystore+$arraydepartment+$arraycontract;
                break;
            }
            case 'App\Models\Department';
            {
                $arraycompany['company']=[
                    'id'        => (int) $inventory->department->store->company->id,
                    'name'      => e($inventory->department->store->company->name)
                ];
                $arraystore['store']=[
                    'id'        => (int) $inventory->department->store->id,
                    'name'      => e($inventory->department->store->name)
                ];
                $arraydepartment['department']=[
                    'id'        => (int) $inventory->department->id,
                    'name'      => e($inventory->department->name)
                ];
                $arraycontract['contract']=null;
                $array +=$arraycompany+$arraystore+$arraydepartment+$arraycontract;
                break;
            }
            case 'App\Models\Contract';
            {
                $arraycontract['contract']=[
                    'id'        => (int) $inventory->contract->id,
                    'name'      => e($inventory->contract->name)
                ];
                switch($inventory->contract->object_type)
                {
                    case 'App\Models\Company';
                    {
                        $arraycompany['company']=[
                            'id'        => (int) $inventory->contract->company->id,
                            'name'      => e($inventory->contract->company->name)
                        ];
                        $arraystore['store']=null;
                        $arraydepartment['department']=null;
                        break;
                    }
                    case 'App\Models\Store';
                    {
                        $arraycompany['company']=[
                            'id'        => (int) $inventory->contract->store->company->id,
                            'name'      => e($inventory->contract->store->company->name)
                        ];
                        $arraystore['store']=[
                            'id'        => (int) $inventory->contract->store->id,
                            'name'      => e($inventory->contract->store->name)
                        ];
                        $arraydepartment['department']=null;
                        break;
                    }
                    case 'App\Models\Department';
                    {
                        $arraycompany['company']=[
                            'id'        => (int) $inventory->contract->department->store->company->id,
                            'name'      => e($inventory->contract->department->store->company->name)
                        ];
                        $arraystore['store']=[
                            'id'        => (int) $inventory->contract->department->store->id,
                            'name'      => e($inventory->contract->department->store->name)
                        ];
                        $arraydepartment['department']=[
                            'id'        => (int) $inventory->contract->department->id,
                            'name'      => e($inventory->contract->department->name)
                        ];
                        break;
                    }
                }
               
                
                $array +=$arraycompany+$arraystore+$arraydepartment+$arraycontract;
                break;
            }

        }
        $permissions_array['available_actions'] = [
            'update' => (bool) Gate::allows('update', Inventory::class),
            'delete' => ((bool) Gate::allows('delete', Inventory::class) && ($inventory->inventoryresult ? false : true)  && ($inventory->deleted_at=='')) ? true : false,
            'result' => (bool) Gate::allows('result', Inventory::class),
        ];
        $array += $permissions_array;

        return $array;
    }

}
