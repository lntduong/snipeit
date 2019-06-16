<div class="row">
    <div class="col-xs-8 form-group {{ $errors->has('score') ? ' has-error' : '' }}">
            {!! Form::label('user_id', 'User', ['class' => 'col-md-3 control-label']) !!}
            {!! Form::select('user_id', $user, $item->user_id, ['class' => 'select2']) !!}
            
            <p class="help-block"></p>
            @if($errors->has('user_id'))
                <p class="help-block">
                    {{ $errors->first('user_id') }}
                </p>
            @endif
        </div>
        <div class="col-md-1 col-sm-1 text-left">
        @can('create', \App\Models\User::class)
            @if ((!isset($hide_new)) || ($hide_new!='true'))
                <a href='{{ route('modal.user') }}' data-toggle="modal"  data-target="#createModal" data-select='assigned_user_select' class="btn btn-sm btn-default">New</a>
            @endif
        @endcan
    </div>
    </div> 