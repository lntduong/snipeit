@extends('layouts/default')

@section('title')

  {{ trans('admin/contracts/table.list_contract') }}

@parent
@yield('title0')  @parent
@stop

@section('header_right')
  <a href="{{ route('contracts.create') }}" class="btn btn-primary pull-right"></i> {{ trans('general.create') }}</a>
  <a href="{{ route('contracts.billing')  }}" class="btn btn-info pull-right" style="margin-right: 10px;"></i> {{ trans('general.billing_list') }}</a>
@stop

{{-- Page content --}}
@section('content')
<style>
.col-md-7 {
    width: 130%!important;
}
</style>
<div class="row">
    <div class="col-md-12">
        <div class="box box-default">
            <div class="box-body">
                <div class="row">
                    <div id="toolbar">
                        <div class="row">
                        <div class="col-md-12">
                            {{-- Company-Name --}}
                            @include ('partials.forms.edit.company-select', ['translated_name' => trans('general.company'), 'fieldname' => 'company_id'])
                            {{-- Store-Name --}}
                            @include ('partials.forms.edit.store-select-report', ['translated_name' =>  trans('general.store') , 'fieldname' => 'store_id'])
                            {{-- Department-Name --}}
                            @include ('partials.forms.edit.department-select', ['translated_name' => trans('general.department'), 'fieldname' => 'contract_id'])
                            <button type="submit" id="filterCompany" class="btn btn-primary" onclick="filterCompany()">Go</button>
                        </div>
                    </div>
                  </div>
                </div>
                <table
                  data-click-to-select="true"
                  data-columns="{{ \App\Presenters\ContractPresenter::dataTableLayout() }}"
                  data-cookie-id-table="contractsTable"
                  data-pagination="true"
                  data-id-table="contractsTable"
                  data-search="true"
                  data-side-pagination="server"
                  data-show-columns="true"
                  data-show-export="true"
                  data-show-footer="true"
                  data-show-refresh="true"
                  data-sort-order="asc"
                  data-sort-name="name"
                  data-toolbar="#toolbar"
                  id="contractsTable"
                  class="table table-striped snipe-table"
                  data-url="{{ route('api.contracts.index') }}" >
                </table>
            </div>
        </div>
    </div>
</div>
@stop

@section('moar_scripts')
<script nonce="{{ csrf_token() }}">
  var $table = $('#contractsTable');
  function filterCompany() {
    if($('#company_select').val() == null) {
      $table.bootstrapTable('refresh', {
        url: '{{url('/') }}/api/v1/contracts'
      });
    }
    else if($('#store_select').val()) {
      $table.bootstrapTable('refresh', {
        url: '{{url('/') }}/api/v1/contracts?store='+ $('#store_select').val()+'&company=' +$('#company_select').val()
      });
    }
    else {
      $table.bootstrapTable('refresh', {
        url: '{{url('/') }}/api/v1/contracts?company='+ $('#company_select').val()
      });
    }
  }
  $(".store_select").select2({
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
                 company_id:($("#company_select").val()) ? $("#company_select").val() : "-1",
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
        $("#contract_select").html('');
        $("#contract_select").val('');
   }); 
   
   $('#store_select').change(function () { 
       $("#contract_select").html('');
       $("#contract_select").val('');
   }); 
</script> 

@include ('partials.bootstrap-table', ['exportFile' => 'components-export', 'search' => true, 'showFooter' => true, 'columns' => \App\Presenters\ContractPresenter::dataTableLayout()])

<!-- <script>
   $table = $('#contractsTable') 
    function filterCompany() {
      if($('#company_select').val() == null) {
        $table.bootstrapTable('refresh', {
          url: '{{url('/') }}/api/v1/contracts'
        });
      }
      else {
        $table.bootstrapTable('refresh', {
          url: '{{url('/') }}/api/v1/contracts?company='+ $('#company_select').val()
        });
      } 

   $(".store_select").select2({
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
                 company_id:($("#company_select").val()) ? $("#company_select").val() : "-1",
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
</script> -->
@stop
