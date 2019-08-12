@extends('layouts/default')

{{-- Page title --}}
@section('title')
    {{ $company->name }}
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
                            <span class="hidden-xs hidden-sm">{{ trans('general.assets') }}</span>
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

                    <li>
                        <a href="#accessories_tab" data-toggle="tab">
                            <span class="hidden-lg hidden-md">
                            <i class="fa fa-keyboard-o"></i>
                            </span> <span class="hidden-xs hidden-sm">{{ trans('general.accessories') }}</span>
                        </a>
                    </li>

                    <li>
                        <a href="#consumables_tab" data-toggle="tab">
                            <span class="hidden-lg hidden-md">
                            <i class="fa fa-tint"></i></span>
                            <span class="hidden-xs hidden-sm">{{ trans('general.consumables') }}</span>
                        </a>
                    </li>

                    <li>
                        <a href="#components_tab" data-toggle="tab">
                            <span class="hidden-lg hidden-md">
                            <i class="fa fa-hdd-o"></i></span>
                            <span class="hidden-xs hidden-sm">{{ trans('general.components') }}</span>
                        </a>
                    </li>

                    <li>
                        <a href="#users_tab" data-toggle="tab">
                            <span class="hidden-lg hidden-md">
                            <i class="fa fa-users"></i></span>
                            <span class="hidden-xs hidden-sm">{{ trans('general.people') }}</span>
                        </a>
                    </li>
                    <li>
                            <a href="#contracts_tab" data-toggle="tab">
                            <span class="hidden-lg hidden-md">
                            <i class="fa fa-barcode"></i>
                            </span>
                            <span class="hidden-xs hidden-sm">{{ trans('general.contracts') }}</span>
                            </a>
                    </li>



                </ul>

                <div class="tab-content">

                    <div class="tab-pane fade in active" id="asset_tab">
                        <!-- checked out assets table -->
                        <div class="table-responsive">
                            <table
                                    data-columns="{{ \App\Presenters\AssetPresenter::dataTableLayout() }}"
                                    data-cookie-id-table="assetsListingTable"
                                    data-pagination="true"
                                    data-id-table="assetsListingTable"
                                    data-search="true"
                                    data-side-pagination="server"
                                    data-show-columns="true"
                                    data-show-export="true"
                                    data-show-refresh="true"
                                    data-sort-order="asc"
                                    id="assetsListingTable"
                                    class="table table-striped snipe-table"
                                    data-url="{{route('api.assets.index',['company_id' => $company->id]) }}"
                                    data-export-options='{
                              "fileName": "export-companies-{{ str_slug($company->name) }}-assets-{{ date('Y-m-d') }}",
                              "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                              }'>
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
                                    data-url="{{route('api.licenses.index',['company_id' => $company->id]) }}"
                                    data-export-options='{
                              "fileName": "export-companies-{{ str_slug($company->name) }}-licenses-{{ date('Y-m-d') }}",
                              "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                              }'>
                            </table>

                        </div>
                    </div><!-- /licenses-tab -->

                    <div class="tab-pane" id="accessories_tab">
                        <div class="table-responsive">

                            <table
                                    data-columns="{{ \App\Presenters\AccessoryPresenter::dataTableLayout() }}"
                                    data-cookie-id-table="accessoriesTable"
                                    data-pagination="true"
                                    data-id-table="accessoriesTable"
                                    data-search="true"
                                    data-side-pagination="server"
                                    data-show-columns="true"
                                    data-show-export="true"
                                    data-show-refresh="true"
                                    data-sort-order="asc"
                                    id="accessoriesTable"
                                    class="table table-striped snipe-table"
                                    data-url="{{route('api.accessories.index',['company_id' => $company->id]) }}"
                                    data-export-options='{
                              "fileName": "export-companies-{{ str_slug($company->name) }}-accessories-{{ date('Y-m-d') }}",
                              "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                              }'>
                            </table>

                        </div>
                    </div><!-- /accessories-tab -->

                    <div class="tab-pane" id="consumables_tab">
                        <div class="table-responsive">

                            <table
                                    data-columns="{{ \App\Presenters\ConsumablePresenter::dataTableLayout() }}"
                                    data-cookie-id-table="consumablesTable"
                                    data-pagination="true"
                                    data-id-table="consumablesTable"
                                    data-search="true"
                                    data-side-pagination="server"
                                    data-show-columns="true"
                                    data-show-export="true"
                                    data-show-refresh="true"
                                    data-sort-order="asc"
                                    id="consumablesTable"
                                    class="table table-striped snipe-table"
                                    data-url="{{route('api.consumables.index',['company_id' => $company->id]) }}"
                                    data-export-options='{
                              "fileName": "export-companies-{{ str_slug($company->name) }}-consumables-{{ date('Y-m-d') }}",
                              "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                              }'>
                            </table>

                        </div>
                    </div><!-- /consumables-tab -->

                    <div class="tab-pane" id="components_tab">
                        <div class="table-responsive">

                            <table
                                    data-columns="{{ \App\Presenters\ComponentPresenter::dataTableLayout() }}"
                                    data-cookie-id-table="componentsTable"
                                    data-pagination="true"
                                    data-id-table="componentsTable"
                                    data-search="true"
                                    data-side-pagination="server"
                                    data-show-columns="true"
                                    data-show-export="true"
                                    data-show-refresh="true"
                                    data-sort-order="asc"
                                    id="componentsTable"
                                    class="table table-striped snipe-table"
                                    data-url="{{route('api.components.index',['company_id' => $company->id]) }}"
                                    data-export-options='{
                              "fileName": "export-companies-{{ str_slug($company->name) }}-components-{{ date('Y-m-d') }}",
                              "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                              }'>

                            </table>
                        </div>
                    </div><!-- /consumables-tab -->

                    <div class="tab-pane" id="users_tab">
                        <div class="table-responsive">
                            <table
                                    data-columns="{{ \App\Presenters\UserPresenter::dataTableLayout() }}"
                                    data-cookie-id-table="usersTable"
                                    data-pagination="true"
                                    data-id-table="usersTable"
                                    data-search="true"
                                    data-side-pagination="server"
                                    data-show-columns="true"
                                    data-show-export="true"
                                    data-show-refresh="true"
                                    data-sort-order="asc"
                                    id="usersTable"
                                    class="table table-striped snipe-table"
                                    data-url="{{route('api.users.index',['company_id' => $company->id]) }}"
                                    data-export-options='{
                              "fileName": "export-companies-{{ str_slug($company->name) }}-users-{{ date('Y-m-d') }}",
                              "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                              }'>

                            </table>
                        </div>
                    </div><!-- /consumables-tab -->
                    <div class="tab-pane" id="contracts_tab">
                            <div class="table-responsive">
                               <table 
                                     data-click-to-select="true" 
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
                                     data-url="{{ route('api.contracts.index',['company' => $company->id]) }}"
                                     data-export-options='{
                                        "fileName": "export-contracts-{{ date('Y-m-d') }}",
                                        "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                                        }'>
                                     <thead>
                                           <tr>
                                              <th data-sortable="true" data-field="id" data-visible="false" data-searchable="false">{{ trans('general.id') }}</th>
                                              <th data-sortable="true" data-field="store" data-visible="true" data-searchable="true" data-formatter="storesLinkObjFormatter">{{ trans('general.store') }}</th>
                                              <th data-sortable="true" data-field="department" data-visible="true" data-searchable="true" data-formatter="departmentsLinkObjFormatter">{{ trans('general.department') }}</th>
                                              <th data-sortable="true" data-field="name" data-visible="true" data-searchable="true">{{ trans('admin/contracts/table.contract_name') }}</th>
                                              <th data-sortable="true" data-field="location_id" data-visible="true" data-searchable="false" data-formatter="locationsLinkObjFormatter">{{ trans('admin/contracts/table.location') }}</th>
                                              <th data-sortable="true" data-field="contact_id_1" data-visible="true" data-searchable="false" data-formatter="usersLinkObjFormatter">{{ trans('admin/contracts/table.contact_person1') }}</th>
                                              <th data-sortable="true" data-field="contact_id_2" data-visible="true" data-searchable="false" data-formatter="usersLinkObjFormatter">{{ trans('admin/contracts/table.contact_person2') }}</th>
                                              <th data-sortable="true" data-field="start_date" data-visible="true" data-searchable="false">{{ trans('admin/contracts/table.start_date') }}</th>
                                              <th data-sortable="true" data-field="end_date" data-visible="true" data-searchable="true">{{ trans('admin/contracts/table.end_date') }}</th>
                                              <th data-sortable="true" data-field="billing_date" data-visible="true" data-searchable="true" id="billing_date" class="billing_date">{{ trans('admin/contracts/table.billing_date') }}</th>
                                              <th data-sortable="true" data-field="payment_date" data-visible="true" data-searchable="true">{{ trans('admin/contracts/table.payment') }}</th>
                                              <th data-sortable="false" data-formatter="contractsActionsFormatter" data-field="actions" data-searchable="false">{{ trans('table.actions') }}</th>
                                           </tr>
                                     </thead>
                               </table>
                            </div>
                         </div>




                </div><!-- /.tab-content -->
            </div><!-- nav-tabs-custom -->
        </div>
    </div>

@stop
@section('moar_scripts')
    @include ('partials.bootstrap-table')

@stop

