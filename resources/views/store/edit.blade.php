@extends('layouts/edit-form', [
    'createText' => trans('admin/store/table.create') ,
    'updateText' => trans('admin/store/table.update'),
    'helpTitle' => trans('admin/store/general.about_score_title'),
    'helpText' => trans('admin/store/general.about_score_text'),
    'formAction' => ($item) ? route('store.update', ['store' => $item->id]) : route('store.store'),
])

{{-- Page content --}}
@section('inputFields')
<!-- Store Name -->
  <div class="form-group {{ $errors->has('name') ? ' has-error' : '' }}">
    <label for="store_name" class="col-md-3 control-label">Store Name</label>
    <div class="col-md-7 col-sm-12 required">
      <input class="form-control" type="text" name="name" id="store_name" value="{{ Input::old('store', $item->name) }}" />
      {!! $errors->first('name', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
    </div>
  </div>
<!-- Company -->
@include ('partials.forms.edit.company-select-store', ['translated_name' => trans('general.company'), 'fieldname' => 'company_id'])
<!-- Location -->
@include ('partials.forms.edit.location-select-store', ['translated_name' => trans('admin/hardware/form.default_location'), 'fieldname' => 'location_id'])

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

@include ('partials.forms.edit.image-upload')
  
@stop
