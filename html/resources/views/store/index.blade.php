@extends('layouts/default')

{{-- Page title --}}
@section('title')
{{trans('admin/store/table.list_store')}}
@parent
@stop

@section('header_right')
  @can('create', \App\Models\Store::class)
    <a href="{{ route('store.create') }}" class="btn btn-primary pull-right"> {{ trans('general.create') }}</a>
  @endcan
@stop

{{-- Page content --}}
@section('content')
<div class="row">
  <div class="col-md-12">
    <div class="box box-default">
      <div class="box-body">
        <table
                data-columns="{{ \App\Presenters\StorePresenter::dataTableLayout() }}"
                data-cookie-id-table="storeTable"
                data-toolbar="#toolbar"
                data-pagination="true"
                data-id-table="storeTable"
                data-search="true"
                data-side-pagination="server"
                data-show-columns="true"
                data-show-export="true"
                data-show-footer="true"
                data-show-refresh="true"
                data-sort-order="asc"
                data-sort-name="name"
                id="storeTable"
                class="table table-striped snipe-table"
                data-url="{{ route('api.store.index') }}"
                data-export-options='{
                "fileName": "export-store-{{ date('Y-m-d') }}",
                "ignoreColumn": ["actions","image","icon"]
                }'>
        </table>
      </div><!-- /.box-body -->
    </div><!-- /.box -->
  </div>
</div>

@stop

@section('moar_scripts')
@include ('partials.bootstrap-table', ['exportFile' => 'store-export', 'search' => true, 'showFooter' => true, 'columns' => \App\Presenters\StorePresenter::dataTableLayout()])



@stop
