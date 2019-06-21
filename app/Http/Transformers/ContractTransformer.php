<?php
namespace App\Http\Transformers;

use App\Models\Contract;
use App\Models\User;
use App\Models\Setting;
use Gate;
use Illuminate\Database\Eloquent\Collection;
use App\Helpers\Helper;

class ContractTransformer
{

    public function transformContracts (Collection $contracts, $total)
    {
        $array = array();
        foreach ($contracts as $contract) {
            $array[] = self::transformContract($contract);
        }
        return (new DatatablesTransformer)->transformDatatables($array, $total);
    }

    public function transformContract (Contract $contract)
    {

        $array = [
            'id'          => (int) $contract->id,
            'created_at'    => Helper::getFormattedDateObject($contract->created_at, 'datetime'),
            'updated_at'    => Helper::getFormattedDateObject($contract->updated_at, 'datetime'),
            'name'         => $contract->name,
            'store' => ($contract->store) ? [
                'id' => (int) $contract->store->id,
                'name'=> e($contract->store->name)
            ] : null,
            'location' => ($contract->location) ? [
                'id' => (int) $contract->location->id,
                'name'=> e($contract->location->name)
            ] : null,
            'contact_id_1'  => ($contract->contact_one) ? [
                'id' => (int) $contract->contact_one->id,
                'name'=> e($contract->contact_one->getFullNameAttribute())
            ] : null,
            'contact_id_2'  => ($contract->contact_two) ? [
                'id' => (int) $contract->contact_two->id,
                'name'=> e($contract->contact_two->getFullNameAttribute())
            ] : null,
            'start_date'=> Helper::getFormattedDateObject($contract->start_date, 'datetime'),
            'end_date'=> Helper::getFormattedDateObject($contract->end_date, 'datetime'),
            'billing_date'=> Helper::getFormattedDateObject($contract->billing_date, 'datetime'), 
            'payment_date'=> Helper::getFormattedDateObject($contract->payment_date, 'datetime'), 
            'terms_and_conditions'=> $contract->terms_and_conditions, 
            'notes'=> $contract->notes
        ];

        $permissions_array['available_actions'] = [
            'update' => Gate::allows('update', store::class) ? true : false,
            'delete' => Gate::allows('delete', store::class) ? true : false,
        ];

        $array += $permissions_array;

        return $array;
    }
    public function transformstoreDatatable ($contract) {
        return (new DatatablesTransformer)->transformDatatables($contract);
    }
}
