<!-- Location -->
<div id="{{ $fieldname }}" class="form-group{{ $errors->has($fieldname) ? ' has-error' : '' }}" {!!  (isset($style_location)) ? ' style="'.e($style_location).'"' : ''  !!}>

    {{ Form::label($fieldname, $translated_name, array('class' => 'col-md-3 control-label')) }}
    <div class="col-md-7{{  ((isset($required) && ($required =='true'))) ?  ' required' : '' }}">
        <select class="js-data-ajax" data-endpoint="locations" data-placeholder="{{ trans('general.select_location') }}" name="{{ $fieldname }}" style="width: 100%" id="{{ $fieldname }}_location_select">
            @if ($location_id = Input::old($fieldname, (isset($item)) ? $item->{$fieldname} : ''))
                <option value="{{ $location_id }}" selected="selected">
                    {{ (\App\Models\Location::find($location_id)) ? \App\Models\Location::find($location_id)->name : '' }}
                </option>
            @else
                <option value="">{{ trans('general.select_location') }}</option>
            @endif
        </select>
    </div>

    {!! $errors->first($fieldname, '<div class="col-md-8 col-md-offset-3"><span class="alert-msg"><i class="fa fa-times"></i> :message</span></div>') !!}

</div>



