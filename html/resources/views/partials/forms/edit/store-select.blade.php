<!-- Store -->
<div id="{{ $fieldname }}" class="form-group{{ $errors->has($fieldname) ? ' has-error' : '' }}" {!!  (isset($style)) ? ' style="'.e($style).'"' : ''  !!}>
        {{ Form::label($fieldname, $translated_name, array('class' => 'col-md-3 control-label')) }}
        <div class="col-md-7 {{((isset($required)) && ($required=='true')) ? 'required' : '' }}">
        <select class="{{isset($class) ? $class :'store_select'}}" data-endpoint="{{isset($class) ? 'stores' :''}}" data-placeholder="{{ trans('general.select_store') }}" name="{{ $fieldname }}" style="width: 100%" id="store_select">
                @if ($storeSelect = Input::old($fieldname, (isset($item)) ? $item->{$fieldname} : ''))
                    <option value="{{ $storeSelect }}" selected="selected">
                        {{ (\App\Models\Store::find($storeSelect)) ? \App\Models\Store::find($storeSelect)->name : '' }}
                    </option>
                @else
                    <option value="">{{ trans('admin.store.table.select_store') }}</option>
                @endif
            </select>
        </div>
    
    
        {!! $errors->first($fieldname, '<div class="col-md-8 col-md-offset-3"><span class="alert-msg"><i class="fa fa-times"></i> :message</span></div>') !!}
    
    </div>
    