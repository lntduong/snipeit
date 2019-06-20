<!-- Store -->
<div id="{{ $fieldname }}" class="form-group{{ $errors->has($fieldname) ? ' has-error' : '' }}">
    {{ Form::label($fieldname, $translated_name, array('class' => 'col-md-3 control-label')) }}
    <div class="col-md-7">
        <select class="js-data-ajax" data-endpoint="store" data-placeholder="{{ trans('general.select_store') }}" name="{{ $fieldname }}" style="width: 100%" id="store_select">
            @if ($store = Input::old($fieldname, (isset($item)) ? $item->{$fieldname} : ''))
                <option value="{{ $store }}" selected="selected">
                    {{ (\App\Models\Store::find($store)) ? \App\Models\Store::find($store)->name : '' }}
                </option>
            @else
                <option value="">{{ trans('general.select_store') }}</option>
            @endif
        </select>
    </div>

    {!! $errors->first($fieldname, '<div class="col-md-8 col-md-offset-3"><span class="alert-msg"><i class="fa fa-times"></i> :message</span></div>') !!}

</div>
