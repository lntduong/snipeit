



@extends('layouts/default') {{-- Page title --}} 
@section('title')
    {{ $department->name }}
    {{ trans('general.department') }}
    @parent
@stop
@section('header_right')
<a href="{{ URL::previous() }}" class="btn btn-primary pull-right">
{{ trans('general.back') }}</a> @stop {{-- Page content --}} @section('content')
<div class="row">
   <div class="col-md-12">
      <div class="nav-tabs-custom">
         <ul class="nav nav-tabs">
            <li class="active">
               <a href="#asset_tab" data-toggle="tab">
               <span class="hidden-lg hidden-md">
               <i class="fa fa-barcode"></i>
               </span>
               <span class="hidden-xs hidden-sm">{{ trans('general.user') }}</span>
               </a>
            </li>
            <li>
               <a href="#licenses_tab" data-toggle="tab">
               <span class="hidden-lg hidden-md">
               <i class="fa fa-floppy-o"></i>
               </span>
               <span class="hidden-xs hidden-sm">{{ trans('general.contract') }}</span>
               </a>
            </li>
         </ul>
         <div class="tab-content">
            <div class="tab-pane fade in active" id="asset_tab">
               <!-- checked out assets table -->
               <div class="table-responsive">
                    <table
                        data-columns="{{ \App\Presenters\UserPresenter::dataTableLayout() }}"
                        data-cookie-id-table="departmentsUsersTable"
                        data-pagination="true"
                        data-id-table="departmentsUsersTable"
                        data-search="true"
                        data-show-footer="true"
                        data-side-pagination="server"
                        data-show-columns="true"
                        data-show-export="true"
                        data-show-refresh="true"
                        data-sort-order="asc"
                        id="departmentsUsersTable"
                        class="table table-striped snipe-table"
                        data-url="{{ route('api.users.index',['department_id'=> $department->id]) }}"
                        data-export-options='{
                        "fileName": "export-departments-{{ str_slug($department->name) }}-{{ date('Y-m-d') }}",
                        "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                        }'>
                    </table>
               </div>
            </div>
            <!-- /asset_tab -->
            <div class="tab-pane" id="licenses_tab">
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
                        data-url="{{ route('api.contracts.index',['department'=> $department->id]) }}">
                        <thead>
                            <tr>
                                <th data-sortable="true" data-field="id" data-visible="false" data-searchable="false">{{ trans('general.id') }}</th>
                                <th data-sortable="true" data-field="name" data-visible="true" data-searchable="true">{{ trans('admin/contracts/table.contract_name') }}</th>
                                <th data-sortable="true" data-field="location_id" data-visible="true" data-searchable="false" data-formatter="locationsLinkObjFormatter">{{ trans('admin/contracts/table.location') }}</th>
                                <th data-sortable="true" data-field="contact_id_1" data-visible="true" data-searchable="false" data-formatter="usersLinkObjFormatter">{{ trans('admin/contracts/table.contact_person1') }}</th>
                                <th data-sortable="true" data-field="contact_id_2" data-visible="true" data-searchable="false" data-formatter="usersLinkObjFormatter">{{ trans('admin/contracts/table.contact_person2') }}</th>
                                <th data-sortable="true" data-field="start_date" data-visible="true" data-searchable="false">{{ trans('admin/contracts/table.start_date') }}</th>
                                <th data-sortable="true" data-field="end_date" data-visible="true" data-searchable="true">{{ trans('admin/contracts/table.end_date') }}</th>
                                <th data-sortable="true" data-field="billing_date" data-visible="true" data-searchable="true" id="billing_date" class="billing_date">{{ trans('admin/contracts/table.billing_date') }}</th>
                                <th data-sortable="true" data-field="payment_date" data-visible="true" data-searchable="true">{{ trans('admin/contracts/table.payment_date') }}</th>
                                <th data-sortable="false" data-formatter="contractsActionsFormatter" data-field="actions" data-searchable="false">{{ trans('table.actions') }}</th>
                            </tr>
                        </thead>
                    </table>
               </div>
            </div>
            <!-- /licenses-tab -->
         </div>
         <!-- /.tab-content -->
      </div>
      <!-- nav-tabs-custom -->
   </div>
</div>
@stop 

@section('moar_scripts')
    @include ('partials.bootstrap-table',
    ['exportFile' => 'departments-users-export',
    'search' => true,
    'columns' => \App\Presenters\UserPresenter::dataTableLayout()
])

@stop


