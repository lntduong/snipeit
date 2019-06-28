@extends('layouts/default')

@section('title')

  {{ trans('admin/contracts/table.contract') }}

@parent
@yield('title0')  @parent
@stop

@section('header_right')
  <a href="{{ route('contracts.index') }}" class="btn btn-info pull-right"></i> {{ trans('general.all_contracts') }}</a>
@stop

{{-- Page content --}}
@section('content')

<div class="row">
  <div class="col-md-12">
    <div class="box">
      <div class="box-body">
       
          <div class="row">
            <div class="col-md-12">
              
                 <div class="col-md-2" style="padding-top: 5px"><label> {{ trans('admin/contracts/table.billing_date') }} </label> </div>
                    <div class="col-md-3">
                    <div class="input-group date" style="position: absolute; left: -60px;" data-provide="datepicker" data-date-format="yyyy-mm"  data-autoclose="true">
                        <input type="text" class="form-control" placeholder="{{ trans('general.select_payment_date') }}" name="payment_date" id="payment_date" >
                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                        <button type="submit" style="float: right; margin-right: -3px;" class="btn btn-primary" onclick="filterPaymentDate()">Go</button>
                    </div>
                    
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
    function filterPaymentDate() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("payment_date");
        filter = input.value.toUpperCase();
        table = document.getElementById("contractsTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[7];
            if (td) {
                txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
            }       
        }
    }
    
</script>

@include ('partials.bootstrap-table', ['exportFile' => 'components-export', 'search' => true, 'showFooter' => true, 'columns' => \App\Presenters\ContractPresenter::dataTableLayout()])


@stop
