<!-- Inventory -->
<div id="{{ $fieldname }}" class="form-group{{ $errors->has($fieldname) ? ' has-error' : '' }}">
    {{ Form::label($fieldname, $translated_name, array('class' => 'col-md-3 control-label')) }}
    <div class="col-md-7 {{  (\App\Helpers\Helper::checkIfRequired($item, $fieldname)) ? ' required' : '' }}">
    <select class="inventory_select" data-endpoint="" data-placeholder="{{ trans('general.select_inventory') }}" name="{{ $fieldname }}" style="width: 100%" id="inventory_select">
            @if ($inventorySelect = Input::old($fieldname, (isset($item)) ? $item->{$fieldname} : ''))
                <option value="{{ $inventorySelect }}" selected="selected">
                    {{ (\App\Models\Inventory::find($inventorySelect)) ? \App\Models\Inventory::find($inventorySelect)->name : '' }}
                </option>
            @else
                <option value="">{{ trans('general.select_company') }}</option>
            @endif
        </select>
    </div>


    {!! $errors->first($fieldname, '<div class="col-md-8 col-md-offset-3"><span class="alert-msg"><i class="fa fa-times"></i> :message</span></div>') !!}

</div>
