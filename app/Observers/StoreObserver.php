<?php

namespace App\Observers;

use App\Models\Store;
use App\Models\Setting;
use App\Models\Actionlog;
use Auth;

class StoreObserver
{
    /**
     * Listen to the User created event.
     *
     * @param  store $store
     * @return void
     */
    public function updated(Store $store)
    {
    
        $changed = [];

        foreach ($store->getOriginal() as $key => $value) {
            if ($store->getOriginal()[$key] != $store->getAttributes()[$key]) {
                $changed[$key]['old'] = $store->getOriginal()[$key];
                $changed[$key]['new'] = $store->getAttributes()[$key];
            }
        }

        $logAction = new Actionlog();
        $logAction->item_type = Store::class;
        $logAction->item_id = $store->id;
        $logAction->created_at =  date("Y-m-d H:i:s");
        $logAction->user_id = Auth::id();
        $logAction->log_meta = json_encode($changed);
        $logAction->logaction('update');
        $logAction->target = $store->user_id;
    }


    /**
     * Listen to the Component created event when
     * a new component is created.
     *
     * @param  store $store
     * @return void
     */
    public function created(Store $store)
    {
        $logAction = new Actionlog();
        $logAction->item_type = Store::class;
        $logAction->item_id = $store->id;
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
    public function deleting(Store $store)
    {
        $logAction = new Actionlog();
        $logAction->item_type = Store::class;
        $logAction->item_id = $store->id;
        $logAction->created_at =  date("Y-m-d H:i:s");
        $logAction->user_id = Auth::id();
        $logAction->logaction('delete');
    }
}
