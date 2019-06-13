<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Score;
use App\Models\User;
use App\Http\Transformers\ScoreTransformer;

class ScoreController extends Controller
{
    /**
     * Returns Activity Report JSON.
     *
     * @author [A. Gianotto] [<snipe@snipe.net>]
     * @since [v4.0]
     * @return View
     */
    public function index(Request $request)
    {

    //  $score = Score::join('users', 'scores.user_id', '=', 'users.id')
    //  ->select('scores.id', 'scores.created_at', 'score', 'user_id' , 'users.username', 'scores.name', 'scores.email','scores.contact_number' )
    //  ->getQuery();
        $score = Score::select([
            'id', 'created_at', 'score', 'user_id'
         ]);
         
         if ($request->filled('search')) {
            $score = $score->TextSearch(e($request->input('search')));
        }

        // if (($request->filled('target_type'))  && ($request->filled('target_id'))) {
        //     $actionlogs = $actionlogs->where('target_id','=',$request->input('target_id'))
        //         ->where('target_type','=',"App\\Models\\".ucwords($request->input('target_type')));
        // }

        // if (($request->filled('item_type'))  && ($request->filled('item_id'))) {
        //     $actionlogs = $actionlogs->where('item_id','=',$request->input('item_id'))
        //         ->where('item_type','=',"App\\Models\\".ucwords($request->input('item_type')));
        // }

        // if ($request->filled('action_type')) {
        //     $actionlogs = $actionlogs->where('action_type','=',$request->input('action_type'))->orderBy('created_at', 'desc');
        // }

        // if ($request->filled('uploads')) {
        //     $actionlogs = $actionlogs->whereNotNull('filename')->orderBy('created_at', 'desc');
        // }
        $allowed_columns = [
            'user_id'
        ];
        $sort = in_array($request->input('sort'), $allowed_columns) ? e($request->input('sort')) : 'created_at';
        $order = ($request->input('order') == 'asc') ? 'asc' : 'desc';
        $offset = request('offset', 0);
        $limit = request('limit', 50);
        $total = $score->count();
        $score = $score
        ->orderBy($sort, $order)->skip($offset)->take($limit)->get();

        return response()->json((new ScoreTransformer)->transformScores($score, $total), 200, ['Content-Type' => 'application/json;charset=utf8'], JSON_UNESCAPED_UNICODE);

    }
}
