@extends('layouts/default')

@section('title')

  {{ trans('admin/contracts/table.list_contract') }}

@parent
@yield('title0')  @parent
@stop

@section('header_right')
  <a href="{{ route('contracts.create') }}" class="btn btn-primary pull-right"></i> {{ trans('general.create') }}</a>
  <a href="{{ route('getBillingIndex')  }}" class="btn btn-info pull-right" style="margin-right: 10px;"></i> {{ trans('general.billing_list') }}</a>
@stop

{{-- Page content --}}
@section('content')

<div class="row">
   <div class="col-md-12">
      <div class="box">
         <div class="box-body">
            <div class="row">
               <div class="col-md-3">
              <div class="search-company" id="toolbar">
                <div class="col-md-1" style="padding-top: 5px"><label> {{ trans('admin/contracts/table.contracts_company') }} </label> </div>
                <div class="col-md-4" style="margin-left: 35px; width: 215px;">
                  <select class="js-data-ajax" data-endpoint="companies" data-placeholder="{{ trans('general.select_company') }}" name="company" style="width: 100%" id="company">                      
                      @foreach ($listCompany as $company)
                      <option hidden disabled selected="selected">{{ trans('general.select_company') }}</option>
                      <option value="{{$company->id}}">{{$company->name}}</option>
                      @endforeach
                  </select>
                </div>
                <button type="submit" style="margin-right: -3px;" class="btn btn-primary" onclick="filterCompany()" id="filterCompany">Go</button>
                </div>
            
               </div>
               <div class="col-md-12">
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
  var $table = $('#contractsTable');
  function filterCompany() {
    if($('#company').val() == null) {
      $table.bootstrapTable('refresh', {
        url: '{{url('/') }}/api/v1/contracts'
      });
    }
    else {
      $table.bootstrapTable('refresh', {
        url: '{{url('/') }}/api/v1/contracts?company='+ $('#company').val()
      });
    }
  }
</script>

@include ('partials.bootstrap-table', ['exportFile' => 'components-export', 'search' => true, 'showFooter' => true, 'columns' => \App\Presenters\ContractPresenter::dataTableLayout()])


@stop
