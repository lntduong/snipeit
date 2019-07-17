@extends('layouts/edit-form', [
    'createText' => trans('admin/departments/table.create') ,
    'updateText' => trans('admin/departments/table.update'),
    'helpTitle' => trans('admin/departments/table.about_locations_title'),
    'helpText' => trans('admin/departments/table.about_locations'),
    'formAction' => ($item) ? route('departments.update', ['department' => $item->id]) : route('departments.store'),
])

{{-- Page content --}}
@section('inputFields')

    @include ('partials.forms.edit.name', ['translated_name' => trans('admin/departments/table.name')])
    <!-- Company -->
    @include ('partials.forms.edit.company-select', ['translated_name' => trans('general.company'), 'fieldname' => 'company_id'])
    <!-- store -->
    @include ('partials.forms.edit.store-select', ['translated_name' => trans('admin/contracts/table.store'), 'fieldname' => 'store_id'])
    <!-- Manager -->
    @include ('partials.forms.edit.user-select', ['translated_name' => trans('admin/users/table.manager'), 'fieldname' => 'manager_id'])
    <!-- Location -->
    @include ('partials.forms.edit.location-select', ['translated_name' => trans('general.location'), 'fieldname' => 'location_id'])
    <!-- Image -->
    @if ($item->image)
        <div class="form-group {{ $errors->has('image_delete') ? 'has-error' : '' }}">
            <label class="col-md-3 control-label" for="image_delete">{{ trans('general.image_delete') }}</label>
            <div class="col-md-5">
                {{ Form::checkbox('image_delete') }}
                <img src="{{ url('/') }}/uploads/departments/{{ $item->image }}" />
                {!! $errors->first('image_delete', '<span class="alert-msg">:message</span>') !!}
            </div>
        </div>
    @endif
    @include ('partials.forms.edit.image-upload')

@stop
@section('moar_scripts')
    <script>
        $('#company_select').change(function () { 
            $("#store_select").html('');
            $("#store_select").val('');
            $("#contract_select").html('');
            $("#contract_select").val('');
       }); 
       $('#store_select').change(function () { 
            $("#contract_select").html('');
            $("#contract_select").val('');
       }); 
    $(".store_select").select2({
       
       /**
        * Adds an empty placeholder, allowing every select2 instance to be cleared.
        * This placeholder can be overridden with the "data-placeholder" attribute.
        */  
       placeholder: '',
       allowClear: true,
       
       ajax: {
   
           // the baseUrl includes a trailing slash
           url: baseUrl + 'api/v1/stores/selectlist',
           dataType: 'json',
           delay: 250,
           headers: {
               "X-Requested-With": 'XMLHttpRequest',
               "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
           },
           data: function (params) {
               var data = {
                   search: params.term,
                   company_id: ($("#company_select").val()) ? $("#company_select").val() : "-1",
                   page: params.page || 1,
               };
               return data;
           },
           processResults: function (data, params) {
   
               params.page = params.page || 1;
   
               var answer =  {
                   results: data.items,
                   pagination: {
                       more: "true" //(params.page  < data.page_count)
                   }
               };
   
               return answer;
           },
           cache: true
       },
       escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
       templateResult: formatDatalist,
       templateSelection: formatDataSelection
   });
    </script>
    @stop

