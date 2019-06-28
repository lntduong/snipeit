@extends('layouts/default')

@section('title')

  {{ trans('admin/contracts/table.contract') }}

@parent
@yield('title0')  @parent
@stop

@section('header_right')
  <a href="{{ route('contracts.create') }}" class="btn btn-primary pull-right"></i> {{ trans('general.create') }}</a>
  <a href="{{ route('getBillingIndex')  }}" class="btn btn-info pull-right"></i> {{ trans('general.billing') }}</a>
@stop

{{-- Page content --}}
@section('content')

<div class="row">
  <div class="col-md-12">
    <div class="box">
      <div class="box-body">
       
          <div class="row">
            <div class="col-md-12">
              
                 <div class="col-md-1" style="padding-top: 5px"><label> {{ trans('admin/contracts/table.contracts_company') }} </label> </div>
                <div class="col-md-2">
                 <select name="company" class="form-control select2" id="company">
                    @foreach ($listCompany as $company)
                    <option value="{{$company->id}}">{{$company->name}}</option>
                    @endforeach
                </select>
                </div>
              
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
    })
</script>

@include ('partials.bootstrap-table', ['exportFile' => 'components-export', 'search' => true, 'showFooter' => true, 'columns' => \App\Presenters\ContractPresenter::dataTableLayout()])


@stop
