<?php
namespace App\Models;

use App\Models\SnipeModel;
use Watson\Validating\ValidatingTrait;
use App\Models\Traits\Searchable;

final class Contract extends SnipeModel
{
    const COMPANY = 'company';
    protected $table = 'contracts';

    protected $presenter = 'App\Presenters\ContractPresenter';
    public $rules = array(
            'name' => 'required',
            'start_date' => 'required',
            'end_date'  => 'required',
            'billing_date'  => 'required',
            'object_id' => 'required',
    );
    use ValidatingTrait;
    use Searchable;
    protected $searchableAttributes = ['name', 'created_at', 'updated_at']; 
    protected $fillable = [
        'id',
        'object_id' , 
        'object_type' ,
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
    public function assetlog()
    {
        return $this->hasMany('\App\Models\Actionlog', 'item_id')->where('item_type', Component::class)->orderBy('created_at', 'desc')->withTrashed();
    }
    public function checkedOutToUser()
    {
      return $this->objectType() === self::COMPANY;
    }
    public function objectId()
    {
        return $this->morphTo('assigned', 'object_id', 'object_type');
    }

    public function assignedCompanies()
    {
        return $this->morphMany('App\Models\Company', 'assigned', 'object_id', 'object_type')->withTrashed();
    }
    public function objectType()
    {
        return strtolower(class_basename($this->object_type));
    }
}
