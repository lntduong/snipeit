<?php
namespace App\Models;

use App\Models\Traits\Searchable;
use App\Presenters\Presentable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Watson\Validating\ValidatingTrait;

/** 
 * Model for Components.
 *
 * @version    v1.0
 */
class InventoryResults extends SnipeModel
{
    protected $table = 'inventory_results';
    protected $fillable = [
        'inventory_id',
        'asset_id',
        'unrecognized',
        'checked_time',
        'user_id'
    ];
}
