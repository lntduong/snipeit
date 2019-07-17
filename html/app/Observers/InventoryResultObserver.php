<?php

namespace App\Observers;

use App\Models\InventoryResult;
use App\Models\Setting;
use App\Models\Actionlog;
use Auth;

class InventoryResultObserver
{
    /**
     * Listen to the User created event.
     *
     * @param  Component  $component
     * @return void
     */
    public function updated(InventoryResult $inventory_result)
    {
        if (($inventory_result->getAttributes()['id'] == $inventory_result->getOriginal()['id'])){
            $changed = [];
            foreach ($inventory_result->getOriginal() as $key => $value) {
                if ($inventory_result->getOriginal()[$key] != $inventory_result->getAttributes()[$key]) {
                    $changed[$key]['old'] = $inventory_result->getOriginal()[$key];
                    $changed[$key]['new'] = $inventory_result->getAttributes()[$key];
                }
            }
            $logAction = new Actionlog();
            $logAction->item_type = InventoryResult::class;
            $logAction->item_id = $inventory_result->id;
            $logAction->created_at =  date("Y-m-d H:i:s");
            $logAction->user_id = Auth::id();
            $logAction->log_meta = json_encode($changed);
            $logAction->logaction('update');

        } 
    }

    /**
     * Listen to the Component created event when
     * a new component is created.
     *
     * @param  Component  $component
     * @return void
     */
    public function created(InventoryResult $inventory_result)
    {
        $logAction = new Actionlog();
        $logAction->item_type = InventoryResult::class;
        $logAction->item_id = $inventory_result->id;
        $logAction->created_at =  date("Y-m-d H:i:s");
        $logAction->user_id = Auth::id();
        $logAction->logaction('create');

    }

    /**
     * Listen to the Component deleting event.
     *
     * @param  Component  $component
     * @return void
     */
    public function deleting(InventoryResult $inventory_result)
    {
        $logAction = new Actionlog();
        $logAction->item_type = InventoryResult::class;
        $logAction->item_id = $inventory_result->id;
        $logAction->created_at =  date("Y-m-d H:i:s");
        $logAction->user_id = Auth::id();
        $logAction->logaction('delete');
    }
}
