@extends('layouts/edit-form', [
    'createText' => trans('general.create_store') ,
    'updateText' => trans('general.edit_store'),
    'formAction' => ($item) ? route('store.update', ['store' => $item->id]) : route('store.store'),

])

{{-- Page content --}}
@section('inputFields')
{{-- Company --}}
@include ('partials.forms.edit.company-store', ['translated_name' => trans('general.company'), 'fieldname' => 'company_id'])
{{-- Store-Name --}}
@include ('partials.forms.edit.store-name', ['translated_name' => trans('general.store_name')])
{{-- Location --}}
@include ('partials.forms.edit.location-store', ['translated_name' => trans('general.location'),'fieldname' => 'location_id'])
<!-- Image -->
@if ($item->image)
    <div class="form-group {{ $errors->has('image_delete') ? 'has-error' : '' }}">
        <label class="col-md-3 control-label" for="image_delete">{{ trans('general.image_delete') }}</label>
        <div class="col-md-5">
            {{ Form::checkbox('image_delete') }}
            <img src="{{ url('/') }}/uploads/store/{{ $item->image }}" />
            {!! $errors->first('image_delete', '<span class="alert-msg">:message</span>') !!}
        </div>
    </div>
@endif
{{-- image-upload --}}
@include ('partials.forms.edit.image-upload')
@stop
