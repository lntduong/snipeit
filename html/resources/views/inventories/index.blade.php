@extends('layouts/default')
{{-- Page title --}}
@section('title')
{{ trans('general.inventory') }}
@parent
@stop
@section('header_right')
@can('create', \App\Models\Component::class)
<a href="{{ route('inventories.create') }}" class="btn btn-primary pull-right"> {{ trans('general.create') }}</a>
@endcan
@stop
{{-- Page content --}}
@section('content')
<div class="row">
   <div class="col-md-12">
      <div class="box">
         <div class="box-body">
            <div class="row">
                
          
       
               <div class="col-md-12">
                    <div class="col-md-5">

                                  @include ('partials.forms.edit.company-select', ['translated_name' => trans('general.company'), 'fieldname' => 'assigned_company'])
                                  <div style="margin-top:40px">
                                  {{-- Store-Name --}}
                                  @include ('partials.forms.edit.store-select', ['translated_name' => trans('general.store'), 'fieldname' => 'assigned_store'])
                                  </div>
                                  <div style="margin-top:80px">
                                  {{-- Department-Name --}}
                                  @include ('partials.forms.edit.department-select', ['translated_name' => trans('general.department'), 'fieldname' => 'assigned_department','class' => 'department_select'])
                                  </div>
                                  <div style="margin-top:120px">
                                  {{-- Contract-Name --}}
                                  @include ('partials.forms.edit.contract', ['translated_name' => trans('general.contract'), 'fieldname' => 'assigned_contract'])
                                  </div>
                             
                              <button style="position:absolute;bottom:0;" type="submit" id="filterCompany" class="btn btn-primary" onclick="filterCompany()">{{ trans('general.go') }}</button>
                        </div>
                  <table
                  data-columns="{{ \App\Presenters\InventoryPresenter::dataTableLayout() }}"
                  data-cookie-id-table="inventoryTable"
                  data-toolbar="#toolbar"
                  data-pagination="true"
                  data-id-table="inventoryTable"
                  data-search="true"
                  data-side-pagination="server"
                  data-show-columns="true"
                  data-show-export="true"
                  data-show-footer="true"
                  data-show-refresh="true"
                  data-sort-order="asc"
                  data-sort-name="name"
                  id="inventoryTable"
                  class="table table-striped snipe-table"
                  data-url="{{ route('api.inventories.index') }}"
                  data-export-options='{
                  "fileName": "export-inventories-{{ date('Y-m-d') }}",
                  "ignoreColumn": ["actions","image"]
                  }'>
                  </table>
               </div>
               <!-- /.col -->
            </div>
            <!-- /.row -->
         </div>
         <!-- /.box-body -->
      </div>
      <!-- /.box -->
   </div>
</div>
@stop
@section('moar_scripts')
@include ('partials.bootstrap-table', ['exportFile' => 'components-export', 'search' => true, 'showFooter' => true, 'columns' => \App\Presenters\StorePresenter::dataTableLayout()])
<script>
   $table = $('#inventoryTable')
    function filterCompany() {
        var company_id=($("#company_select").val() ? $("#company_select").val() : "" );
        var store_id=($("#store_select").val() ? $("#store_select").val() : "");
        var department_id=($("#department_select").val() ? $("#department_select").val() : "");
        var contract_id=($('#contract_select').val() ? $('#contract_select').val() : "");
        if(company_id == "" && store_id == "" && department_id == "" && contract_id == ""){
            var url= '{{ route('api.inventories.index')}}'
        } else {
            if(department_id != ""){
                var url= '{{ route('api.inventories.index',['department_id' => 'department_value','contract_id' => 'contract_value']) }}'; 
                url=url.replace('department_value',department_id);
            } else {
                if(store_id != ""){
                    var url= '{{ route('api.inventories.index',['store_id' => 'store_value','contract_id' => 'contract_value']) }}'; 
                    url=url.replace('store_value',store_id);
                } else {
                    var url= '{{ route('api.inventories.index',['company_id' => 'company_value','contract_id' => 'contract_value']) }}'; 
                    url=url.replace('company_value',company_id);
                
                }
            }
        
           
        }
        url=url.replace('&amp;','&');
        url=url.replace('contract_value',contract_id);
        var temp = {
            url
        }
        $table.bootstrapTable('refresh', temp);
    }
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
               company_id:($("#company_select").val() ? $("#company_select").val() : "" ),
               store_id:($("#store_select").val() ? $("#store_select").val() : ""),
               department_id:($("#department_select").val() ? $("#department_select").val() : ""),
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
       $("#store_select").val("");
       $("#contract_select").html('');
       $("#contract_select").val("");
       $("#department_select").html('');
       $("#department_select").val("");
   }); 
   $('#store_select').change(function () { 
       $("#contract_select").html('');
       $("#contract_select").val("");
       $("#department_select").html('');
       $("#department_select").val("");
   }); 
   $('#department_select').change(function () { 
       $("#contract_select").html('');
       $("#contract_select").val("");
   }); 
</script>
@stop

