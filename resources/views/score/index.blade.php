@extends('layouts/default')

{{-- Page title --}}
@section('title')
  {{ trans('general.score') }}
  @parent
@stop

@section('header_right')
  <a href="{{ route('score.create') }}" class="btn btn-primary pull-right">
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
              data-columns="{{ \App\Presenters\ScorePresenter::dataTableLayout() }}"
              data-cookie-id-table="scoreTable"
              data-pagination="true"
              data-id-table="scoreTable"
              data-search="true"
              data-side-pagination="server"
              data-show-columns="true"
              data-show-export="true"
              data-show-refresh="true"
              data-sort-order="asc"
              id="scoreTable"
              class="table table-striped snipe-table"
              data-url="{{ route('api.score.index') }}"
              data-export-options='{
                        "fileName": "export-score-{{ date('Y-m-d') }}",
                        "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                        }'>

            </table>
          </div>
        </div>
      </div>
    </div>
    <!-- side address column -->
    <div class="col-md-3">
      <h4>About Score</h4>
      <p>
        You can use score as a simple informative field, or you can use them to restrict asset visibility and availability to users with a specific company by enabling Full Company Support in your Admin Settings.
      </p>
  </div>

@stop

@section('moar_scripts')
  @include ('partials.bootstrap-table')
@stop
