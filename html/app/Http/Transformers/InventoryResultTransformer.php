<?php
namespace App\Http\Transformers;

use App\Models\InventoryResult;
use App\Helpers\Helper;
use Gate;

class InventoryResultTransformer
{
    public function transformInventoryresults($inventoryresults, $total)
    {
        $array = array();
        foreach ($inventoryresults as $inventoryresult) {
            $array[] = self::transformInventoryresult($inventoryresult);
        }
        return (new DatatablesTransformer)->transformDatatables($array, $total);
    }

    public function transformInventoryresult($inventoryresult)
    {
        $array = [
            'id'      => e($inventoryresult->id),
            'deviece' => e($inventoryresult->asset_id),
            'image'   => self::getImageUrl($inventoryresult->image,$inventoryresult->image_model),
            'name' => e($inventoryresult->name),
            'checked' =>  Helper::getFormattedDateObject($inventoryresult->checked_time, 'datetime'),
            'recognized' =>  e($inventoryresult->unrecognized),

        ];
        $permissions_array['available_actions'] = [
            'update' => (bool) Gate::allows('update', InventoryResult::class),
            'delete' => (bool) Gate::allows('delete', InventoryResult::class),
        ];
        $array += $permissions_array;

        return $array;
    }
    public function getImageUrl($image,$image_model)
    {
        if ($image && !empty($image)) {
            return url('/').'/uploads/assets/'.$image;
        } elseif ($image_model && !empty($image_model)) {
            return url('/').'/uploads/models/'.$image_model;
        }
        return false;
    }
    

}
