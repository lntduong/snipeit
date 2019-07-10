<?php

namespace App\Observers;

use App\Models\Contract;
use App\Models\Setting;
use App\Models\Actionlog;
use Auth;
    /**
     *
     * @author [duong.LNT] [duong.lnt@vn.vinx.asia]
     */
class ContractObserver
{
    /**
     * Listen to the User created event.
     *
     * @param  Component  $component
     * @return void
     */
    public function updated(Contract $contract)
    {
        if (($contract->getAttributes()['id'] == $contract->getOriginal()['id']))
        {
            $changed = [];

            foreach ($contract->getOriginal() as $key => $value) {
                if ($contract->getOriginal()[$key] != $contract->getAttributes()[$key]) {
                    $changed[$key]['old'] = $contract->getOriginal()[$key];
                    $changed[$key]['new'] = $contract->getAttributes()[$key];
                }
            }


            $logAction = new Actionlog();
            $logAction->item_type = Contract::class;
            $logAction->item_id = $contract->id;
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
    public function created(Contract $contract)
    {
        $logAction = new Actionlog();
        $logAction->item_type = Contract::class;
        $logAction->item_id = $contract->id;
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
    public function deleting(Contract $contract)
    {
        $logAction = new Actionlog();
        $logAction->item_type = Contract::class;
        $logAction->item_id = $contract->id;
        $logAction->created_at =  date("Y-m-d H:i:s");
        $logAction->user_id = Auth::id();
        $logAction->logaction('delete');
    }
}
