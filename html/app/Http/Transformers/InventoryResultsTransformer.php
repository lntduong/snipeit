<?php
namespace App\Http\Transformers;

use App\Models\InventoryResult;
use App\Helpers\Helper;
use Gate;
use Illuminate\Database\Eloquent\Collection;

class InventoryResultsTransformer
{
    public function transformInventoryresults($inventoryresults, $inventory_id,$total)
    {
        $array = array();
        foreach ($inventoryresults as $inventoryresult) {
            $array[] = self::transformInventoryresult($inventoryresult,$inventory_id);
        }
        return (new DatatablesTransformer)->transformDatatables($array,$total);
    }

    public function transformInventoryresult($inventoryresult,$inventory_id)
    {
        $array = [
            'id'             => e($inventoryresult->id),
            'inventory_id'   => $inventory_id,
            'deviece'        => e($inventoryresult->asset_id),
            'image'          => self::getImageUrl($inventoryresult->image,$inventoryresult->image_model),
            'asset_tag'      => e($inventoryresult->asset_tag),
            'name'           => e($inventoryresult->name),
            'checked'        =>  Helper::getFormattedDateObject($inventoryresult->checked_time, 'date'),
            'familiar'       =>  e($inventoryresult->familiar),
            'status_label'   => ($inventoryresult->status_id) ? [
                'id'         => (int) $inventoryresult->status_id,
                'name'       => e($inventoryresult->status_name),
                'status_type'=> self::getStatuslabelType($inventoryresult->status_pen,$inventoryresult->status_arc,$inventoryresult->status_dep),
                'status_meta' => ($inventoryresult->assigned_to) ? 'deployed' :'deployable',
            ] : null,

        ];
        $permissions_array['available_actions'] = [
            'update' => (bool) Gate::allows('update', InventoryResult::class),
            'delete' => (bool) Gate::allows('delete', InventoryResult::class),
        ];
        $array += $permissions_array;

        return $array;
    }

    /**
     * Scan Results Transformer
     * @version 1.0 - 2019/07/30
     * @author ThongLT
     */
    public function transformScanInventoryResults($inventoryresults)
    {
        $array = array();
        foreach ($inventoryresults as $inventoryresult) {
            $array[] = self::transformScanInventoryResult($inventoryresult);
        }
        
        return $array;
    }

    /**
     * Scan Result Transformer
     * @version 1.0 - 2019/07/30
     * @return Array
     * @author ThongLT
     */
    public function transformScanInventoryResult($inventoryresult)
    {
        $array = [
            'id'              => !is_null($inventoryresult->id) ? (int) $inventoryresult->id : null,
            'asset_id'        => (int) e($inventoryresult->asset_id),
            'image'           => self::getImageUrl($inventoryresult->image, $inventoryresult->image_model),
            'asset_tag'       => e($inventoryresult->asset_tag),
            'name'            => e($inventoryresult->name),
            'checked'         => Helper::getFormattedDateObject($inventoryresult->checked_time, 'datetime'),
            'familiar'        => !is_null($inventoryresult->familiar) ? (int) $inventoryresult->familiar : null,
            'status_label'    => [
                'id'          => (!empty($inventoryresult->status_id)) ? (int) $inventoryresult->status_id : null,
                'name'        => (!empty($inventoryresult->status_name)) ? e($inventoryresult->status_name) : null]
        ];
        $permissions_array['available_actions'] = [
            'update' => false,
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
    public function getStatuslabelType($pending,$archived,$deployable)
    {

        if (($pending == '1') && ($archived == '0')  && ($deployable == '0')) {
            return 'pending';
        } elseif (($pending == '0') && ($archived == '1')  && ($deployable == '0')) {
            return 'archived';
        } elseif (($pending == '0') && ($archived == '0')  && ($deployable == '0')) {
            return 'undeployable';
        }

        return 'deployable';

    }
    public function present()
    {

        if (!$this->presenter || !class_exists($this->presenter)) {
            throw new \Exception('Presenter class does not exist');
        }

        if (!isset($this->presenterInterface)) {
            $this->presenterInterface = new $this->presenter($this);
        }

        return $this->presenterInterface;

    }


}
