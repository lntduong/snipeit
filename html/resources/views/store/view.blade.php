@extends('layouts/default')

{{-- Page title --}}
@section('title')
    {{ $store->name }}
    @parent
@stop

{{-- Page content --}}
@section('content')

    <div class="row">
        <div class="col-md-12">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">


                    <li class="active">
                        <a href="#asset_tab" data-toggle="tab">
                            <span class="hidden-lg hidden-md">
                            <i class="fa fa-barcode"></i>
                            </span>
                            <span class="hidden-xs hidden-sm">{{ trans('general.departments') }}</span>
                        </a>
                    </li>

                    <li>
                        <a href="#licenses_tab" data-toggle="tab">
                            <span class="hidden-lg hidden-md">
                            <i class="fa fa-floppy-o"></i>
                            </span>
                            <span class="hidden-xs hidden-sm">{{ trans('general.licenses') }}</span>
                        </a>
                    </li>

                </ul>

                <div class="tab-content">

                    <div class="tab-pane fade in active" id="asset_tab">
                        <!-- checked out assets table -->
                        <div class="table-responsive">
                            <table
                                data-cookie-id-table="departmentsTable"
                                data-pagination="true"
                                data-id-table="departmentsTable"
                                data-search="true"
                                data-side-pagination="server"
                                data-show-columns="true"
                                data-show-export="true"
                                data-show-refresh="true"
                                data-sort-order="asc"
                                id="departmentsTable"
                                class="table table-striped snipe-table"
                                data-url="{{ route('api.departments.index',['store_id' => $store->id] ) }}"
                                data-export-options='{
                              "fileName": "export-departments-{{ date('Y-m-d') }}",
                              "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                              }'>
                            <thead>
                            <tr>
                                <th data-sortable="true" data-field="id" data-visible="false">{{ trans('general.id') }}</th>
                                <th data-sortable="true" data-field="company" data-visible="false" data-formatter="companiesLinkObjFormatter">{{ trans('general.company') }}</th>
                                <th data-sortable="true" data-formatter="departmentsLinkFormatter" data-field="name" data-searchable="false">{{ trans('admin/departments/table.name') }}</th>
                                <th data-sortable="true" data-field="image" data-visible="false" data-formatter="imageFormatter">{{ trans('general.image') }}</th>
                                <th data-sortable="true" data-formatter="usersLinkObjFormatter" data-field="manager" data-searchable="false">{{ trans('admin/departments/table.manager') }}</th>
                                <th data-sortable="true" data-field="users_count" data-searchable="false">{{ trans('general.users') }}</th>
                                <th data-sortable="true" data-formatter="locationsLinkObjFormatter" data-field="location" data-searchable="false">{{ trans('admin/departments/table.location') }}</th>
                                <th data-sortable="false" data-formatter="departmentsActionsFormatter" data-field="actions" data-searchable="false">{{ trans('table.actions') }}</th>

                            </tr>
                            </thead>
                        </table>
                        </div>
                    </div><!-- /asset_tab -->

                    <div class="tab-pane" id="licenses_tab">
                        <div class="table-responsive">

                            <table
                                    data-columns="{{ \App\Presenters\LicensePresenter::dataTableLayout() }}"
                                    data-cookie-id-table="licensesTable"
                                    data-pagination="true"
                                    data-id-table="licensesTable"
                                    data-search="true"
                                    data-side-pagination="server"
                                    data-show-columns="true"
                                    data-show-export="true"
                                    data-show-refresh="true"
                                    data-sort-order="asc"
                                    id="licensesTable"
                                    class="table table-striped snipe-table"
                                    data-url="{{route('api.licenses.index',['store_id' => $store->id]) }}"
                                    data-export-options='{
                              "fileName": "export-companies-{{ str_slug($store->name) }}-licenses-{{ date('Y-m-d') }}",
                              "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                              }'>
                            </table>

                        </div>
                    </div><!-- /licenses-tab -->

                </div><!-- /.tab-content -->
            </div><!-- nav-tabs-custom -->
        </div>
    </div>

@stop
@section('moar_scripts')
    @include ('partials.bootstrap-table')

@stop

