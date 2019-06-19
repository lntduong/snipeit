<?php
namespace App\Http\Transformers;

use App\Models\Store;
use App\Models\User;
use App\Models\Setting;
use Gate;
use Illuminate\Database\Eloquent\Collection;
use App\Helpers\Helper;

class StoreTransformer
{

    public function transformStores (Collection $stores, $total)
    {
        $array = array();
        foreach ($stores as $store) {
            $array[] = self::transformStore($store);
        }
        return (new DatatablesTransformer)->transformDatatables($array, $total);
    }

    public function transformStore (Store $store)
    {

        $array = [
            'id'          => (int) $store->id,
            'created_at'    => Helper::getFormattedDateObject($store->created_at, 'datetime'),
            'updated_at'    => Helper::getFormattedDateObject($store->updated_at, 'datetime'),
            'name'         => $store->name,
            'company' => ($store->company) ? [
                'id' => (int) $store->company->id,
                'name'=> e($store->company->name)
            ] : null,
            'location' => ($store->location) ? [
                'id' => (int) $store->location->id,
                'name'=> e($store->location->name)
            ] : null,
            'image' =>   ($store->image) ? app('store_upload_url').e($store->image) : null,
            

        ];

        $permissions_array['available_actions'] = [
            'update' => Gate::allows('update', store::class) ? true : false,
            'delete' => Gate::allows('delete', store::class) ? true : false,
        ];

        $array += $permissions_array;

        return $array;
    }
    public function transformstoreDatatable ($stores) {
        return (new DatatablesTransformer)->transformDatatables($stores);
    }
}
