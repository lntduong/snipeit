<?php

namespace App\Observers;

use App\Models\Inventory;
use App\Models\Setting;
use App\Models\Actionlog;
use Auth;

class InventoryObserver
{
    /**
     * Listen to the User created event.
     *
     * @param  Component  $component
     * @return void
     */
    public function updated(Inventory $inventory)
    {
        if (($inventory->getAttributes()['id'] == $inventory->getOriginal()['id']))
        {
            $changed = [];

            foreach ($inventory->getOriginal() as $key => $value) {
                if ($inventory->getOriginal()[$key] != $inventory->getAttributes()[$key]) {
                    $changed[$key]['old'] = $inventory->getOriginal()[$key];
                    $changed[$key]['new'] = $inventory->getAttributes()[$key];
                }
            }


            $logAction = new Actionlog();
            $logAction->item_type = Inventory::class;
            $logAction->item_id = $inventory->id;
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
    public function created(Inventory $inventory)
    {
        $logAction = new Actionlog();
        $logAction->item_type = Inventory::class;
        $logAction->item_id = $inventory->id;
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
    public function deleting(Inventory $inventory)
    {
        $logAction = new Actionlog();
        $logAction->item_type = Inventory::class;
        $logAction->item_id = $inventory->id;
        $logAction->created_at =  date("Y-m-d H:i:s");
        $logAction->user_id = Auth::id();
        $logAction->logaction('delete');
    }
}
