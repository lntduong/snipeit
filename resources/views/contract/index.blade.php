@extends('layouts/default')

{{-- Page title --}}
@section('title')
  {{ trans('general.contract') }}
  @parent
@stop

@section('header_right')
  <a href="{{ route('contract.create') }}" class="btn btn-primary pull-right">
    {{ trans('general.create') }}</a>
@stop
{{-- Page content --}}
@section('content')
  <div class="row">
    <div class="col-md-12">
      <div class="box box-default">
        <div class="box-body">
          <div class="table-responsive">

            <table
              data-columns="{{ \App\Presenters\ContractPresenter::dataTableLayout() }}" 
              data-cookie-id-table="storeTable"
              data-pagination="true"
              data-id-table="storeTable"
              data-search="true"
              data-side-pagination="server"
              data-show-columns="true"
              data-show-export="true"
              data-show-refresh="true"
              data-sort-order="asc"
              id="storeTable"
              class="table table-striped snipe-table"
              data-url="{{ route('api.contract.index') }}"
              data-export-options='{
                        "fileName": "export-store-{{ date('Y-m-d') }}",
                        "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                        }'>

            </table>
          </div>
        </div>
      </div>
    </div>

@stop

@section('moar_scripts')
  @include ('partials.bootstrap-table')
@stop
