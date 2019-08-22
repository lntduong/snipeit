<?php

namespace App\Models;

use App\Http\Traits\UniqueUndeletedTrait;
use App\Models\Traits\Searchable;
use Illuminate\Database\Eloquent\Model;
use Log;
use Watson\Validating\ValidatingTrait;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\SnipeModel;
use App\Models\User;

class Department extends SnipeModel
{
    /**
     * Whether the model should inject it's identifier to the unique
     * validation rules before attempting validation. If this property
     * is not set in the model it will default to true.
     *
     * @var boolean
     */
    protected $injectUniqueIdentifier = true;

    use ValidatingTrait, UniqueUndeletedTrait;

    protected $rules = [
        'name'                  => 'required|max:255|unsame_name:departments,store_id',
        'user_id'               => 'nullable|exists:users,id',
        'location_id'           => 'numeric|nullable',
        'store_id'              => 'required|numeric',
        'manager_id'            => 'numeric|nullable',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'name',
        'location_id',
        'store_id',
        'manager_id',
        'notes',
    ];

    use Searchable;

    /**
     * The attributes that should be included when searching the model.
     * 
     * @var array
     */
    protected $searchableAttributes = ['name'];

    /**
     * The relations and their attributes that should be included when searching the model.
     * 
     * @var array
     */
    protected $searchableRelations = [];


    public function store()
    {
        return $this->belongsTo('\App\Models\Store', 'store_id');
    }
    public function contract()
    {
        return $this->hasMany('\App\Models\Contract', 'object_id', 'id')
            ->select(['contracts.*'])
            ->where("contracts.object_type", "=", \DB::raw('"App\\\Models\\\Department"'));
    }

    /**
     * Even though we allow allow for checkout to things beyond users
     * this method is an easy way    of seeing if we are checked out to a user.
     * @return mixed
     */
    public function users()
    {
        return $this->hasMany('\App\Models\User', 'department_id');
    }


    /**
     * Return the manager in charge of the dept
     * @return mixed
     */
    public function manager()
    {
        return $this->belongsTo('\App\Models\User', 'manager_id');
    }


    public function location()
    {
        return $this->belongsTo('\App\Models\Location', 'location_id');
    }

    /**
     * Query builder scope to order on location name
     *
     * @param  \Illuminate\Database\Query\Builder  $query  Query builder instance
     * @param  text                              $order       Order
     *
     * @return \Illuminate\Database\Query\Builder          Modified query builder
     */
    public function scopeOrderLocation($query, $order)
    {
        return $query->leftJoin('locations as department_location', 'departments.location_id', '=', 'department_location.id')->orderBy('department_location.name', $order);
    }

    /**
     * Query builder scope to order on manager name
     *
     * @param  \Illuminate\Database\Query\Builder  $query  Query builder instance
     * @param  text                              $order       Order
     *
     * @return \Illuminate\Database\Query\Builder          Modified query builder
     */
    public function scopeOrderCompany($query, $order)
    {
        return $query
            ->leftJoin('stores as department_store', 'departments.store_id', '=', 'department_store.id')
            ->leftJoin('companies as department_company', 'department_company.id', '=', 'stores.company_id')
            ->orderBy('department_company.name', $order);
    }

    /**
     * Query builder scope to order on manager name
     *
     * @param  \Illuminate\Database\Query\Builder  $query  Query builder instance
     * @param  text                              $order       Order
     *
     * @return \Illuminate\Database\Query\Builder          Modified query builder
     */
    public function scopeOrderStore($query, $order)
    {
        return $query->leftJoin('stores as department_store', 'departments.store_id', '=', 'department_store.id')->orderBy('department_store.name', $order);
    }
    /**
     * Query builder scope to order on manager name
     *
     * @param  \Illuminate\Database\Query\Builder  $query  Query builder instance
     * @param  text                              $order       Order
     *
     * @return \Illuminate\Database\Query\Builder          Modified query builder
     */
    public function scopeOrderManager($query, $order)
    {
        return $query->leftJoin('users as department_user', 'departments.manager_id', '=', 'department_user.id')->orderBy('department_user.first_name', $order)->orderBy('department_user.last_name', $order);
    }
}