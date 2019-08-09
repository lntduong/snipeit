@extends('layouts/edit-form', [
    'createText' => trans('admin/inventories/table.create'),
    'updateText' => trans('admin/inventories/table.edit'),
    'formAction' => ($item) ? route('inventories.update', ['inventory' => $item->id]) : route('inventories.store'),
    ])
    {{-- Page content --}}
    @section('inputFields')
    
    @include ('partials.forms.scope_inventory_selector', ['object_select' => 'true','location_select' => 'true'])
    {{-- Company-Name --}}
    @include ('partials.forms.edit.company-select', ['translated_name' => trans('general.company'), 'fieldname' => 'company_id', 'required'=>'true'])
    {{-- Store-Name --}}
    @include ('partials.forms.edit.store-select', ['translated_name' => trans('general.store'), 'fieldname' => 'store_id', 'required' => 'true' ])
    {{-- Department-Name --}}
    @include ('partials.forms.edit.department-select', ['translated_name' => trans('general.department'), 'fieldname' => 'department_id', 'required' => 'true','class' => 'department_select'])
    {{-- Contract-Name --}}
    @include ('partials.forms.edit.contract', ['translated_name' => trans('general.contract'), 'fieldname' => 'contract_id','required' => 'true'])
    {{-- Location-Name --}}
    @include ('partials.forms.edit.location-store', ['translated_name' => trans('general.location'),'fieldname' => 'location_id', 'required'=>'true'])
    {{-- Inventory-Name --}}
    @include ('partials.forms.edit.name', ['translated_name' => trans('general.name')])
    {{-- Inventory_date --}}
    @include ('partials.forms.edit.inventories_date')
    {{-- Inventory-Notes --}}
    @include ('partials.forms.edit.notes')
    @stop
    @section('moar_scripts')
    <script>
     
        $('input[name=checkout_inventory_to_type]').on("change",function () {
            var assignto_type = $('input[name=checkout_inventory_to_type]:checked').val();

            if (assignto_type == 'object') {
                $('#company_id').show();
                $('#store_id').show();
                $('#assigned_user').show();
                $('#contract_id').show();
                $('#location_id').hide();
              

            } else if (assignto_type == 'location') {
                $('#company_id').hide();
                $('#store_id').hide();
                $('#assigned_user').hide();
                $('#contract_id').hide();
                $('#location_id').show();
            
        
            }
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
                       company_id: $("#company_select").val(),
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
                   company_id: $("#company_select").val(),
                   store_id: $("#store_select").val(),
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
    
    