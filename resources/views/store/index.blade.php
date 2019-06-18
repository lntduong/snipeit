@extends('layouts/default')

{{-- Page title --}}
@section('title')
  {{ trans('general.store') }}
  @parent
@stop

@section('header_right')
  <a href="{{ route('store.create') }}" class="btn btn-primary pull-right">
    {{ trans('general.create') }}</a>
@stop
{{-- Page content --}}
@section('content')
  <div class="row">
    <div class="col-md-9">
      <div class="box box-default">
        <div class="box-body">
          <div class="table-responsive">

            <table
              data-columns="{{ \App\Presenters\StorePresenter::dataTableLayout() }}" //TODO: fix yet.
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
              data-url="{{ route('api.store.index') }}" //TODO: fix yet
              data-export-options='{
                        "fileName": "export-store-{{ date('Y-m-d') }}",
                        "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                        }'>

            </table>
          </div>
        </div>
      </div>
    </div>
    <!-- side address column -->
    <div class="col-md-3">
      <h4>About store</h4>
      <p>
        You can use store as a simple informative field, or you can use them to restrict asset visibility and availability to users with a specific company by enabling Full Company Support in your Admin Settings.
      </p>
  </div>

@stop

@section('moar_scripts')
  @include ('partials.bootstrap-table')
@stop
