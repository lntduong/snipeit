@extends('layouts/default') {{-- Page title --}} @section('title') {{ $store->name }} @parent @stop @section('header_right')
<a href="{{ URL::previous() }}" class="btn btn-primary pull-right">
{{ trans('general.back') }}</a> @stop {{-- Page content --}} @section('content')
<div class="row">
   <div class="col-md-12">
      <div class="nav-tabs-custom">
         <ul class="nav nav-tabs">
            <li class="active">
                     <a href="#contracts_tab" data-toggle="tab">
                     <span class="hidden-lg hidden-md">
                     <i class="fa fa-floppy-o"></i>
                     </span>
                     <span class="hidden-xs hidden-sm">{{ trans('general.contracts') }}</span>
                     </a>
            </li>
            <li >
               <a href="#departments_tab" data-toggle="tab">
               <span class="hidden-lg hidden-md">
               <i class="fa fa-barcode"></i>
               </span>
               <span class="hidden-xs hidden-sm">{{ trans('general.departments') }}</span>
               </a>
            </li>
           
         </ul>
         <div class="tab-content">
            <div class="tab-pane fade in active" id="contracts_tab">
               <!-- checked out assets table -->
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
                        data-url="{{ route('api.contracts.index',['store_id'=>$store->id]) }}"
                        data-export-options='{
                           "fileName": "export-stores-{{ str_slug($store->name) }}-contracts-{{ date('Y-m-d') }}",
                           "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                           }'>
                        <thead>
                              <tr>
                                 <th data-sortable="true" data-field="id" data-visible="false" data-searchable="false">{{ trans('general.id') }}</th>
                                 <th data-sortable="true" data-field="department" data-visible="true" data-searchable="true" data-formatter="departmentsLinkObjFormatter">{{ trans('general.department') }}</th>
                                 <th data-sortable="true" data-field="name" data-visible="true" data-searchable="true" data-formatter="contractsLinkFormatter">{{ trans('admin/contracts/table.contract_name') }}</th>
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
            <!-- /asset_tab -->
            <div class="tab-pane" id="departments_tab">
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
                        data-url="{{ route('api.departments.index',['store_id'=>$store->id]) }}" 
                        data-export-options='{
                        "fileName": "export-stores-{{ str_slug($store->name) }}-departments-{{ date(' Y-m-d ') }}",
                        "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                        }'>
                  <thead>
                     <tr>
                        <th data-sortable="true" data-field="id" data-visible="false">{{ trans('general.id') }}</th>
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
@include ('partials.bootstrap-table') @stop

