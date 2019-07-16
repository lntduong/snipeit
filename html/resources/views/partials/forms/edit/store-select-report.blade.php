
<div id="{{ $fieldname }}" class="form-group{{ $errors->has($fieldname) ? ' has-error' : '' }}">
    {{ Form::label($fieldname, $translated_name, array('class' => 'col-md-3 control-label')) }}
    <div class="col-md-7{{isset($required) ? ((\App\Helpers\Helper::checkIfRequired($item, 'contract_id')) ? ' required' : '') : '' }}">
        <select class="store_select" data-endpoint="store" data-placeholder="Select Store" name="{{ $fieldname }}" style="width: 100%" id="store_select">
            @if ($store_id = Input::old($fieldname, (isset($item)) ? $item->{$fieldname} : ''))
                <option value="{{ $store_id }}" selected="selected">
                    {{ (\App\Models\Store::find($store_id)) ? \App\Models\Store::find($store_id)->name : '' }}
                </option>
            @else
                <option value="">Select Store</option>
            @endif 
        </select>
    </div>
    {!! $errors->first($fieldname, '<div class="col-md-8 col-md-offset-3"><span class="alert-msg"><i class="fa fa-times"></i> :message</span></div>') !!}

</div>