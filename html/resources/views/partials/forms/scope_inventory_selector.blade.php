<div class="form-group" id="assignto_selector">
    {{ Form::label('name', trans('general.scope'), array('class' => 'col-md-3 control-label')) }}
    <div class="col-md-8">
        <div class="btn-group" data-toggle="buttons">
            @if ((isset($object_select)) && ($object_select!='false'))
            <label class="btn btn-default {{ ($check=="object")? "active" : "" }}">
                <input name="checkout_inventory_to_type" value="object" type="radio"  {{ ($check=="object")? "checked" : "" }}> {{trans('general.object')}}
            </label>
            @endif
            @if ((isset($location_select)) && ($location_select!='false'))
            <label class="btn btn-default {{ ($check=="location")? "active" : "" }}">
                <input name="checkout_inventory_to_type" value="location" type="radio" {{ ($check=="location")? "checked" : "" }}>{{trans('general.location')}}
            </label>
            @endif
            {!! $errors->first('checkout_inventory_to_type', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
        </div>
    </div>
</div>
