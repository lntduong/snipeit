@extends('layouts/default')
{{-- Page title --}}
@section('title')
{{ trans('general.inventory_result') }}
@parent
@stop
@section('header_right')
<a href="{{ URL::previous() }}" class="btn btn-primary pull-right">
{{ trans('general.back') }}</a>
@stop
{{-- Page content --}}
@section('content') 
<div class="row">
   <div class="col-md-12">
      <div class="box">
         <div class="box-body">
            <div class="row">
               <div class="col-md-12">
                    @if($item->id)
                    <div class="box-header with-border">
                        <h3 class="box-title">{{$item->name}}</h3>
                    </div><!-- /.box-header -->
                    @endif
                  <div class="col-md-6">
                    @if(!$item->id)
                     {{-- Company-Name --}}
                     @include ('partials.forms.edit.company-select', ['translated_name' => trans('general.company'), 'fieldname' => 'company_id'])
                     <div style="margin-top:40px">
                     {{-- Store-Name --}}
                     @include ('partials.forms.edit.store-select', ['translated_name' => trans('general.store'), 'fieldname' => 'store_id'])
                     </div>
                     <div style="margin-top:80px">
                     {{-- Department-Name --}}
                     @include ('partials.forms.edit.department-select', ['translated_name' => trans('general.department'), 'fieldname' => 'department_id','class' => 'department_select'])
                     </div>
                     <div style="margin-top:120px">
                     {{-- Contract-Name --}}
                     @include ('partials.forms.edit.contract', ['translated_name' => trans('general.contract'), 'fieldname' => 'assigned_contract'])
                     </div>
                     <div style="margin-top:160px">
                     {{-- Inventory-Name --}}
                     @include ('partials.forms.edit.inventory', ['translated_name' => trans('admin/inventories/table.inventory'), 'fieldname' => 'inventory_id'])
                     </div>
                     @endif
                </div>
                  <!-- /.col -->
                  <table
                     data-columns="{{ \App\Presenters\InventoryResultPresenter::dataTableLayout() }}"
                     data-cookie-id-table="inventoryresultTable"
                     data-toolbar="#toolbar"
                     data-pagination="true"
                     data-id-table="inventoryresultTable"
                     data-search="true"
                     data-side-pagination="server"
                     data-show-columns="true"
                     data-show-export="true"
                     data-show-footer="true"
                     data-show-refresh="true"
                     data-sort-order="asc"
                     data-sort-name="name"
                     id="inventoryresultTable"
                     class="table table-striped snipe-table"
                     data-url="{{ route('api.inventoryresults.index',['inventory_id' => $item->id]) }}"
                     data-export-options='{
                        "fileName": "export-inventory-result-{{ date('Y-m-d') }}",
                        "ignoreColumn": ["actions","image"]
                        }'>
                     
                  </table>
                  <div class="box-footer text-right">
                  <button href='{{ route('modal.inventory-result',['inventory_id'=>$item->id]) }}' data-toggle="modal"  data-target="#createModal" data-select='assigned_user_select' type="button" class="btn btn-success" id="addasset" {{isset($item->id) ? "" : "disabled" }} ><i class=""></i> {{trans('admin/inventories/table.add_unknown_asset')}}</button>
                  </div>
               </div>
               <!-- /.row -->
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
   $table = $('#inventoryresultTable')
   $('#inventory_select').change(function () {
     var inventory_id=$('#inventory_select').val();
     if(inventory_id == null || inventory_id == "")
     {
        $("#addasset").attr("disabled", true);
       var temp = {
       url: '{{ route('api.inventoryresults.index',['inventory_id' => '']) }}'
        };
       $table.bootstrapTable('refresh', temp);
     }
     else
     {
        $("#addasset").removeAttr("disabled");
       var temp = {
       url: '{{ route('api.inventoryresults.index',['inventory_id' => '']) }}' + inventory_id
        };
       $table.bootstrapTable('refresh', temp);
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
   $(".inventory_select").select2({
   
   /**
   * Adds an empty placeholder, allowing every select2 instance to be cleared.
   * This placeholder can be overridden with the "data-placeholder" attribute.
   */
   placeholder: '',
   allowClear: true,
   
   ajax: {
   
     // the baseUrl includes a trailing slash
     url: baseUrl + 'api/v1/inventories/selectlist',
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
             contract_id:($("#contract_select").val() ? $("#contract_select").val() : ""),
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
       $("#inventory_select").html('');
       $("#inventory_select").val("");
   }); 
   $('#store_select').change(function () { 
       $("#contract_select").html('');
       $("#contract_select").val("");
       $("#department_select").html('');
       $("#department_select").val("");
       $("#inventory_select").html('');
       $("#inventory_select").val("");
   }); 
   $('#department_select').change(function () { 
       $("#contract_select").html('');
       $("#contract_select").val("");
       $("#inventory_select").html('');
       $("#inventory_select").val("");
   }); 
   $('#contract_select').change(function () { 
       $("#inventory_select").html('');
       $("#inventory_select").val("");
   });  
</script>
@stop

