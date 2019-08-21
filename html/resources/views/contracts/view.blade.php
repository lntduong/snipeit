@extends('layouts/default')

{{-- Page title --}}
@section('title')
{{ trans('admin/contracts/general.view') }} {{ $item->name }}
@parent
@stop
{{-- Right header --}}
@section('header_right')

@can('manage', \App\Models\Contract::class)
  {{--
<div class="dropdown pull-right">
 <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">{{ trans('button.actions') }}
    <span class="caret"></span>
  </button> 
  
  <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dropdownMenu1">
      @can('update', \App\Models\Contract::class)
    <li role="presentation"><a href="{{ route('contracts.edit', $item->id) }}">{{ trans('admin/contracts/general.edit') }}</a></li>
      @endcan
  </ul>
</div>
--}}

    <div class="col-md-12">
        <a href="{{ route('contracts.edit', $item->id) }}" style="width: 100%;" class="btn btn-sm btn-default hidden-print">{{ trans('admin/contracts/general.edit') }}</a>
    </div>
@endcan
@stop


{{-- Page content --}}
@section('content')

<div class="row">
        <div class="col-md-12">
             <!-- Custom Tabs -->
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#details" data-toggle="tab"><span class="hidden-lg hidden-md"><i class="fa fa-info-circle"></i></span> <span class="hidden-xs hidden-sm">{{ trans('general.details') }}</span></a>
                    </li>
                    <li>
                        <a href="#asset_tab" data-toggle="tab"><span class="hidden-lg hidden-md"><i class="fa fa-info-circle"></i></span> <span class="hidden-xs hidden-sm">{{ trans('general.assets_in_contract') }}</span></a>
                    </li>
                    <li>
                        <a href="#history_contract" data-toggle="tab"><span class="hidden-lg hidden-md"><i class="fa fa-history"></i></span> <span class="hidden-xs hidden-sm">{{ trans('general.history') }}</span></a>
                    </li>
                </ul>
                <!-- Tab-content -->
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="details">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="table-responsive" style="margin-top: 10px;">
                                    <table class="table table-striped">
                                            <tbody>
                                                @if ($item->name)
                                                <tr>
                                                    <td>{{ trans('admin/contracts/table.contract_name') }}</td>
                                                    <td>{{ $item->name }}</td>
                                                </tr>
                                                @endif
                      
                                                @if ($item->object_type == 'App\Models\Company') 
                                                    <tr>
                                                        <td>{{ trans('general.company') }}</td>
                                                        <td><a href="{{ url('/companies/' . $item->company->id) }}">{{ $item->company->name }}</a></td>
                                                    </tr>
                                                @endif

                                                @if ($item->object_type == 'App\Models\Store') 
                                                    <tr>
                                                        <td>{{ trans('general.store') }}</td>
                                                        <td><a href="{{ url('/stores/' . $item->store->id) }}">{{ $item->store->name }}</a></td>
                                                    </tr>
                                                @endif

                                                @if ($item->object_type == 'App\Models\Department') 
                                                    <tr>
                                                        <td>{{ trans('general.department') }}</td>
                                                        <td><a href="{{ url('/departments/' . $item->department->id) }}">{{ $item->department->name }}</a></td>
                                                    </tr>
                                                @endif

                                                @if ($item->location)
                                                    <tr>
                                                    <td>{{ trans('general.location') }}</td>
                                                    <td>
                                                        @can('superuser')
                                                        <i class="fa fa-map-marker"></i> 
                                                        <a href="{{ route('locations.show', ['location' => $item->location->id]) }}">
                                                            {{ $item->location->name }}
                                                        </a>
                                                        @else
                                                        {{ $item->location->name }}
                                                        @endcan
                                                    </td>
                                                    </tr>
                                                @endif

                                                @if ($item->contact_id_1)
                                                    <tr>
                                                    <td>{{ trans('admin/contracts/table.contact_person1') }}</td>
                                                    <td>
                                                        @can('superuser')
                                                            <i class="fa fa-user fa-fw"></i>
                                                            <a href="{{ route('users.show', ['user' => $item->user->id]) }}">
                                                                {{ $item->user->first_name . ' ' . $item->user->last_name}}
                                                            </a>
                                                        @else
                                                            {{ $item->user->first_name . ' ' . $item->user->last_name }}
                                                        @endcan
                                                    </td>
                                                    </tr>
                                                @endif
                                                
                                                @if ($item->contact_id_2)
                                                    <tr>
                                                    <td>{{ trans('admin/contracts/table.contact_person2') }}</td>
                                                    <td>
                                                        @can('superuser')
                                                            <i class="fa fa-user fa-fw"></i>
                                                            <a href="{{ route('users.show', ['user' => $item->user2->id]) }}">
                                                                {{ $item->user2->first_name . ' ' . $item->user2->last_name}}
                                                            </a>
                                                        @else
                                                            {{ $item->user2->first_name . ' ' . $item->user2->last_name }}
                                                        @endcan
                                                    </td>
                                                    </tr>
                                                @endif

                                                @if ($item->start_date!='')
                                                    <tr>
                                                        <td>{{ trans('admin/contracts/table.start_date') }}</td>
                                                        <td>
                                                            {{$item->start_date }}
                                                        </td>
                                                    </tr>
                                                @endif

                                                @if ($item->end_date!='')
                                                    <tr>
                                                        <td>{{ trans('admin/contracts/table.end_date') }}</td>
                                                        <td>
                                                            {{ $item->end_date }}
                                                        </td>
                                                    </tr>
                                                @endif

                                                @if ($item->billing_date!='')
                                                    <tr>
                                                        <td>{{ trans('admin/contracts/table.billing_date') }}</td>
                                                        <td>
                                                            {{ $item->billing_date }}
                                                        </td>
                                                    </tr>
                                                @endif

                                                @if ($item->payment_date!='')
                                                    <tr>
                                                        <td>{{ trans('admin/contracts/table.payment_date') }}</td>
                                                        <td>
                                                            {{ $item->payment_date }}
                                                        </td>
                                                    </tr>
                                                @endif
                      
                                                @if ($item->created_at!='')
                                                    <tr>
                                                        <td>{{ trans('general.created_at') }}</td>
                                                        <td>
                                                            {{ $item->created_at}}
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

                                                @if ($item->terms_and_conditions)
                                                    <tr>
                                                        <td>{{ trans('admin/contracts/table.terms_and_conditions') }}</td>
                                                        <td>{{ $item->terms_and_conditions }}</td>
                                                    </tr>
                                                @endif

                                                @if ($item->notes)
                                                    <tr>
                                                        <td>{{ trans('admin/contracts/table.notes') }}</td>
                                                        <td>{{ $item->notes }}</td>
                                                    </tr>
                                                @endif
                      
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="asset_tab">
                        <!-- checked out assets table -->
                        <div class="table-responsive">
                          <table class="display table table-striped">
                            <thead>
                              <tr>
                                <th class="col-md-3">{{ trans('general.name') }}</th>
                                <th class="col-md-2">{{ trans('admin/hardware/table.asset_tag') }}</th>
                                <th class="col-md-2">{{ trans('admin/hardware/form.serial') }}</th>
                                <th class="col-md-2">{{ trans('admin/hardware/table.asset_model') }}</th>
                                <th class="col-md-2">{{ trans('admin/models/table.modelnumber') }}</th>
                                <th class="col-md-3">{{ trans('general.category') }}</th>
                                <th class="col-md-4">{{ trans('general.location') }}</th>
                                <th class="col-md-3">{{ trans('general.company') }}</th>
                              </tr>
                            </thead>
                            <tbody>
                              @foreach ($item->assets as $asset)
                              <tr>
                                <td>{!! $asset->present()->nameUrl() !!}</td>
                                <td>
                                    @can('view', $asset)
                                        <a href="{{ route('hardware.show', $asset->id) }}">{{ $asset->asset_tag }}</a>
                                    @endcan
                                </td>   
                                <td>
                                    @can('view', $asset)
                                        <a href="{{ route('hardware.show', $asset->id) }}">{{ $asset->serial }}</a>
                                    @endcan
                                </td>                            
                                <td>
                                  @if ($asset->physical=='1')
                                    <a href="{{ route('models.show', $asset->model->id) }}">{{ $asset->model->name }}</a>
                                  @endif
                                </td>
                                <td>
                                    @if ($asset->physical=='1')
                                        {{ $asset->model->model_number }}
                                    @endif
                                </td>
                                <td>
                                    @if ($asset->physical=='1')
                                        <a href="{{ route('categories.show', $asset->model->category->id) }}">{{ $asset->model->category->name }}</a>
                                    @endif
                                </td>
                                <td>
                                    @can('view', $asset)
                                        <a href="{{ route('locations.show', $asset->location->id) }}">{{ $asset->location->name }}</a>
                                    @endcan
                                </td> 
                                <td>
                                    @if ($asset->company_id)
                                        <a href="{{ route('companies.show', $asset->company->id) }}">{{ $asset->company->name }}</a>
                                    @endif
                                </td> 
                              </tr>
                              @endforeach
                            </tbody>
                          </table>
                        </div>
                      </div><!-- /asset_tab -->
                    <div class="tab-pane fade" id="history_contract">
                        <div class="row">
                            <div class="col-md-12">
                                <table
                                    class="table table-striped snipe-table"
                                    id="contractHistory"
                                    data-pagination="true"
                                    data-id-table="contractHistory"
                                    data-search="true"
                                    data-side-pagination="server"
                                    data-show-columns="true"
                                    data-show-refresh="true"
                                    data-sort-order="desc"
                                    data-sort-name="created_at"
                                    data-show-export="true"
                                    data-export-options='{
                                        "fileName": "export-contracts-{{  $item->id }}-history",
                                        "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                                    }'
                                    data-url="{{ route('api.activity.index', ['item_id' => $item->id]) }}"
                                    data-cookie-id-table="contractHistory">
                                    <thead>
                                        <tr>
                                            <th data-field="icon" data-visible="true" style="width: 40px;" class="hidden-xs" data-formatter="iconFormatter"></th>
                                            <th class="col-sm-2" data-visible="true" data-field="created_at" data-formatter="dateDisplayFormatter">{{ trans('general.date') }}</th>
                                            <th class="col-sm-1" data-visible="true" data-field="admin" data-formatter="usersLinkObjFormatter">{{ trans('general.user') }}</th>
                                            <th class="col-sm-1" data-visible="true" data-field="action_type">{{ trans('general.action') }}</th>
                                            <th class="col-sm-1" data-field="type" data-formatter="itemTypeFormatter">{{ trans('general.type') }}</th>
                                            <th class="col-sm-2" data-visible="true" data-field="item" data-formatter="polymorphicItemFormatter">{{ trans('general.item') }}</th>
                                            <th class="col-sm-2" data-field="note">{{ trans('general.notes') }}</th>
                                            @if  ($snipeSettings->require_accept_signature=='1')
                                            <th class="col-md-3" data-field="signature_file" data-visible="false"  data-formatter="imageFormatter">{{ trans('general.signature') }}</th>
                                            @endif
                                            <th class="col-md-3" data-visible="false" data-field="file" data-visible="false"  data-formatter="fileUploadFormatter">{{ trans('general.download') }}</th>
                                            <th class="col-sm-2" data-field="log_meta" data-visible="true" data-formatter="changeLogFormatter">Changed</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Tab-content -->
            </div>
            <!-- Custom Tabs -->
        </div>
</div>

@stop

@section('moar_scripts')
  @include ('partials.bootstrap-table')
@stop