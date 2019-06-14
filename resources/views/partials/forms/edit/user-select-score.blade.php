<div class="row">
    <div class="col-xs-8 form-group {{ $errors->has('score') ? ' has-error' : '' }}">
            {!! Form::label('user_id', 'User', ['class' => 'col-md-3 control-label']) !!}
            <!-- {!! Form::select('user_id', $user, old('user_id'), ['class' => 'select2']) !!} -->
            <select required="required" class="form-control" name="user_id">
                <!-- @if( Input::old('score', $item->user_id) == $key)
                    <option value="{{ $key }}" selected>{{ $user }}</option>
                @else 
                    <option value="{{ $key }}" >{{ $user }}</option>
                @endif -->
                <option value="{{ $key }}" {{ (Input::old("user_id") == $key ? "selected":"") }}>{{ $user }}</option>
            </select>
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