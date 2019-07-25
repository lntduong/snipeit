<?php
namespace App\Http\Transformers;

use Gate;
use App\Models\Contract;
use Illuminate\Support\Collection;

class ContractsTransformer
{
    public function transformContractList(Collection $contractList,$total)
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

            'company' => (($contract->object_type == 'App\Models\Department') ? [
                'id' => (int) $contract->department->company_id,
                'name'=> e($contract->department->company_name)
            ] : (($contract->object_type == 'App\Models\Store') ?[
                'id' => (int) $contract->store->company_id,
                'name'=> e($contract->store->company_name),
            ] : (($contract->object_type == 'App\Models\Company') ? [
                'id' => (int) $contract->company->id,
                'name'=> e($contract->company->name)
            ]  : null))),

            'store' => ($contract->object_type == 'App\Models\Department') ? [
                'id' => (int) $contract->department->store_id,
                'name'=> e($contract->department->store_name)
            ] : (($contract->object_type == 'App\Models\Store') ? [
                'id' => (int) $contract->store->id,
                'name'=> e($contract->store->name),
            ]  : null),
            'department' => ($contract->object_type == 'App\Models\Department') ? [
                'id' => (int) $contract->department->id,
                'name'=> e($contract->department->name)
            ]  : null,
            'object_id' => $contract->object_id,
            'location_id' => ($contract->location_id) ? [
                'id' => (int) $contract->location->id,
                'name'=> e($contract->location->name)
            ]  : null,
            'contact_id_1' => ($contract->contact_id_1) ? [
                'id' => (int) $contract->user->id,
                'name'=> e($contract->user->last_name)
            ]  : null,
            'contact_id_2' =>  ($contract->contact_id_2) ? [
                'id' => (int) $contract->user2->id,
                'name'=> e($contract->user2->last_name)
            ]  : null,
            'start_date' => $contract->start_date,
            'end_date' =>  $contract->end_date,
            'billing_date' =>  $contract->billing_date,
            'payment_date' =>  $contract->payment_date, 'date',
           
        ];
        $permissions_array['available_actions'] = [
            'update' => (bool) Gate::allows('update', Contract::class),
            'delete' => ((bool) Gate::allows('delete', Contract::class)
            && ($contract->contract_assets ? false : true) && ($contract->deleted_at=='')) ? true : false,
        ];
        $array += $permissions_array;
        return $array;
    }
}