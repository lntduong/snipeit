<?php
namespace App\Http\Transformers;

use App\Models\Score;
use App\Models\User;
use App\Models\Setting;
use Gate;
use Illuminate\Database\Eloquent\Collection;
use App\Helpers\Helper;

class ScoreTransformer
{

    public function transformScores (Collection $scores, $total)
    {
        $array = array();
        //$user = User::getFullNameEmailAttribute();
        foreach ($scores as $score) {
            $array[] = self::transformScore($score);
        }
        return (new DatatablesTransformer)->transformDatatables($array, $total);
    }

    public function transformScore (Score $score)
    {

        $array = [
            'id'          => (int) $score->id,
            'name'          => $score->name,
            'email'        => $score->email, 
            'contact_number' => $score->contact_number,
            'created_at'    => Helper::getFormattedDateObject($score->created_at, 'datetime'),
            'score'         => $score->score,
            'username' => ($score->users) ? [
                'id' => (int) $score->users->id,
                'name'=> e($score->users->username)
            ] : null,

            

        ];

        return $array;
    }
    public function transformScoreDatatable ($scores) {
        return (new DatatablesTransformer)->transformDatatables($scores);
    }
}
