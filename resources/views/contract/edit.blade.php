@extends('layouts/edit-form', [
    'createText' => trans('admin/contracts/table.create') ,
    'updateText' => trans('admin/contracts/table.update'),
    'helpTitle' => trans('admin/contracts/general.about_score_title'),
    'helpText' => trans('admin/contracts/general.about_score_text'),
    'formAction' => ($item) ? route('contract.update', ['contract' => $item->id]) : route('contract.store'),
])

{{-- Page content --}}
@section('inputFields')
<!-- Contract Name -->
  <div class="form-group {{ $errors->has('name') ? ' has-error' : '' }}">
    <label for="contract_name" class="col-md-3 control-label">Contract Name</label>
    <div class="col-md-7 col-sm-12 required">
      <input class="form-control" type="text" name="name" id="contract_name" value="{{ Input::old('contract', $item->name) }}" />
      {!! $errors->first('name', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
    </div>
  </div>
<!-- Store Name -->
 @include ('partials.forms.edit.store-select', ['translated_name' => trans('general.store_name'), 'fieldname' => 'store_id'])
<!-- Location -->
@include ('partials.forms.edit.location-select-store', ['translated_name' => trans('general.location'), 'fieldname' => 'location_id'])
  <!-- Contact Person 1 -->
  @include ('partials.forms.edit.contact-user-1-select', ['translated_name' => trans('general.contact_user_1'), 'fieldname' => 'contact_id_1'])
<!-- Contact Person 2 -->
@include ('partials.forms.edit.contact-user-2-select', ['translated_name' => trans('general.contact_user_2'), 'fieldname' => 'contact_id_2'])
<!-- Start Date -->
@include('partials.forms.edit.common_date')
<!-- Terms and conditions -->
@include('partials.forms.edit.terms_conditons')
<!-- Notes -->
@include('partials.forms.edit.notes')
  @stop
