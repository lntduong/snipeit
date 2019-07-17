<!-- Store -->
<div id="{{ $fieldname }}" class="form-group{{ $errors->has($fieldname) ? ' has-error' : '' }}">
        {{ Form::label($fieldname, $translated_name, array('class' => 'col-md-3 control-label')) }}
        <div class="col-md-7 {{  (\App\Helpers\Helper::checkIfRequired($item, $fieldname)) ? ' required' : '' }}">
        <select class="{{isset($class) ? $class :'store_select'}}" data-endpoint="{{isset($class) ? 'stores' :''}}" data-placeholder="{{ trans('admin/store/table.select_store') }}" name="{{ $fieldname }}" style="width: 100%" id="store_select">
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
    