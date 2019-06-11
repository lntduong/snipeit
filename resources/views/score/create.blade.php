@extends('layouts/default')
{{-- Page title --}}
<title>Create Score</title>
@section('header_right')
<a href="{{ URL::previous() }}" class="btn btn-primary pull-right">
  {{ trans('general.back') }}</a>
@stop
@section('content')
    <h3 class="page-title">Create Score</h3>
    {!! Form::open(['method' => 'POST', 'route' => ['score.store']]) !!}
    {{csrf_field()}}
    <div class="panel panel-default">
        
        <div class="panel-body">
            <div class="row">
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
            </div>
            <div class="row">
                <div class="col-xs-8 form-group">
                    {!! Form::label('score', 'Score', ['class' => 'col-md-3 control-label']) !!}
                    {!! Form::text('score', old('score'), ['class' => 'form-control', 'style' => 'width: 332px;', 'placeholder' => 'Score']) !!}
                    <p class="help-block"></p>
                    @if($errors->has('score'))
                        <p class="help-block">
                            {{ $errors->first('score') }}
                        </p>
                    @endif
                </div>
            </div>
            <div class="box-footer text-right">
                <button type="submit" class="btn btn-success"><i class="fa fa-check icon-white"></i> {{ trans('general.save') }}</button>
            </div>
        </div>
    </div>
    {!! Form::close() !!}
@stop