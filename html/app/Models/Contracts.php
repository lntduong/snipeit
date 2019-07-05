<?php
namespace App\Models;

use App\Http\Traits\UniqueUndeletedTrait;
use App\Models\SnipeModel;
use App\Presenters\Presentable;
use Watson\Validating\ValidatingTrait;


use App\Models\Traits\Searchable;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Model for Assets.
 *
 * @version    v1.0
 */
class Contracts extends SnipeModel
{
    use Presentable;

    protected $presenter = 'App\Presenters\ScorePresenter';
   
    protected $guarded = 'id';
    protected $table = 'contracts';

    protected $rules = array(
        
    );
    protected $injectUniqueIdentifier = true;
    use ValidatingTrait;
    
    protected $fillable = [
        'store_id',
        'name',
        'location_id',
        'contact_id_1',
        'contact_id_2',
        'terms_and_conditions',
        'notes',
        'start_date',
        'end_date',
        'billing_date',
        'payment_date',
        'created_at',
        'updated_at',
        'deleted_at'
    ];

    protected $dates = [
        
    ];

    public $timestamps = true;
    
    public function store()
    {
        return $this->belongsTo('\App\Models\Stores', 'store_id');
    }
    


}
