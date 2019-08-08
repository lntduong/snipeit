<!-- **
 * @author [Duong.LNT]
 * -->
@extends('layouts/default')
@section('title')
  {{ trans('admin/contracts/table.list_billing') }}
@parent
@yield('title0')  @parent
@stop

@section('header_right')
  <a href="{{ route('contracts.index') }}" class="btn btn-info pull-right"></i> {{ trans('admin/contracts/table.all_contracts') }}</a>
@stop

{{-- Page content --}}
@section('content')
<div class="row">
   <div class="col-md-12">
      <div class="box">
         <div class="box-body">
            <div class="row">
               <div class="col-md-3">
                  @if (Input::get('status')!='Deleted')
                  <div id="toolbar">
                     <label style="float: left; margin-top: 7px;"> {{ trans('admin/contracts/table.select_billing_date') }} </label>
                     <div class="col-md-6">
                     <div id="datepicker" style="width: 170px" class="input-group date" data-provide="datepicker" data-date-format="yyyy-mm"  data-autoclose="true">
                      <input type="text" class="form-control" placeholder="{{ trans('general.select_date') }}" name="billing_date" id="billing_date" >
                      <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                    <button type="submit" style="float: right; margin-right: -60px;" class="btn btn-primary" onclick="filterPaymentDate()" >{{ trans('admin/contracts/table.go') }}</button>
                    </div>
                    </div> 
                  </div>
                  @endif
               </div>
               <div class="col-md-12">
                <table
                  data-click-to-select="true"
                  data-columns="{{ \App\Presenters\BillingPresenter::dataTableLayout() }}"
                  data-cookie-id-table="contractsBillingTable"
                  data-pagination="true"
                  data-id-table="contractsBillingTable"
                  data-search="true"
                  data-side-pagination="server"
                  data-show-columns="true"
                  data-show-export="true"
                  data-show-footer="true"
                  data-show-refresh="true"
                  data-sort-order="asc"
                  data-sort-name="name"
                  data-toolbar="#toolbar"
                  id="contractsBillingTable"
                  class="table table-striped snipe-table"
                  data-url="{{ route('api.contracts.index') }}" 
                  data-export-options='{
                              "fileName": "export-billing-contracts-{{ date('Y-m-d') }}",
                              "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
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
<script nonce="{{ csrf_token() }}">
  var $table = $('#contractsBillingTable');
   function filterPaymentDate() {
      $table.bootstrapTable('refresh', {
        url: '{{url('/') }}/api/v1/contracts?billing_date='+$('#billing_date').val()
      });
   }
  $("#datepicker").datepicker( {
    format: "yyyy-mm",
    viewMode: "months", 
    minViewMode: "months",
    autoclose: true,
  });
</script>
@include ('partials.bootstrap-table', ['exportFile' => 'components-export', 'search' => true, 'showFooter' => true, 'columns' => \App\Presenters\ContractPresenter::dataTableLayout()])
@stop
