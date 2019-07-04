@extends('layouts/default')

{{-- Page title --}}
@section('title')
{{ trans('general.contract_reports') }} 
@parent
@stop

{{-- Page content --}}
@section('content')

<div class="row">
    <div class="col-md-12">
        <div class="box box-default">
            <div class="box-body">
                <a href="{{ route('reports.activity') }}" type="button" class="btn btn-primary">Activity Reports</a>
                <a href="{{ route('reports.contracts') }}" type="button" class="btn btn-warning">Contract Reports</a>
                <div class="form_search">
                    <div id="search-company" class="report-contract">
                        <div class="col-md-1" style="padding-top: 5px"><label> {{ trans('admin/contracts/table.contracts_company') }} </label> </div>
                        <div class="col-md-2">
                        <select name="company" class="form-control select2" id="company">
                            <option value="">All</option>
                            @foreach ($listCompany as $company)
                            <option value="{{$company->id}}">{{$company->name}}</option>
                            @endforeach
                        </select>
                        </div>
                    </div>
                    <!-- search company -->
                    <div id="search-store"  class="report-contract">
                        <div class="col-md-1" style="padding-top: 5px"><label> Store </label> </div>
                        <div class="col-md-2">
                        <select name="store" class="form-control select2" id="store">
                            <option value="">All</option>
                            @foreach ($listStore as $store)
                            <option value="{{$store->id}}">{{$store->name}}</option>
                            @endforeach
                        </select>
                        </div>
                    </div>
                    <!-- search store -->
                    <div id="search-contract" class="report-contract">
                        <div class="col-md-1" style="padding-top: 5px"><label> Contract </label> </div>
                        <div class="col-md-2">
                        <select name="contract" class="form-control select2" id="contract">
                            <option value="">All</option>
                            @foreach ($listContract as $contract)
                            <option value="{{$contract->id}}">{{$contract->name}}</option>
                            @endforeach
                        </select>
                        </div>
                    </div> 
                    <!-- search contract -->
                </div>
                <!-- form search -->
                <table
                    data-advanced-search="true"
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
    var $table = $('#contractsTable')
    $(function() {
      $table.bootstrapTable()
      $('#company').change(function () {
        $table.bootstrapTable('refresh', {
            url: '{{url('/') }}/api/v1/contracts?company='+ $('#company').val()
        });
      })

      $('#store').change(function () {
        $table.bootstrapTable('refresh', {
            url: '{{url('/') }}/api/v1/contracts?store='+ $('#store').val()
        });
      })

      $('#contract').change(function () {
        $table.bootstrapTable('refresh', {
            url: '{{url('/') }}/api/v1/contracts?contract='+ $('#contract').val()
        });
      })
    })
</script>
@include ('partials.bootstrap-table', ['exportFile' => 'activity-export', 'search' => true])
@stop
