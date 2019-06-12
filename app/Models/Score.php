<?php
namespace App\Models;

use App\Models\Traits\Searchable;

class Score extends SnipeModel
{
    //protected $presenter = "App\Presenters\ActionlogPresenter";
    //use SoftDeletes;
    //use Presentable;
    //protected $dates = [ 'deleted_at' ];

    protected $table      = 'scores';
    public $timestamps = true;
    protected $fillable   = [ 'id', 'name', 'email','contact_number', 'created_at', 'user_id', 'score'];

    use Searchable;
    
    /**
     * The attributes that should be included when searching the model.
     * 
     * @var array
     */
    protected $searchableAttributes = [ 'id', 'name', 'email','contact_number', 'created_at', 'user_id', 'score'];

    public function setUserIdAttribute($input)
{
    $this->attributes['user_id'] = $input ? $input : null;
}
public function user()
{
    return $this->belongsTo('\App\Models\User', 'user_id');
}

private static function isFullMultipleScoreSupportEnabled()
    {
        $settings = Setting::getSettings();

        // NOTE: this can happen when seeding the database
        if (is_null($settings)) {
            return false;
        } else {
            return $settings->full_multiple_scores_support == 1;
        }
    }

    private static function scopeScoreablesDirectly($query, $column = 'user_id', $table_name = null )
    {
        if (Auth::user()) {
            $company_id = Auth::user()->user_id;
        } else {
            $user_id = null;
        }

        $table = ($table_name) ? DB::getTablePrefix().$table_name."." : '';
        return $query->where($table.$column, '=', $user_id); 
    }

public static function scopeScoreables($query, $column = 'user_id', $table_name = null )
    {
        // If not logged in and hitting this, assume we are on the command line and don't scope?'
        if (!static::isFullMultipleScoreSupportEnabled() || (Auth::check() && Auth::user()->isSuperUser()) || (!Auth::check())) {
            return $query;
        } else {
            return static::scopeCompanyablesDirectly($query, $column, $table_name);
        }
    }
    public static function getIdFromInput($unescaped_input)
    {
        $escaped_input = e($unescaped_input);

        if ($escaped_input == '0') {
            return null;
        } else {
            return $escaped_input;
        }
    }
    public static function getIdForCurrentUser($unescaped_input)
    {
        if (!static::isFullMultipleScoreSupportEnabled()) {
            return static::getIdFromInput($unescaped_input);
        } else {
            $current_user = Auth::user();

            // Super users should be able to set a company to whatever they need
            if ($current_user->isSuperUser()) {
                return static::getIdFromInput($unescaped_input);
            } else {
                if ($current_user->user_id != null) {
                    return $current_user->user_id;
                } else {
                    return static::getIdFromInput($unescaped_input);
                }
            }

        }
    }
    public static function getIdForUser($unescaped_input)
    {
        if (!static::isFullMultipleScoreSupportEnabled() || Auth::user()->isSuperUser()) {
            return static::getIdFromInput($unescaped_input);
        } else {
            return static::getIdForCurrentUser($unescaped_input);
        }
    }

}
