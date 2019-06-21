<?php
namespace App\Models;

use App\Models\Traits\Searchable;

class Contract extends SnipeModel
{

    protected $table      = 'contracts';
    public $timestamps = true;
    protected $fillable   = [ 'id', 'store_id', 'name','location_id', 'contact_id_1', 'contact_id_2', 'start_date', 'end_date', 'billing_date', 'payment_date', 'terms_and_conditions', 'notes', 'created_at', 'update_at', 'deleted_at', 'user_id'];
    protected $dates = ['start_date', 'end_date', 'billing_date', 'payment_date'];
    use Searchable;

public function store()
{
    return $this->belongsTo('\App\Models\Store', 'store_id');
}

public function contact_one()
{
    return $this->belongsTo('\App\Models\User', 'contact_id_1');
}

public function contact_two()
{
    return $this->belongsTo('\App\Models\User', 'contact_id_2');
}

public function location()
{
    return $this->belongsTo('\App\Models\Location', 'location_id');
}
    public function assetlog()
    {
        return $this->hasMany('\App\Models\Actionlog', 'item_id')
            ->where('item_type', '=', Store::class)
            ->orderBy('created_at', 'desc');
    }
       /**
    * Get uploads for this asset
    */
    public function uploads()
    {
        return $this->hasMany('\App\Models\Actionlog', 'item_id')
            ->where('item_type', '=', Score::class)
            ->where('action_type', '=', 'uploaded')
            ->whereNotNull('filename')
            ->orderBy('created_at', 'desc');
    }
    public static function adjustScore($score, $oldSeats, $newSeats)
    {
        // If the seats haven't changed, continue on happily.
        if ($oldSeats==$newSeats) {
            return true;
        }
        // On Create, we just make one for each of the seats.
        $change = abs($oldSeats - $newSeats);
        if ($oldSeats > $newSeats) {
            // Log Deletion of seats.
            $logAction = new Actionlog;
            $logAction->item_type = Score::class;
            $logAction->item_id = $score->id;
            $logAction->user_id = Auth::id() ?: 1; // We don't have an id while running the importer from CLI.
            $logAction->note = "deleted ${change} scores";
            $logAction->target_id =  null;
            $logAction->logaction('delete scores');
            return true;
        }
        // On initail create, we shouldn't log the addition of seats.
        if ($score->id) {
            //Log the addition of license to the log.
            $logAction = new Actionlog();
            $logAction->item_type = Score::class;
            $logAction->item_id = $score->id;
            $logAction->user_id = Auth::id() ?: 1; // Importer.
            $logAction->note = "added ${change} scores";
            $logAction->target_id =  null;
            $logAction->logaction('add scores');
        }
        return true;
    }

}
