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
                        <select class="js-data-ajax" data-endpoint="companies" data-placeholder="{{ trans('general.select_company') }}" name="company" style="width: 100%" id="company_select">
                            
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
                        
                        <select class="store_select" data-endpoint="store" data-placeholder="Select Store" name="store" style="width: 100%" id="store_select">
                            @foreach ($listStore as $store)
                            <option value="" selected="selected">All</option>
                            <option value="{{$store->id}}">{{$store->name}} </option> 
                            @endforeach
                            
                        </select>
                        
                        </div>
                        
                    </div>
                    <!-- search store -->
                    <div id="search-contract" class="report-contract">
                        <div class="col-md-1" style="padding-top: 5px"><label> Contract </label> </div>
                        <div class="col-md-2">
                        <select class="contract_select" data-endpoint="contract" style="width:100%" data-placeholder="Select Store" id="contract_select" name="contract">
                            
                            @foreach ($listContract as $contract)
                            
                            <option value="{{$contract->id}}">{{$contract->name}}</option>
                            @endforeach
                        </select>
                        </div>
                    </div> 
                    <!-- search contract -->
                    <button id="searchContractReport" class="btn btn-info" onclick="searchContractReport()">Go</button>
                </div>
                <!-- form search -->

                  <table
                    data-advanced-search="true"
                    data-click-to-select="true"
                    data-columns="{{ \App\Presenters\ContractPresenter::dataTableLayout() }}"
                    data-cookie-id-table="contractreportTable"
                    data-pagination="true"
                    data-id-table="contractreportTable"
                    data-search="true"
                    data-side-pagination="server"
                    data-show-columns="true"
                    data-show-export="true"
                    data-show-footer="true"
                    data-show-refresh="true"
                    data-sort-order="asc"
                    data-sort-name="name"
                    data-toolbar="#toolbar"
                    id="contractreportTable"
                    class="table table-striped snipe-table"
                    data-url="{{ route('api.contracts.index') }}" >
                    </table>
                  <div class="box-footer text-right">
                     <button ><i class=""></i> Go</button>
                  </div>
                  </div>
        </div>
    </div>
</div>
@stop
@section('moar_scripts')
@include ('partials.bootstrap-table', ['exportFile' => 'components-export', 'search' => true, 'showFooter' => true, 'columns' => \App\Presenters\StorePresenter::dataTableLayout()])
<script>
   $table = $('#contractreportTable') 

    function searchContractReport() {
        $table.bootstrapTable('refresh', {
            url: '{{url('/') }}/api/v1/contracts?contract='+ $(".contract_select").val()
        });
    }

   $(".store_select").select2({
        ajax: {
            placeholder: "Select a store",
            allowClear: true,
            url: baseUrl + 'api/v1/store/selectlist',
            dataType: 'json',
            delay: 250,
            headers: {
                "X-Requested-With": 'XMLHttpRequest',
                "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
            },
            data: function(params) {
                var data = {
                    company_id: $("#company_select").val(),
                };
                return data;
            },
            processResults: function(data) {
                var answer = {
                    results: data.items,
                    pagination: {
                        more: "true"
                    }
                };
                return answer;
                
            },
        },
    });

    $(".contract_select").select2({

        ajax: {
            url: baseUrl + 'api/v1/contracts/selectlist',
            dataType: 'json',
            delay: 250,
            headers: {
                "X-Requested-With": 'XMLHttpRequest',
                "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
            },
            data: function(params) {
                var data = {
                    store_id: $("#store_select").val(),
                };
                return data;
            },
            processResults: function(data, params) {
                params.page = params.page || 1;
                var answer = {
                    results: data.items,
                    pagination: {
                        more: "true"
                    }
                };

                return answer;
            },
            cache: true
        },
        escapeMarkup: function(markup) {
            return markup;
        }, 
        
        
    });
    $(".company_select").select2({

    ajax: {
        url: baseUrl + 'api/v1/companies/selectlist',
        dataType: 'json',
        delay: 250,
        headers: {
            "X-Requested-With": 'XMLHttpRequest',
            "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
        },
        data: function(params) {
            var data = {
                contract_id: $(".contract_select").val(),
            };
            return data;
        },
        processResults: function(data, params) {
            params.page = params.page || 1;
            var answer = {
                results: data.items,
                pagination: {
                    more: "true"
                }
            };

            return answer;
        },
        cache: true
    },
    escapeMarkup: function(markup) {
        return markup;
    }, 
}); 
</script>
@stop
