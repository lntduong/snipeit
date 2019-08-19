<?php

namespace App\Observers;

use App\Models\ContractAsset;
use App\Models\Setting;
use App\Models\Actionlog;
use Auth;

/**
 *
 * @author [duong.LNT]
 */
class ContractAssetsObserver
{
    /**
     * Listen to the Component created event when
     * a new component is created.
     *
     * @param  Component  $component
     * @return void
     */
    public function created(ContractAsset $contractAssets)
    {
        $logAction = new Actionlog();
        $logAction->item_type = ContractAsset::class;
        $logAction->item_id = $contractAssets->id;
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
    public function deleting(ContractAsset $contractAssets)
    {
        $logAction = new Actionlog();
        $logAction->item_type = ContractAsset::class;
        $logAction->item_id = $contractAssets->id;
        $logAction->created_at =  date("Y-m-d H:i:s");
        $logAction->user_id = Auth::id();
        $logAction->logaction('delete');
    }
}
