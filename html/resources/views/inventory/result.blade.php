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
                  <div class="col-md-6">
                     {{-- Company-Name --}}
                     @include ('partials.forms.edit.company-select', ['translated_name' => trans('general.company'), 'fieldname' => 'company_id'])
                     {{-- Store-Name --}}
                     @include ('partials.forms.edit.store', ['translated_name' =>  trans('general.store') , 'fieldname' => 'store_id'])
                     {{-- Contract-Name --}}
                     @include ('partials.forms.edit.contract', ['translated_name' => trans('general.contract'), 'fieldname' => 'contract_id'])
                     {{-- Inventory-Name --}}
                     @include ('partials.forms.edit.inventory', ['translated_name' => trans('admin/inventory/table.inventory'), 'fieldname' => 'inventory_id'])
                  </div>
                  <!-- /.col -->
                  <table
                     data-columns="{{ \App\Presenters\InventoryResultPresenter::dataTableLayout() }}"
                     data-cookie-id-table="inventoryresultTable"
                     data-id-table="inventoryresultTable"
                     data-side-pagination="server"
                     data-show-footer="true"
                     data-sort-order="asc"
                     data-sort-name="name"
                     id="inventoryresultTable"
                     class="table table-striped snipe-table"
                     data-url="{{ route('api.inventoryresult.index',['inventory_id' => $item->inventory_id]) }}"
                     >
                  </table>
                  <div class="box-footer text-right">
                     <button href='{{ route('modal.inventory-result') }}' data-toggle="modal"  data-target="#createModal" data-select='assigned_user_select' type="button" class="btn btn-success" id="addasset"><i class=""></i> Add Unknow Asset</button>
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
     if(inventory_id == null)
     {
       $('#addasset').prop('disabled', true);
     }
     else
     {
       $('#addasset').prop('disabled', false);
     }
     var temp = {
       url: '{{ route('api.inventoryresult.index',['inventory_id' => '']) }}' + inventory_id
     };
     $table.bootstrapTable('refresh', temp);
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
         url: baseUrl + 'api/v1/store/selectlist',
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
     url: baseUrl + 'api/v1/contract/selectlist',
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
   $(".inventory_select").select2({
   
   /**
   * Adds an empty placeholder, allowing every select2 instance to be cleared.
   * This placeholder can be overridden with the "data-placeholder" attribute.
   */
   placeholder: '',
   allowClear: true,
   
   ajax: {
   
     // the baseUrl includes a trailing slash
     url: baseUrl + 'api/v1/inventory/selectlist',
     dataType: 'json',
     delay: 250,
     headers: {
         "X-Requested-With": 'XMLHttpRequest',
         "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
     },
     data: function (params) {
         var data = {
             search: params.term,
             contract_id:$("#contract_select").val(),
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
       $("#contract_select").html('');
       $("#inventory_select").html('');
   }); 
   $('#store_select').change(function () { 
       $("#contract_select").html('');
       $("#contract_select").val('');
       $("#inventory_select").html('');
       $("#inventory_select").val('');
   }); 
   $('#contract_select').change(function () { 
       $("#inventory_select").html('');
       $("#inventory_select").val('');
   }); 
</script>
@stop

