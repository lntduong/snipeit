@extends('layouts/default')

{{-- Page title --}}
@section('title')
{{ trans('general.score_report') }} 
@parent
@stop

{{-- Page content --}}
@section('content')

<div class="row">
    <div class="col-md-12">
        <div class="box box-default">
            <div class="box-body">

                <table
                        data-cookie-id-table="activityReport"
                        data-pagination="true"
                        data-id-table="activityReport"
                        data-search="true"
                        data-side-pagination="server"
                        data-show-columns="true"
                        data-show-export="true"
                        data-show-refresh="true"
                        data-sort-order="desc"
                        data-sort-name="created_at"
                        id="activityReportScore"
                        data-url="{{ route('api.score.index') }}"
                        data-mobile-responsive="true"
                        data-toggle="table"
                        class="table table-striped snipe-table"
                        data-export-options='{
                        "fileName": "score-report-{{ date('Y-m-d') }}",
                        "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                        }'>

                    <thead>
                        <tr>
                            <th class="col-sm-1" data-field="id">ID</th>
                            <th class="col-sm-2" data-searchable="true" data-formatter="usersLinkObjFormatter" data-field="username" data-sortable="true" >User Name</th>
                            <th class="col-sm-2" data-searchable="true" data-field="score" data-sortable="true" >Score</th>
                            <th class="col-sm-3" data-searchable="false" data-sortable="true" data-field="created_at" data-formatter="dateDisplayFormatter">{{ trans('general.date') }}</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>
@stop


@section('moar_scripts')
@include ('partials.bootstrap-table', ['exportFile' => 'activity-export', 'search' => true])
@stop
