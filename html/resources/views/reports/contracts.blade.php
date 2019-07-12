@extends('layouts/default')
{{-- Page title --}}
@section('title')
{{ trans('general.contract_reports') }} 
@parent
@stop
<style>
    .btn-group.reports {
        float:left;
    }
    .col-md-12.form-search-contracts {
        margin-top: 12px;
        width: 450px;
    }
    button#searchContractReport {
        position: absolute;
        bottom: 0;
    }
    div#store_id{
        margin-top: 40px;
    }
    div#contract_id {
        margin-top: 80px;
    }
    table#activityContractReport {
        font-size: 13px;
    }
    button.btn.btn-default {
        height: 35px;
    }
</style>
{{-- Page content --}}
@section('content')

<div class="row">
    <div class="col-md-12">
        <div class="box box-default">
            <div class="box-body">
                <div class="row">
                    <div id="toolbar">
                        <div class="row">
                        <div class="col-md-12">
                            <div class="btn-group reports">
                                <a href="{{ route('reports.activity') }}" type="button" class="btn btn-primary">{{ trans('general.all') }}</a>
                                <a href="{{ route('reports.contracts') }}" type="button" class="active btn btn-primary">{{ trans('general.contracts') }} </a>
                            </div>
                        </div>
                        <div class="row">
                        <div class="col-md-12 form-search-contracts">
                            {{-- Company-Name --}}
                            @include ('partials.forms.edit.company-select', ['translated_name' => trans('general.company'), 'fieldname' => 'company_id'])
                            {{-- Store-Name --}}
                            @include ('partials.forms.edit.store-select-contracts', ['translated_name' =>  trans('general.store') , 'fieldname' => 'store_id'])
                            {{-- Contract-Name --}}
                            @include ('partials.forms.edit.contract', ['translated_name' => trans('general.contract'), 'fieldname' => 'contract_id'])
                            <button id="searchContractReport" class="btn btn-info" onclick="searchContractReport()">Go</button>
                        </div>
                    </div></div>
                    </div>
                </div>
                <table
                        data-cookie-id-table="activityContractReport"
                        data-pagination="true"
                        data-id-table="activityContractReport"
                        data-search="true"
                        data-side-pagination="server"
                        data-show-columns="true"
                        data-show-export="true"
                        data-show-refresh="true"
                        data-sort-order="desc"
                        data-sort-name="created_at"
                        id="activityContractReport"
                        data-url="{{ route('api.activity.index',['contract_type' => 'contract']) }}"
                        data-mobile-responsive="true"
                        data-toggle="table"
                        data-toolbar="#toolbar"
                        class="table table-striped snipe-table"
                        data-export-options='{
                        "fileName": "activity-contract-report-{{ date('Y-m-d') }}",
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
                            <th class="col-sm-1" data-field="note">{{ trans('general.notes') }}</th>
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
   $table = $('#activityContractReport') 
    function searchContractReport() {
        //alert($('.contract_select').val());
        if($('.contract_select').val() == null) {
            $table.bootstrapTable('refresh', {
                url: '{{ route('api.activity.index',['contract_type' => 'contract']) }}'
                
            });
            }
            else if ($('.contract_select').val() == '') {
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
     placeholder: '',
     allowClear: true,
     
     ajax: {
   
         // the baseUrl includes a trailing slash
         url: baseUrl + 'api/v1/store/selectlist',
         dataType: 'json',
         delay: 250,
         headers: {
             "X-Requested-With": 'XMLHttpRequest',
             "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
         },
         data: function (params) {
             var data = {
                 search: params.term,
                 company_id:($("#company_select").val()) ? $("#company_select").val() : "-1",
                 page: params.page || 1,
             };
             return data;
         },
         processResults: function (data, params) {
   
             params.page = params.page || 1;
   
             var answer =  {
                 results: data.items,
                 pagination: {
                     more: "true" //(params.page  < data.page_count)
                 }
             };
   
             return answer;
         },
         cache: true
     },
     escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
     templateResult: formatDatalist,
     templateSelection: formatDataSelection
   });
   $(".contract_select").select2({
   
   /**
   * Adds an empty placeholder, allowing every select2 instance to be cleared.
   * This placeholder can be overridden with the "data-placeholder" attribute.
   */
   placeholder: '',
   allowClear: true,
   
   ajax: {
   
     // the baseUrl includes a trailing slash
     url: baseUrl + 'api/v1/contract/selectlist',
     dataType: 'json',
     delay: 250,
     headers: {
         "X-Requested-With": 'XMLHttpRequest',
         "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
     },
     data: function (params) {
         var data = {
             search: params.term,
             store_id:$("#store_select").val(),
             page: params.page || 1,
         };
         return data;
     },
     processResults: function (data, params) {
   
         params.page = params.page || 1;
   
         var answer =  {
             results: data.items,
             pagination: {
                 more: "true" //(params.page  < data.page_count)
             }
         };
   
         return answer;
     },
     cache: true
   },
   escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
   templateResult: formatDatalist,
   templateSelection: formatDataSelection
   });

    $('#company_select').change(function () { 
        $("#store_select").html('');
        $("#store_select").val('');
        $("#contract_select").html('');
        $("#contract_select").val('');
   }); 
   
   $('#store_select').change(function () { 
       $("#contract_select").html('');
       $("#contract_select").val('');
   }); 
</script>
@stop
