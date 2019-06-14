<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use App\Models\User;
use App\Models\Score;

class ScoreController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->authorize('index', Score::class);
        return view('score/index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->authorize('create', Score::class);
        $user = User::get()->pluck('full_name_email', 'id')->prepend('Please select', '');
        return view('score.edit', compact('user','score'))->with('item', new Score);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     *  
     */
    public function store(Request $request)
    {
        // $score = Score::create($request->all());
        // return redirect()->route('score.activity');

        $input = request() -> validate([
            'user_id' => 'required',
            'score' => 'required|numeric|min:0|max:10',
        ]);
        $input = request()->all();
        $score = Score::create($input);
        return redirect()->route('score.index')
        ->with('Score created successfully!');
    }
     

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $this->authorize('view', Score::class);

        if (is_null($score = Score::find($id))) {
            return redirect()->route('score.index')
                ->with('error', trans('admin/companies/message.not_found'));
        } else {
            return view('score/view')->with('score',$score);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($scoreId)
    {
        if (is_null($item = Score::find($scoreId))) {
            return redirect()->route('score.index')
                ->with('error', trans('admin/companies/message.does_not_exist'));
        }

        $this->authorize('update', $item);
        $user = User::get()->pluck('full_name_email', 'id');
        return view('score/edit', compact('user','score'))->with('item', $item)
        ->with('user', $user);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $scoreId)
    {
        if (is_null($score = Score::find($scoreId))) {
            return redirect()->route('score.index')->with('error', trans('admin/companies/message.does_not_exist'));
        }

        $this->authorize('update', $score);

        $score->score = $request->input('score');

        if ($score->save()) {
            return redirect()->route('score.index')
                ->with('success', trans('admin/companies/message.update.success'));
        }
        return redirect()->route('score.edit', ['score' => $scoreId])
            ->with('error', trans('admin/companies/message.update.error'));

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($scoreId)
    {
        if (is_null($score = Score::find($scoreId))) {
            return redirect()->route('score.index')
                ->with('error', trans('admin/companies/message.not_found'));
        } else {

            $this->authorize('delete', $score);

            try {
                $score->delete();
                return redirect()->route('score.index')
                    ->with('success', trans('admin/companies/message.delete.success'));
            } catch (\Illuminate\Database\QueryException $exception) {
            /*
                 * NOTE: This happens when there's a foreign key constraint violation
                 * For example when rows in other tables are referencing this company
                 */
                if ($exception->getCode() == 23000) {
                    return redirect()->route('score.index')
                        ->with('error', trans('admin/companies/message.assoc_users'));
                } else {
                    throw $exception;
                }
            }
        }
    }
}
