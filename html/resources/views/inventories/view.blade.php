@extends('layouts/default') {{-- Page title --}} 

@section('title')  
{{ trans('admin/inventories/table.view') }} {{ $item->name }}
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
                     <a href="#details" data-toggle="tab">
                     <span class="hidden-lg hidden-md">
                     <i class="fa fa-floppy-o"></i>
                     </span>
                     <span class="hidden-xs hidden-sm">{{ trans('general.details') }}</span>
                     </a>
            </li>
            <li>
              <a href="#inventory_results" data-toggle="tab">
                <span class="hidden-lg hidden-md">
                  <i class="fa fa-info-circle"></i>
                </span> 
                <span class="hidden-xs hidden-sm">{{ trans('general.inventoryresult_list') }}</span>
              </a>
            </li>
            <li>
                <a href="#history" data-toggle="tab">
                <span class="hidden-lg hidden-md">
                <i class="fa fa-floppy-o"></i>
                </span>
                <span class="hidden-xs hidden-sm">{{ trans('general.history') }}</span>
                </a>
            </li>

           
         </ul>
         <div class="tab-content">
            <div class="tab-pane fade in active" id="details">
               <div class="row">
                 <div class="col-md-8">
                   <div class="table-responsive" style="margin-top: 10px;">
                     <table class="table">
                       <tbody>
                     
                       
                         <tr>
                           <td>{{ trans('general.moreinfo') }}</td>
                           <td>
                             <ul class="list-unstyled" style="line-height: 25px;">
                           @if (($item->object_type == 'App\Models\Location'))
                                 <li><i class="fa fa-map-marker"></i> <a href="{{ url('/locations/' . $item->location->id) }}">{{ $item->location->name}}</a></li>
                           @endif
     
                           @if (($item->object_type == 'App\Models\Company'))
                                 <li><i class="fa fa-building"></i> <a href="{{ url('/companies/' . $item->company->id) }}">{{ $item->company->name}}</a></li>
                            @endif
     
                            @if (($item->object_type == 'App\Models\Store'))
                                 <li><i class="fa fa-archive"></i> <a href="{{ url('/stores/' . $item->store->id) }}">{{ $item->store->name}}</a></li>
                                 <li><i class="fa fa-building"></i> <a href="{{ url('/companies/' . $item->store->company->id) }}">{{ $item->store->company->name}}</a></li>
                            @endif
     
                            @if (($item->object_type == 'App\Models\Department'))
                                 <li><i class="fa fa-building-o"></i> <a href="{{ url('/departments/' . $item->department->id) }}">{{ $item->department->name}}</a></li>
                                 <li><i class="fa fa-archive"></i> <a href="{{ url('/stores/' . $item->department->store->id) }}">{{ $item->department->store->name}}</a></li>
                                 <li><i class="fa fa-building"></i> <a href="{{ url('/companies/' . $item->department->store->company->id) }}">{{ $item->department->store->company->name}}</a></li>
                            @endif

                            @if (($item->object_type == 'App\Models\Contract'))
                                 @if($item->contract->object_type == 'App\Models\Company')
                                    <li><i class="fa fa-file-text-o"></i> <a href="{{ url('/contracts/' . $item->contract->id) }}">{{ $item->contract->name}}</a></li>
                                    <li><i class="fa fa-building"></i> <a href="{{ url('/companies/' . $item->contract->company->id) }}">{{ $item->contract->company->name}}</a></li>
                                 @endif
                                 @if($item->contract->object_type == 'App\Models\Store')
                                    <li><i class="fa fa-file-text-o"></i> <a href="{{ url('/contracts/' . $item->contract->id) }}">{{ $item->contract->name}}</a></li>
                                    <li><i class="fa fa-archive"></i> <a href="{{ url('/stores/' . $item->contract->store->id) }}">{{ $item->contract->store->name}}</a></li>
                                    <li><i class="fa fa-building"></i> <a href="{{ url('/companies/' . $item->contract->store->company->id) }}">{{ $item->contract->store->company->name}}</a></li>
                                 @endif
                                 @if($item->contract->object_type == 'App\Models\Department')
                                    <li><i class="fa fa-file-text-o"></i> <a href="{{ url('/contracts/' . $item->contract->id) }}">{{ $item->contract->name}}</a></li>
                                    <li><i class="fa fa-building-o"></i> <a href="{{ url('/departments/' . $item->contract->department->id) }}">{{ $item->contract->department->name}}</a></li>
                                    <li><i class="fa fa-archive"></i> <a href="{{ url('/stores/' . $item->contract->department->store->id) }}">{{ $item->contract->department->store->name}}</a></li>
                                    <li><i class="fa fa-building"></i> <a href="{{ url('/companies/' . $item->contract->department->store->company->id) }}">{{ $item->contract->department->store->company->name}}</a></li>
                                 @endif
                                
                            @endif

                             </ul>
                           </td>
                         </tr>

                         <tr>
                           <td>{{ trans('general.date') }}</td>
                           <td>
                           {{ \App\Helpers\Helper::getFormattedDateObject($item->inventory_date, 'datetime', false) }}
                           </td>
                         </tr>

                         @if ($item->notes)
                         <tr>
                           <td>{{ trans('general.notes') }}</td>
                           <td> {!! nl2br(e($item->notes)) !!}</td>
                         </tr>
                         @endif

                         @if ($item->created_at!='')
                           <tr>
                             <td>{{ trans('general.created_at') }}</td>
                             <td>
                               {{ \App\Helpers\Helper::getFormattedDateObject($item->created_at, 'datetime', false) }}
                             </td>
                           </tr>
                         @endif
     
                         @if ($item->updated_at!='')
                           <tr>
                             <td>{{ trans('general.updated_at') }}</td>
                             <td>
                               {{ \App\Helpers\Helper::getFormattedDateObject($item->updated_at, 'datetime', false) }}
                             </td>
                           </tr>
                         @endif
     
                       </tbody>
                     </table>
                   </div> <!-- /table-responsive -->
                 </div><!-- /col-md-8 -->
               </div><!-- /row -->
             </div><!-- /.tab-pane inventory details -->
    
            <div class="tab-pane" id="history">
                <!-- checked out inventorys table -->
                <div class="table-responsive">
                  <table
                        data-cookie-id-table="userActivityReport"
                        data-pagination="true"
                        data-id-table="userActivityReport"
                        data-search="true"
                        data-side-pagination="server"
                        data-show-columns="true"
                        data-show-export="true"
                        data-show-refresh="true"
                        data-sort-order="desc"
                        id="userActivityReport"
                        class="table table-striped snipe-table"
                        data-url="{{route('api.activity.index',['inventory' => $item->id]) }}"
                        data-export-options='{
                          "fileName": "my-history-{{ date('Y-m-d') }}",
                          "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                        }'>
                    <thead>
                    <tr>
                      <th data-field="icon" data-visible="true" style="width: 40px;" class="hidden-xs" data-formatter="iconFormatter"></th>
                      <th class="col-sm-2" data-visible="true" data-field="created_at" data-formatter="dateDisplayFormatter">{{ trans('general.date') }}</th>
                      <th class="col-sm-2" data-visible="true" data-field="admin" data-formatter="usersLinkObjFormatter">{{ trans('general.admin') }}</th>
                      <th class="col-sm-2" data-visible="true" data-field="action_type">{{ trans('general.action') }}</th>
                      <th class="col-sm-2" data-visible="true" data-field="item" data-formatter="polymorphicItemFormatter">{{ trans('general.item') }}</th>
                      <th class="col-sm-3" data-field="log_meta" data-visible="true" data-formatter="changeLogFormatter">Changed</th>
                    </tr>
                    </thead>
                  </table>
                </div> <!--.table-responsive-->
            </div> <!-- /.tab-pane history -->

            <div class="tab-pane" id="inventory_results">
               <!-- checked out inventorys table -->
               <div class="row">
                 <div class="col-md-12">
                  <table
                  data-cookie-id-table="inventoryresultTable"
                  data-pagination="true"
                  data-id-table="inventoryresultTable"
                  data-search="true"
                  data-side-pagination="server"
                  data-show-columns="true"
                  data-show-export="true"
                  data-show-refresh="true"
                  data-sort-order="asc"
                  id="inventoryresultTable"
                  class="table table-striped snipe-table"
                  data-url="{{ route('api.inventoryresults.index',['inventory_id' => $item->id]) }}"
                  data-export-options='{
            "fileName": "export-companies--assets-{{ date('Y-m-d') }}",
            "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
            }'>
            <thead>
              <tr>
                      <th class="col-sm-2" data-visible="true" data-field="deviece" data-formatter="inventoryresultsLinkFormatter">{{ trans('admin/hardware/form.name') }}</th>
                      <th class="col-sm-2" data-visible="true" data-field="image" data-formatter="imageFormatter">{{ trans('admin/inventories/table.device_image') }}</th>
                      <th class="col-sm-2" data-visible="true" data-field="asset_tag" data-formatter="inventoryresultsHardwareLinkFormatter">{{ trans('admin/hardware/table.asset_tag') }}</th>
                      <th class="col-sm-2" data-visible="true" data-field="checked" >{{ trans('admin/inventories/table.checked') }}</th>
                      <th class="col-sm-2" data-visible="true" data-field="familiar" data-formatter="RecognizedFormatter">{{ trans('admin/inventories/table.recognized') }}</th>
                      <th class="col-sm-2" data-visible="true" data-field="status_label" data-formatter="statuslabelsLinkObjFormatter">{{ trans('admin/hardware/table.status') }}</th>
                      <th class="col-sm-3" data-visible="true" data-field="actions"  data-formatter="inventoryresultsActionsFormatter">{{ trans('table.actions') }}</th>
              </tr>
              </thead>
          </table>
          <div class="box-footer text-right">
            <button href='{{ route('modal.inventory-result',['inventory_id'=>$item->id]) }}' data-toggle="modal"  data-target="#createModal" data-select='assigned_user_select' type="button" class="btn btn-success" id="addasset" {{isset($item->id) ? "" : "disabled" }} ><i class=""></i> {{trans('admin/inventories/table.add_unknown_asset')}}</button>
          </div>
                 </div>
               </div> <!-- /.row -->

               
             </div> <!-- /.tab-pane history -->
             

         </div>
         <!-- /.tab-content -->
      </div>
      <!-- nav-tabs-custom -->
   </div>
</div>
@stop 
@section('moar_scripts') 
@include ('partials.bootstrap-table') 
<script>
    $table = $('#inventoryresultTable')
    $('#inventory_select').change(function () {
      var inventory_id=$('#inventory_select').val();
      if(inventory_id == null || inventory_id == "")
      {
         $("#addasset").attr("disabled", true);
        var temp = {
        url: '{{ route('api.inventoryresults.index',['inventory_id' => '']) }}'
         };
        $table.bootstrapTable('refresh', temp);
      }
      else
      {
         $("#addasset").removeAttr("disabled");
        var temp = {
        url: '{{ route('api.inventoryresults.index',['inventory_id' => '']) }}' + inventory_id
         };
        $table.bootstrapTable('refresh', temp);
      }
     
    });   
 </script>
@stop

