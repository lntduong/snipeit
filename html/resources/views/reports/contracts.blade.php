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
                    <div class="row">
                        <div class="col-md-6">
                        
                    <div class="form-group">
                        <div class="col-md-1" style="padding-top: 5px"><label> {{ trans('admin/contracts/table.contracts_company') }} </label> </div>
                        <div class="col-md-3 col-sm-12">
                            <select class="company_select" data-endpoint="companies" data-placeholder="{{ trans('general.select_company') }}" name="company" style="width: 100%" id="company_select">
                                
                                @foreach ($listCompany as $company)
                                <option hidden disabled selected="selected">{{ trans('general.select_company') }}</option>
                                <option value="{{$company->id}}">{{$company->name}}</option>
                                @endforeach
                            </select>
                            <span class="select2-selection__arrow needsclick" role="presentation"><b role="presentation"></b></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-1" style="padding-top: 5px"><label> {{ trans('general.store') }} </label> </div>
                        <div class="col-md-3 col-sm-12">
                            <select class="store_select" data-endpoint="store" data-placeholder="{{ trans('general.select_store') }}" name="store" style="width: 100%" id="store_select">
                                @foreach ($listStore as $store)
                                <option hidden disabled selected="selected">{{ trans('general.select_store') }}</option>
                                <option value="{{$store->id}}">{{$store->name}} </option> 
                                @endforeach
                                
                            </select>
                            <span class="select2-selection__arrow needsclick" role="presentation"><b role="presentation"></b></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-1" style="padding-top: 5px"><label> {{ trans('general.contract') }} </label> </div>
                        <div class="col-md-3 col-sm-12">
                            <select class="contract_select" data-endpoint="contract" style="width:100%" data-placeholder="{{ trans('general.select_contract') }}" id="contract_select" name="contract">
                                
                                @foreach ($listContract as $contract)
                                <option hidden disabled selected="selected">{{ trans('general.select_contract') }}</option>
                                <option value="{{$contract->id}}">{{$contract->name}}</option>
                                @endforeach
                            </select>
                            <span class="select2-selection__arrow needsclick" role="presentation"><b role="presentation"></b></span>
                        </div>
                    </div>
                    <button id="searchContractReport" class="btn btn-info" onclick="searchContractReport()">Go</button>
                    </div>
                    </div>

                <table
                        data-cookie-id-table="activityReport"
                        data-id-table="activityReport"
                        data-search="true"
                        data-side-pagination="server"
                        data-show-columns="true"
                        data-show-export="true"
                        data-show-refresh="true"
                        data-sort-order="desc"
                        data-sort-name="created_at"
                        id="activityReport"
                        data-url="{{ route('api.activity.index') }}"
                        data-mobile-responsive="true"
                        data-toggle="table"
                        class="table table-striped snipe-table"
                        data-export-options='{
                        "fileName": "activity-report-{{ date('Y-m-d') }}",
                        "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                        }'>

                    <thead>
                        <tr>
                            <th data-field="icon" style="width: 40px;" class="hidden-xs" data-formatter="iconFormatter"></th>
                            <th class="col-sm-3" data-searchable="false" data-sortable="true" data-field="created_at" data-formatter="dateDisplayFormatter">{{ trans('general.date') }}</th>
                            <th class="col-sm-2" data-field="admin" data-formatter="usersLinkObjFormatter">{{ trans('general.admin') }}</th>
                            <th class="col-sm-2" data-field="action_type">{{ trans('general.action') }}</th>
                            <th class="col-sm-1" data-field="type" data-formatter="itemTypeFormatter">{{ trans('general.type') }}</th>
                            <th class="col-sm-3" data-field="item" data-formatter="polymorphicItemFormatter">{{ trans('general.item') }}</th>
                            <th class="col-sm-2" data-field="target" data-formatter="polymorphicItemFormatter">To</th>
                            <th class="col-sm-1" data-field="note">{{ trans('general.notes') }}</th>
                            <th class="col-sm-2" data-field="log_meta" data-visible="false" data-formatter="changeLogFormatter">Changed</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
@stop
@section('moar_scripts')
@include ('partials.bootstrap-table', ['exportFile' => 'components-export', 'search' => true, 'showFooter' => true, 'columns' => \App\Presenters\StorePresenter::dataTableLayout()])
<script>
   $table = $('#activityReport') 

    function searchContractReport() {

        if($('#company_select').val() == null && $('#store_select').val() == null && $('#contract_select').val() == null) {
            $table.bootstrapTable('refresh', {
                url: '{{ route('api.activity.index',['contract_type' => 'contract']) }}'
                
            });
            }
            else {
            $table.bootstrapTable('refresh', {
                url: '{{ route('api.activity.index',['contract_id' => '']) }}'+ $(".contract_select").val()
            });
        }
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
