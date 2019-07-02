<?php
namespace App\Models;

use App\Models\SnipeModel;
use Watson\Validating\ValidatingTrait;
use App\Models\Traits\Searchable;

final class Contract extends SnipeModel
{
    protected $table = 'contracts';

    protected $rules = [
        'name' => 'required',
        'store_id' => 'required',
        'start_date' => 'required',
        'end_date'  => 'required',
        //'contact_id_1' => 'required'        
    ];

    protected $presenter = 'App\Presenters\ContractPresenter';

    use ValidatingTrait;
    use Searchable;
    protected $searchableAttributes = ['name', 'created_at', 'updated_at']; 
    protected $fillable = [
                            'id',
                            'store_id' , 
                            'name' ,
                            'location_id' ,
                            'contact_id_1' ,
                            'contact_id_2' ,
                            'start_date' ,
                            'end_date' ,
                            'billing_date' ,
                            'payment_date' ,
                            'terms_and_conditions' ,
                            'notes'
                        ];

    public function user()
    {
        return $this->belongsTo('\App\Models\User', 'contact_id_1');
    }

    public function user2()
    {
        return $this->belongsTo('\App\Models\User', 'contact_id_2');
    }

    public function location()
    {
        return $this->belongsTo('\App\Models\Location', 'location_id');
    }

    public function store()
    {
        return $this->belongsTo('\App\Models\Store', 'store_id');
    }
    public function asset()
    {
        return $this->belongsToMany(Asset::class);
    }
}
