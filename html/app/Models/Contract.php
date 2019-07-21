<?php
namespace App\Models;

use App\Models\SnipeModel;
use Watson\Validating\ValidatingTrait;
use App\Models\Traits\Searchable;
use Illuminate\Database\Eloquent\SoftDeletes;

final class Contract extends SnipeModel
{
    protected $table = 'contracts';

    protected $presenter = 'App\Presenters\ContractPresenter';
    public $rules = array(
            'name' => 'required|unsame_name:contracts,object_id',
            //'store_id' => 'required',
            'start_date' => 'required',
            'end_date'  => 'required',
            'billing_date' => 'required',
            'object_id' => 'required',
    );
    use ValidatingTrait;
    use Searchable;
    use Loggable;
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $searchableAttributes = [
        'name', 
        'created_at', 
        'updated_at',
        'start_date',
        'end_date',
        'billing_date',
        'payment_date',
        'terms_and_conditions',
        'notes'
    ]; 
    protected $searchableRelations = [
        'store'      => ['name'],
        'location'   => ['name'],
        'user'       => ['last_name'],
        'user2'      => ['last_name']
    ];   
    protected $fillable = [
        'id',
        //'store_id' , 
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

    public function company()
    {
        return $this->belongsTo('\App\Models\Company', 'object_id', 'id')
        ->select(['companies.*', 'stores.name as store_name'])
        ->join('contracts','companies.id', '=' , 'contracts.object_id')
        ->join('stores','stores.company_id', '=' , 'companies.id')
        ->where("contracts.object_type","=",\DB::raw('"App\\\Models\\\Company"'));
    }

    public function store()
    {
        return $this->belongsTo('\App\Models\Store', 'object_id', 'id')
        ->select(['stores.*', 'companies.name as company_name', 'companies.id as company_id'])
        ->join('contracts','stores.id', '=' , 'contracts.object_id')
        ->join('companies','stores.company_id', '=' , 'companies.id')
        ->where("contracts.object_type","=",\DB::raw('"App\\\Models\\\Store"'));
    }
    
    public function department()
    {
        return $this->belongsTo('\App\Models\Department', 'object_id', 'id')
        ->select(['departments.*', 'stores.name as store_name', 'companies.name as company_name', 'stores.id as store_id', 'companies.id as company_id'])
        ->join('contracts','departments.id', '=' , 'contracts.object_id')
        ->join('stores','stores.id', '=' , 'departments.store_id')
        ->join('companies','stores.company_id', '=' , 'companies.id')
        ->where("contracts.object_type","=",\DB::raw('"App\\\Models\\\Department"'));
    }
    public function asset()
    {
        return $this->belongsToMany(Asset::class);
    }

    public function contract_assets()
    {
    	return $this->belongsTo('\App\Models\ContractAsset','id','contract_id');
    }

    public function assetlog()
    {
        return $this->hasMany('\App\Models\Actionlog', 'item_id')->where('item_type', Component::class)->orderBy('created_at', 'desc')->withTrashed();
    }
}
