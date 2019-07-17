<?php
namespace App\Http\Transformers;

use App\Models\Store;
use Illuminate\Database\Eloquent\Collection;
use App\Helpers\Helper;
use Gate;

class StoreTransformer
{
    public function transformStores(Collection $stores, $total)
    {
        $array = array();
        foreach ($stores as $store) {
            $array[] = self::transformStore($store);
        }
        return (new DatatablesTransformer)->transformDatatables($array, $total);
    }

    public function transformStore(Store $store)
    {
        $array = [
            'id'       => (int) $store->id,
            'name'     => e($store->name),
            'image'    =>   ($store->image) ? e(url('/').'/uploads/store/'.e($store->image)) : null,
           
            'location' => ($store->location) ? [
                'id'   => (int) $store->location->id,
                'name' => e($store->location->name)
            ] : null,
            'company'  => ($store->company) ? [
                'id'   => (int) $store->company->id,
                'name' => e($store->company->name)
            ] : null,
           
        ];
        $permissions_array['available_actions'] = [
            'update'   => (bool) Gate::allows('update', Store::class),
            'delete'   => ((bool) Gate::allows('delete', Store::class) && ($store->contract ? false : true) && ($store->department ? false : true) && ($store->deleted_at=='')) ? true : false,
        ];
        $array += $permissions_array;
        return $array;
    }
    
}
