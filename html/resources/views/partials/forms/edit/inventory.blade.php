<div id="{{ $fieldname }}" class="form-group{{ $errors->has($fieldname) ? ' has-error' : '' }}">
    {{ Form::label($fieldname, $translated_name, array('class' => 'col-md-3 control-label')) }}
    <div class="col-md-9">
        <select class="inventory_select" data-endpoint="inventory" data-placeholder="{{ trans('general.select_inventory') }}" name="{{ $fieldname }}" style="width: 100%" id="inventory_select">
            @if ($inventory_id = Input::old($fieldname, (isset($item)) ? $item->{$fieldname} : ''))
                <option value="{{ $inventory_id }}" selected="selected">
                    {{ (\App\Models\Inventory::find($inventory_id)) ? \App\Models\Inventory::find($inventory_id)->inventory_date->format('Y/m/d').' - '.\App\Models\Inventory::find($inventory_id)->name : '' }}
                </option>
            @else
                <option value="">{{ trans('general.select_inventory') }}</option>
            @endif
        </select>
    </div>
    {!! $errors->first($fieldname, '<div class="col-md-8 col-md-offset-3"><span class="alert-msg"><i class="fa fa-times"></i> :message</span></div>') !!}

</div>
