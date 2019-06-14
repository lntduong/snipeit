@extends('layouts/edit-form', [
    'createText' => trans('admin/score/table.create') ,
    'updateText' => trans('admin/score/table.update'),
    'helpTitle' => trans('admin/score/general.about_score_title'),
    'helpText' => trans('admin/score/general.about_score_text'),
    'formAction' => ($item) ? route('score.update', ['score' => $item->id]) : route('score.store'),
])

{{-- Page content --}}
@section('inputFields')
<div class="panel panel-default">
        <div class="panel-body">
            @include ('partials.forms.edit.user-select-score', ['translated_name' => trans('admin/score/table.score')]) 
            @include ('partials.forms.edit.score', ['translated_name' => trans('admin/score/table.score')])            
        </div>
</div>
@stop
