@extends('layouts/edit-form', [
    'createText' => trans('admin/inventories/table.create'),
    'updateText' => trans('admin/inventories/table.edit'),
    'formAction' => ($item) ? route('inventories.update', ['inventory' => $item->id]) : route('inventories.store'),
    ])
    {{-- Page content --}}
    @section('inputFields')
    
    
    {{-- Company-Name --}}
    @include ('partials.forms.edit.company-select', ['translated_name' => trans('general.company'), 'fieldname' => 'company_id', 'required'=>'true'])
    {{-- Store-Name --}}
    @include ('partials.forms.edit.store-select', ['translated_name' => trans('admin/contracts/table.store'), 'fieldname' => 'store_id', 'required' => 'true' ])
    {{-- Department-Name --}}
    @include ('partials.forms.edit.department-select', ['translated_name' => trans('general.department'), 'fieldname' => 'department_id', 'required' => 'true','class' => 'department_select'])
    {{-- Contract-Name --}}
    @include ('partials.forms.edit.contract', ['translated_name' => trans('general.contract'), 'fieldname' => 'contract_id','required' => 'true'])
    {{-- Inventory-Name --}}
    @include ('partials.forms.edit.name', ['translated_name' => trans('general.name')])
    {{-- Inventory_date --}}
    @include ('partials.forms.edit.inventories_date')
 
    {{-- Inventory-Notes --}}
    @include ('partials.forms.edit.notes')
    @stop
    @section('moar_scripts')
    <script>
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
                       company_id:$("#company_select").val(),
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
       $(".contract_select").select2({
   
   /**
    * Adds an empty placeholder, allowing every select2 instance to be cleared.
    * This placeholder can be overridden with the "data-placeholder" attribute.
    */
   placeholder: '',
   allowClear: true,
   
   ajax: {
   
       // the baseUrl includes a trailing slash
       url: baseUrl + 'api/v1/contracts/selectlist',
       dataType: 'json',
       delay: 250,
       headers: {
           "X-Requested-With": 'XMLHttpRequest',
           "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
       },
       data: function (params) {
           var data = {
               search: params.term,
               company:($("#company_select").val() ? $("#company_select").val() : "" ),
               store:($("#store_select").val() ? $("#store_select").val() : ""),
               department:($("#department_select").val() ? $("#department_select").val() : ""),
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
       $(".department_select").select2({
       
       /**
        * Adds an empty placeholder, allowing every select2 instance to be cleared.
        * This placeholder can be overridden with the "data-placeholder" attribute.
        */
       placeholder: '',
       allowClear: true,
       
       ajax: {
       
           // the baseUrl includes a trailing slash
           url: baseUrl + 'api/v1/departments/selectlist',
           dataType: 'json',
           delay: 250,
           headers: {
               "X-Requested-With": 'XMLHttpRequest',
               "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
           },
           data: function (params) {
               var data = {
                   search: params.term,
                   store_id:$("#store_select").val(),
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
       $('#company_select').change(function () { 
            $("#store_select").html('');
            $("#store_select").val('');
            $("#department_select").html('');
            $("#department_select").val('');
            $("#contract_select").html('');
            $("#contract_select").val('');
       }); 
       $('#store_select').change(function () { 
            $("#department_select").html('');
            $("#department_select").val('');
            $("#contract_select").html('');
            $("#contract_select").val('');
       });
       $('#department_select').change(function () { 
            $("#contract_select").html('');
            $("#contract_select").val('');
       });
    </script>
    @stop
    
    