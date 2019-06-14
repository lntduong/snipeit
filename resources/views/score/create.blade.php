@extends('layouts/edit-form', [
    'createText' => trans('admin/score/table.create') ,
    'updateText' => trans('admin/score/table.update'),
    'helpTitle' => trans('admin/score/general.about_score_title'),
    'helpText' => trans('admin/score/general.about_score_text'),
    'formAction' => ($item) ? route('score.update', ['score' => $item->id]) : route('score.store'),
])

{{-- Page content --}}
@section('inputFields')
    <div class="col-xs-8 form-group">
            {!! Form::label('user_id', 'User', ['class' => 'col-md-3 control-label']) !!}
            {!! Form::select('user_id', $user, old('user_id'), ['class' => 'select2']) !!}
            <p class="help-block"></p>
            @if($errors->has('user_id'))
                <p class="help-block">
                    {{ $errors->first('user_id') }}
                </p>
            @endif
        </div>
    @include ('partials.forms.edit.score', ['translated_name' => trans('admin/score/table.score')])            
@stop
