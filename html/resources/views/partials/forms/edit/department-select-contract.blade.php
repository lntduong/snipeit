
<div id="{{ $fieldname }}" style="margin-top:80px" class="form-group{{ $errors->has($fieldname) ? ' has-error' : '' }}">
    {{ Form::label($fieldname, $translated_name, array('class' => 'col-md-3 control-label')) }}
    <div class="col-md-7{{isset($required) ? ((\App\Helpers\Helper::checkIfRequired($item, 'contract_id')) ? ' required' : '') : '' }}">
        <select class="department_select" data-endpoint="departments" data-placeholder="{{ trans('general.select_department') }}" name="{{ $fieldname }}" style="width: 100%" id="department_select">
            @if ($store_id = Input::old($fieldname, (isset($item)) ? $item->{$fieldname} : ''))
                <option value="{{ $department_id }}" selected="selected">
                    {{ (\App\Models\Department::find($department_id)) ? \App\Models\Department::find($department_id)->name : '' }}
                </option>
            @else
                <option value="">Select Department</option>
            @endif 
        </select>
    </div>
    {!! $errors->first($fieldname, '<div class="col-md-8 col-md-offset-3"><span class="alert-msg"><i class="fa fa-times"></i> :message</span></div>') !!}

</div>