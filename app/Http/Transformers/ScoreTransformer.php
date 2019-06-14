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
        foreach ($scores as $score) {
            $array[] = self::transformScore($score);
        }
        return (new DatatablesTransformer)->transformDatatables($array, $total);
    }

    public function transformScore (Score $score)
    {

        $array = [
            'id'          => (int) $score->id,
            'created_at'    => Helper::getFormattedDateObject($score->created_at, 'datetime'),
            'score'         => $score->score,
            'username' => ($score->user) ? [
                'id' => (int) $score->user->id,
                'name'=> e($score->user->getFullNameAttribute())
            ] : null,

            

        ];

        $permissions_array['available_actions'] = [
            'update' => Gate::allows('update', Score::class) ? true : false,
            'delete' => Gate::allows('delete', Score::class) ? true : false,
        ];

        $array += $permissions_array;

        return $array;
    }
    public function transformScoreDatatable ($scores) {
        return (new DatatablesTransformer)->transformDatatables($scores);
    }
}
