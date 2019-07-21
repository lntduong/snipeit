<div id="assigned_department" class="form-group{{ $errors->has($fieldname) ? ' has-error' : '' }}"{!!  (isset($style)) ? ' style="'.e($style).'"' : ''  !!}>

    {{ Form::label($fieldname, $translated_name, array('class' => 'col-md-3 control-label')) }}

    <div class="col-md-7{{  ((isset($required) && ($required =='true'))) ?  ' required' : '' }}">
        <select class="department_select" data-endpoint="departments" data-placeholder="{{ trans('general.select_department') }}" name="{{ $fieldname }}" style="width: 100%" id="department_select">
            @if ($department_id = Input::old($fieldname, (isset($item)) ? $item->{$fieldname} : ''))
                <option value="{{ $department_id }}" selected="selected">
                    {{ (\App\Models\Department::find($department_id)) ? \App\Models\Department::find($department_id)->name : '' }}
                </option>
            @else
                <option value="">{{ trans('general.select_department') }}</option>
            @endif
        </select>
    </div>


    {!! $errors->first($fieldname, '<div class="col-md-8 col-md-offset-3"><span class="alert-msg"><i class="fa fa-times"></i> :message</span></div>') !!}

</div>
