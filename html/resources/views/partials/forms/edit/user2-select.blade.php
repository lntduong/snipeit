<div id="assigned_user" class="form-group{{ $errors->has($fieldname) ? ' has-error' : '' }}"{!!  (isset($style)) ? ' style="'.e($style).'"' : ''  !!}>

        {{ Form::label($fieldname, $translated_name, array('class' => 'col-md-3 control-label')) }}
    
        <div class="col-md-7">
            <select class="user_select" data-endpoint="users" data-placeholder="{{ trans('general.select_user') }}" name="{{ $fieldname }}" style="width: 100%" id={{$classname}}>
                @if ($user_id = Input::old($fieldname, (isset($item)) ? $item->{$fieldname} : ''))
                    <option value="{{ $user_id }}" selected="selected">
                        {{ (\App\Models\User::find($user_id)) ? \App\Models\User::find($user_id)->present()->fullName : '' }}
                    </option>
                @else
                    <option value="">{{ trans('general.select_user') }}</option>
                @endif
            </select>
        </div>
    
        {!! $errors->first($fieldname, '<div class="col-md-8 col-md-offset-3"><span class="alert-msg"><i class="fa fa-times"></i> :message</span></div>') !!}
    
    </div>
    
