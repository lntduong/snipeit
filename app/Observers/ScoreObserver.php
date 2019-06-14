<?php

namespace App\Observers;

use App\Models\Score;
use App\Models\Setting;
use App\Models\Actionlog;
use Auth;

class ScoreObserver
{
    /**
     * Listen to the User created event.
     *
     * @param  Score $score
     * @return void
     */
    public function updated(Score $score)
    {
    
        $changed = [];

        foreach ($score->getOriginal() as $key => $value) {
            if ($score->getOriginal()[$key] != $score->getAttributes()[$key]) {
                $changed[$key]['old'] = $score->getOriginal()[$key];
                $changed[$key]['new'] = $score->getAttributes()[$key];
            }
        }

        $logAction = new Actionlog();
        $logAction->item_type = Score::class;
        $logAction->item_id = $score->id;
        $logAction->created_at =  date("Y-m-d H:i:s");
        $logAction->user_id = Auth::id();
        $logAction->log_meta = json_encode($changed);
        $logAction->logaction('update');
        $logAction->target = $score->user_id;
    }


    /**
     * Listen to the Component created event when
     * a new component is created.
     *
     * @param  Score $score
     * @return void
     */
    public function created(Score $score)
    {
        $logAction = new Actionlog();
        $logAction->item_type = Score::class;
        $logAction->item_id = $score->id;
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
    public function deleting(Score $score)
    {
        $logAction = new Actionlog();
        $logAction->item_type = Score::class;
        $logAction->item_id = $score->id;
        $logAction->created_at =  date("Y-m-d H:i:s");
        $logAction->user_id = Auth::id();
        $logAction->logaction('delete');
    }
}
