@extends('layouts.default')

{{-- Page title --}}
@section('title')
    {{ trans('admin/inventories/result.title_offline_mode') }}
@parent
@stop

@section('header_right')
<a href="{{ route('inventoryresults_sp_online') }}" class="btn btn-primary text-right">{{ trans('admin/inventories/result.switch_to_online') }}</a>
<a href="{{ URL::previous() }}" class="btn btn-default text-right">{{ trans('general.back') }}</a>
@stop

{{-- Page content --}}

@section('content')

<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#tab-search" data-toggle="tab">{{ trans('admin/inventories/result.title_search_block') }}</a></li>
                <li><a href="#tab-results" data-toggle="tab">{{ trans('admin/inventories/result.title_scan_block') }}</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab-search">
                    <form id="search-form" class="form-horizontal" method="post" autocomplete="off" role="form" enctype="multipart/form-data">
                        <div class="box-body">
                            @section('inputFields')
                                {{-- Company-Name --}}
                                @include ('partials.forms.edit.company-select', ['translated_name' => trans('general.company'), 'fieldname' => 'select_company'])
                                {{-- Store-Name --}}
                                @include ('partials.forms.edit.store-select', ['translated_name' => trans('admin/contracts/table.store'), 'fieldname' => 'select_store'])
                                {{-- Department-Name --}}
                                @include ('partials.forms.edit.department-select', ['translated_name' => trans('general.department'), 'fieldname' => 'select_department','class' => 'department_select'])
                                {{-- Contract-Name --}}
                                @include ('partials.forms.edit.contract-select', ['translated_name' => trans('general.contract'), 'fieldname' => 'select_contract'])
                                {{-- Inventory-Name --}}
                                @include ('partials.forms.edit.inventory-select', ['translated_name' => trans('general.inventory'), 'fieldname' => 'select_inventory'])
                            @stop
                            @yield('inputFields')
                            <hr />
                            <table
                                data-columns="{{ \App\Presenters\InventoryResultPresenter::offlineSearchTableLayout() }}"
                                data-cookie-id-table="tbl-results"
                                data-toolbar="#-tbl-search-toolbar"
                                data-pagination="true"
                                data-search="false"
                                data-toggle="table"
                                data-sort-order="asc"
                                data-sort-name="name"
                                id="tbl-results-search"
                                class="table table-striped snipe-table">
                            </table>
                        </div>
                        <div id="div-save-alert" class="col-md-12">
                            <div class="alert alert-success fade in">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <i class="fa fa-check animated"></i>
                                <strong><span id="save-alert-title"></span></strong>
                                <span id="save-alert-content"></span>
                            </div>
                        </div>
                        <div class="box-footer text-right">
                            <button type="submit" class="btn btn-disabled" id="btn-save" disabled=disabled> {{ trans('admin/inventories/result.save_to_offline') }}</button>
                        </div>
                    </form>
                </div>
                <div class="tab-pane" id="tab-results">
                    <form id="scan-form" class="form-horizontal" method="post" autocomplete="off" role="form" enctype="multipart/form-data">
                        <div class="box-header with-border">
                            <!-- Inventory -->
                            <div id="local_select_inventory" class="form-group">
                                {{ Form::label('local_inventory_select', trans('admin/inventories/result.local_inventory'), array('class' => 'col-md-3 control-label')) }}
                                <div class="col-md-7">
                                    <select class="local_inventory_select" data-endpoint="" data-placeholder="Select Inventory" name="local_inventory_select" style="width: 100%" id="local_inventory_select">
                                        <option value="" selected=selected></option>
                                    </select>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <div class="pull-right">
                                <button type="button" class="btn btn-success" id="btn-batch-submit" disabled=disabled> {{ trans('admin/inventories/result.batch_submit') }}</button>
                            </div>
                            <table
                                data-columns="{{ \App\Presenters\InventoryResultPresenter::scanTableLayout() }}"
                                data-cookie-id-table="tbl-results-scan"
                                data-toolbar="#tbl-scan-toolbar"
                                data-pagination="true"
                                data-id-table="tbl-results-scan"
                                data-search="false"
                                data-toggle="table"
                                data-side-pagination="client"
                                data-sort-order="asc"
                                data-sort-name="name"
                                data-row-style="rowStyle"
                                id="tbl-results-scan"
                                class="table table-striped snipe-table">
                            </table>
                        </div>
                        <div id="div-scan-alert" class="col-md-12">
                            <div class="alert alert-success fade in">
                                <button type="button" class="close" data-dismiss="alert">×</button>
                                <i class="fa fa-check animated"></i>
                                <strong><span id="scan-alert-title"></span></strong>
                                <span id="scan-alert-content"></span>
                            </div>
                        </div>
                        <div class="box-footer text-right">
                            <button type="button" class="btn btn-disabled" id="btn-scan" disabled=disabled> {{ trans('admin/inventories/result.scan') }}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Scanner Modal -->
        <div class="modal fade align-items-center" id="scanner" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">{{ trans('admin/inventories/result.scan_title') }}</h5>
              </div>
              <div class="modal-body">
                  <!-- Camera-->
                  <div id="scanner-stream" class="text-center"><video id="v" autoplay=""></video></div>
                  <!-- Canvas-->
                  <canvas id="qr-canvas"></canvas>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="btn-stop-camera" data-dismiss="modal">{{ trans('admin/inventories/result.close_scanner') }}</button>
                <button type="button" class="btn btn-success" id="btn-switch-camera" onclick="switchCamera()">{{ trans('admin/inventories/result.switch_camera') }}</button>
              </div>
            </div>
          </div>
        </div>
        <!-- Scanner Modal End -->

        <!-- Result Modal -->
        <div class="modal fade align-items-center" id="modal-result" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">{{ trans('admin/hardware/form.tag') }}</h4>
                    </div>

                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group ">
                                <label for="name" class="col-md-3 control-label">{{ trans('admin/hardware/form.tag') }}</label>
                                <div class="col-md-9 col-sm-12">
                                    <input class="form-control" type="text" name="name" id="txt-edit-tag" value="" readonly=readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="status_id" class="col-md-3 control-label">{{ trans('admin/hardware/form.status') }}</label>
                                <div class="col-md-9 col-sm-12">
                                    {{ Form::select('status_id', $statuslabel_list , Input::old('status_id', $item->status_id), array('class'=>'select2 status_id', 'style'=>'width:100%','id'=>'status_select_id')) }}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">{{ trans('button.cancel') }}</button>
                        <button type="button" class="btn btn-primary" id="status-save">{{ trans('general.save') }}</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Result Modal End -->

        <!-- Batch Submit Modal -->
        <div class="modal fade align-items-center" id="batch" role="dialog" data-backdrop="static">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">{{ trans('admin/inventories/result.batch_submit') }}</h4>
                    </div>
                    <div class="modal-body">
                        <div id="div-batch-alert" class="col-md-12">
                            <div class="alert alert-success fade in">
                                <i class="fa fa-check animated"></i>
                                <strong><span id="batch-alert-title">Success</span></strong>
                                <span id="batch-alert-content">dsadsadsadsa</span>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="rm-stored">dsadsadsadsadsadsa</div>
                        <button type="button" class="btn btn-secondary" id="btn-batch-cancel" data-dismiss="modal">{{ trans('admin/inventories/result.no') }}</button>
                        <button type="button" class="btn btn-warning" id="btn-batch-yes">{{ trans('admin/inventories/result.yes') }}</button>
                        <button type="button" class="btn btn-secondary" id="btn-batch-close" data-dismiss="modal">{{ trans('admin/inventories/result.close') }}</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Scanner Modal End -->

    </div>
</div>

<input type="hidden" id="setting-tag" value="{!! $asset_tag !!}" />
<input type="hidden" id="highlight" value="" />

@stop

@section('moar_scripts')
    @include ('partials.bootstrap-table-no-responsive', ['exportFile' => 'components-export', 'search' => true, 'showFooter' => true, 'columns' => \App\Presenters\StorePresenter::dataTableLayout()])
    <script>
    $(".store_select").select2({
          placeholder: '',
          allowClear: true,
          ajax: {
              url: baseUrl + 'api/v1/stores/selectlist',
              dataType: 'json',
              delay: 250,
              headers: {
                  "X-Requested-With": 'XMLHttpRequest',
                  "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
              },
              data: function (params) {
                  var data = {
                      search: params.term,
                      company_id: $("#company_select").val(),
                      page: params.page || 1,
                  };
                  return data;
              },
              processResults: function (data, params) {
                  params.page = params.page || 1;
                  var answer =  {
                      results: data.items,
                      pagination: {
                          more: "false"
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

      $(".department_select").select2({
            placeholder: '',
            allowClear: true,
            ajax: {
                url: baseUrl + 'api/v1/departments/selectlist',
                dataType: 'json',
                delay: 250,
                headers: {
                    "X-Requested-With": 'XMLHttpRequest',
                    "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
                },
                data: function (params) {
                    var data = {
                        search: params.term,
                        company_id: $("#company_select").val(),
                        store_id: $("#store_select").val(),
                        page: params.page || 1,
                    };
                    return data;
                },
                processResults: function (data, params) {
                    params.page = params.page || 1;
                    var answer =  {
                        results: data.items,
                        pagination: {
                            more: "false"
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
            placeholder: '',
            allowClear: true,
            ajax: {
                url: baseUrl + 'api/v1/contracts/selectlist',
                dataType: 'json',
                delay: 250,
                headers: {
                    "X-Requested-With": 'XMLHttpRequest',
                    "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
                },
                data: function (params) {
                    var data = {
                        search: params.term,
                        company:($("#company_select").val() ? $("#company_select").val() : "" ),
                        store:($("#store_select").val() ? $("#store_select").val() : ""),
                        department:($("#department_select").val() ? $("#department_select").val() : ""),
                        page: params.page || 1,
                    };
                    return data;
                },
                processResults: function (data, params) {
                    params.page = params.page || 1;
                    var answer =  {
                        results: data.items,
                        pagination: {
                            more: "false"
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

        $(".inventory_select").select2({
            placeholder: '',
            allowClear: true,
            ajax: {
                url: baseUrl + 'api/v1/inventories/selectlist',
                dataType: 'json',
                delay: 250,
                headers: {
                    "X-Requested-With": 'XMLHttpRequest',
                    "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
                },
                data: function (params) {
                    var data = {
                        search: params.term,
                        company:($("#company_select").val() ? $("#company_select").val() : "" ),
                        store:($("#store_select").val() ? $("#store_select").val() : ""),
                        department:($("#department_select").val() ? $("#department_select").val() : ""),
                        contract:($("#contract_select").val() ? $("#contract_select").val() : ""),
                        page: params.page || 1,
                    };
                    return data;
                },
                processResults: function (data, params) {
                    params.page = params.page || 1;
                    var answer =  {
                        results: data.items,
                        pagination: {
                            more: "false" //(params.page  < data.page_count)
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

        $('#status_select_id').select2();
        $('#local_inventory_select').select2({allowClear: true});
        loadLocalInventories();
        checkCamera();

        // Stop camera stream
        $("#scanner").on('hide.bs.modal', function(){
            stopCamera();
        });
        // localStorage.clear();
        // Submit inventory results search form
        $("#search-form").submit(function(e) {
            e.preventDefault();
            $('#local_inventory_select').val(null).trigger('change');
            $('#tbl-results-scan').bootstrapTable('removeAll');
            resetScanAlert();
            disableScanBtn();
            disableBatchSubmitBtn();
            try {
                let inventoryId = $('#inventory_select').val();
                let inventoryText = $('#inventory_select').select2('data')[0].text;
                let storedIds = localStorage.getItem('inventorieslist');
                if (storedIds === null) {
                    storedIds = '[]';
                }
                storedIds = JSON.parse(storedIds);
                let curIndex = storedIds.findIndex(v => v.id === inventoryId);
                if (curIndex < 0) {
                    storedIds.push({id: inventoryId, text: inventoryText});
                } else {
                    storedIds[curIndex] = {id: inventoryId, text: inventoryText};
                }
                localStorage.setItem('inventorieslist', JSON.stringify(storedIds));
                let results = $('#tbl-results-search').bootstrapTable('getData');
                localStorage.setItem('inventoryresult_' + inventoryId, JSON.stringify(results));
                loadLocalInventories();
                loadSaveAlert('success', '{{ trans('admin/inventories/result.save_results') }} <strong>[' + inventoryText + ']</strong> ' + '{{ trans('admin/inventories/result.save_results_success') }}');
            } catch (e) {
                loadSaveAlert('error', '{{ trans('admin/inventories/result.save_results') }} <strong>[' + inventoryText + ']</strong> ' + '{{ trans('admin/inventories/result.save_results_error') }}');
            }
        });

        // Batch Submit button click
        $('#btn-batch-submit').click(function() {
            disableBatchSubmitBtn();
            let storedInventory = localStorage.getItem('inventoryresult_' + $('#local_inventory_select').val());
            if (storedInventory === null) {
                loadBatchSubmitResult('error', '{{ trans('admin/inventories/result.error_no_data') }}');
                return;
            }
            storedInventory = JSON.parse(storedInventory);
            let deleted = localStorage.getItem('offline_deleted_' + $('#local_inventory_select').val());
            if (deleted === null) deleted = '[]';
            deleted = JSON.parse(deleted);
            if (storedInventory.length === 0 && deleted.length === 0) {
                loadBatchSubmitResult('error', '{{ trans('admin/inventories/result.error_no_data') }}');
                return;
            }

            $.ajax({
                type: "POST",
                url: "{{ route('api.inventoryresults.storebyofflinescan') }}",
                dataType: 'json',
                data: { stored: storedInventory, deleted: deleted, inventory_id: $('#local_inventory_select').val() },
                delay: 250,
                headers: {
                    "X-Requested-With": 'XMLHttpRequest',
                    "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
                },
                success: function(res)
                {
                    loadBatchSubmitResult('success', '<strong>[' + $('#local_inventory_select').select2('data')[0].text + ']</strong> ' + '{{ trans('admin/inventories/result.save_results_success') }}');
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    loadBatchSubmitResult('error', xhr.statusText);
                },
            }).done(function (d) { enableBatchSubmitBtn(); });
        });


        // Clear Storage button click
        $('#btn-batch-yes').click(function() {
            localStorage.removeItem('inventoryresult_' + $('#local_inventory_select').val());
            if (localStorage.getItem('offline_deleted_' + $('#local_inventory_select').val()) !== null)
                localStorage.removeItem('offline_deleted_' + $('#local_inventory_select').val());
            let list = localStorage.getItem('inventorieslist');
            list = JSON.parse(list);
            list = list.filter( el => el.id !== $('#local_inventory_select').val() );
            localStorage.setItem('inventorieslist', JSON.stringify(list));
            loadLocalInventories();
            $('#batch').modal('hide');
        });

        // Scan button click
        $('#btn-scan').click(function() {
            loadCamera();
        });

        // Status save button click
        $('#status-save').click(function() {
            let data = $('#tbl-results-scan').bootstrapTable('getData');
            let index = data.findIndex(a => a.asset_tag === $('#txt-edit-tag').val());
            if (index > -1) {
                if (data[index].status_label === null) data[index].status_label = {};
                if (data[index].checked === null) data[index].checked = {date: null, formatted: null};
                data[index].status_label.id = $('#status_select_id').val();
                data[index].status_label.name = $('#status_select_id').select2('data')[0].text;
                data[index].available_actions = {update: false, delete: true};
                localStorage.setItem('inventoryresult_' + $('#local_inventory_select').val(), JSON.stringify(data));
                loadData(data);
            }
            $('#modal-result').modal('hide');
        });

        // Search form select2 onchange trigger
        $('#search-form select').on('select2:select select2:unselecting', function (e) {
            switch (e.target.id) {
                case 'company_select':
                    $('#store_select').val('');
                    $('#department_select').val('');
                    $('#contract_select').val('');
                    $('#inventory_select').val('');
                    break;
                case 'store_select':
                    $('#department_select').val('');
                    $('#contract_select').val('');
                    $('#inventory_select').val('');
                    break;
                case 'department_select':
                    $('#contract_select').val('');
                    $('#inventory_select').val('');
                    break;
                case 'contract_select':
                    $('#inventory_select').val('');
                    break;
                default:
                    break;
            }
            $('#search-form select').trigger('change');
            disableSaveBtn();
            resetSaveAlert();
        });

        // Inventory unselecting event
        $('#inventory_select').on('select2:unselecting', function (e) {
            $('#inventory_select').val('');
            disableSaveBtn();
            resetSaveAlert();
        });

        // Inventory unselecting event
        $('#inventory_select').on('select2:select', function (e) {
            let inventorId = $('.inventory_select').val();
            let url = '{{ route('api.inventoryresults.showbyscan') }}' + '?inventory_id=' + inventorId;
            $('#tbl-results-search').bootstrapTable('refresh', { url });
            $('#tbl-results-search').on('load-success.bs.table', function () {
                enableSaveBtn();
            });
            $('#tbl-results-search').on('load-error.bs.table', function () {
                disableSaveBtn();
                loadSaveAlert('error', '{{ trans('admin/inventories/result.load_results_failed') }}');
                $('html, body').animate({ scrollTop: $('#div-save-alert').offset().top}, 1000);
            });
        });

        // Local Inventory unselecting event
        $('#local_inventory_select').on('select2:unselecting', function (e) {
            $('#local_inventory_select').val('');
            disableScanBtn();
            disableBatchSubmitBtn();
            resetScanAlert();
            $('#tbl-results-scan').bootstrapTable('removeAll');
            $('#highlight').val('');
        });

        // Inventory unselecting event
        $('#local_inventory_select').on('select2:select', function (e) {
            $('#highlight').val('');
            resetScanAlert();
            let inventorId = $('.local_inventory_select').val();
            let data = localStorage.getItem('inventoryresult_' + inventorId);
            if (data) {
                data = JSON.parse(data);
                loadData(data);
                enableScanBtn();
                enableBatchSubmitBtn();
            } else {
                loadScanAlert('error', '{{ trans('admin/inventories/result.error_no_data') }}');
            }
        });

        // Enable Save button
        function enableSaveBtn() {
            if ($('#inventory_select').val() != null && $('#inventory_select').val() != '') {
                if ($('#btn-save').hasClass('btn-disabled'))
                    $('#btn-save').removeClass('btn-disabled');
                if (!$('#btn-save').hasClass('btn-primary'))
                    $('#btn-save').addClass('btn-primary');
                $('#btn-save').attr('disabled', false);
            }
        }

        // Disable Save button
        function disableSaveBtn() {
            if ($('#btn-save').hasClass('btn-primary'))
                $('#btn-save').removeClass('btn-primary');
            if (!$('#btn-save').hasClass('btn-disabled'))
                $('#btn-save').addClass('btn-disabled');
            $('#btn-save').attr('disabled', true);
        }

        // Enable Scan button
        function enableScanBtn() {
            if ($('#btn-scan').hasClass('btn-disabled'))
                $('#btn-scan').removeClass('btn-disabled');
            if (!$('#btn-scan').hasClass('btn-primary'))
                $('#btn-scan').addClass('btn-primary');
            $('#btn-scan').attr('disabled', false);
        }

        // Dsiable Scan button
        function disableScanBtn() {
            if ($('#btn-scan').hasClass('btn-primary'))
                $('#btn-scan').removeClass('btn-primary');
            if (!$('#btn-scan').hasClass('btn-disabled'))
                $('#btn-scan').addClass('btn-disabled');
            $('#btn-scan').attr('disabled', true);
        }

        // Enable Batch Submit button
        function enableBatchSubmitBtn() {
            if ($('#btn-batch-submit').hasClass('btn-disabled'))
                $('#btn-batch-submit').removeClass('btn-disabled');
            if (!$('#btn-batch-submit').hasClass('btn-success'))
                $('#btn-batch-submit').addClass('btn-success');
            $('#btn-batch-submit').attr('disabled', false);
        }

        // Dsiable Batch Submit button
        function disableBatchSubmitBtn() {
            if ($('#btn-batch-submit').hasClass('btn-success'))
                $('#btn-batch-submit').removeClass('btn-success');
            if (!$('#btn-batch-submit').hasClass('btn-disabled'))
                $('#btn-batch-submit').addClass('btn-disabled');
            $('#btn-batch-submit').attr('disabled', true);
        }

        // Load inventory select list from localStorage
        function loadLocalInventories() {
            let stored = localStorage.getItem('inventorieslist');
            if (stored) {
                $('#local_inventory_select').empty();
                let inventories = JSON.parse(stored);
                inventories.forEach(function(value) {
                    let newOption = new Option(value.text, value.id, false, false);
                    $('#local_inventory_select').append(newOption).trigger('change');
                });
                $('#local_inventory_select').val(null).trigger('change');
            }
            // resetBatchAlert();
            resetScanAlert();
            disableBatchSubmitBtn();
            disableScanBtn();
            $('#tbl-results-scan').bootstrapTable('removeAll');
            $('#highlight').val('');
        }

        // Scan Callback function
        function scanCallback(scannedText) {
            var asset_tag_scanned = scannedText.replace($('#setting-tag').val(), '');
            var dateTime = getDateTime();
            if (scannedText.includes($("#setting-tag").val())) {
                stopCamera();
                $('#highlight').val(asset_tag_scanned);
                $('#scanner').modal('hide');
                let data = $('#tbl-results-scan').bootstrapTable('getData');
                let index = data.findIndex(a => a.asset_tag === asset_tag_scanned);
                if (index > -1) {
                    // localStorage.setItem('offline_tmp_' + data[index].asset_tag, JSON.stringify(data[index]));
                    data[index].checked = {datetime: dateTime, formatted: dateTime};
                    data[index].familiar = (data[index].familiar != null) ? data[index].familiar: 1;
                    data[index].available_actions = {update: false, delete: true};
                } else {
                    index = $('#tbl-results-scan').bootstrapTable('getOptions').totalRows;
                    data.push({
                        id: null,
                        asset_id: null,
                        image: false,
                        asset_tag: asset_tag_scanned,
                        name: null,
                        checked: {datetime: dateTime, formatted: dateTime},
                        familiar: 0,
                        status_label: {id: null, name: null},
                        available_actions: {update: false, delete: true}
                    });
                }
                localStorage.setItem('inventoryresult_' + $('#local_inventory_select').val(), JSON.stringify(data));
                loadData(data);
                $('html, body').animate({ scrollTop: $('#tbl-results-scan tr:contains("' + asset_tag_scanned + '")').offset().top}, 1000);
                alertHtml = '<strong>[' + data[index].asset_tag + ' - ' + (data[index].name ? data[index].name : '') + ']</strong> ' + '{{ trans('admin/inventories/result.save_results_success') }}';
                loadScanAlert('success', alertHtml);
            } else {
                loadCamera();
            }
        }

        // Result Table load data
        async function loadData(data) {
            await $('#tbl-results-scan').bootstrapTable('load', data);
            bindAction();
        }

        // Bind Action
        function bindAction() {
            let alertStatus = '';
            let alertHtml = '';

            $('.status').unbind("click");

            $('.status').bind("click", function() {
                let data = $('#tbl-results-scan').bootstrapTable('getData');
                let index = data.findIndex(a => a.asset_tag === $(this).attr("data-tag"));
                $('#txt-edit-tag').val($(this).attr("data-tag"));
                $('#status_select_id').val(data[index].status_label.id);
                $('#status_select_id').trigger("change");
            });

            $('.asset-clear').unbind("click");

            $('.asset-clear').bind("click", function() {
                event.preventDefault();
                resetSaveAlert();
                let data = $('#tbl-results-scan').bootstrapTable('getData');
                let index = data.findIndex(a => a.asset_tag === $(this).attr("data-tag"));
                if (index > -1) {
                    if (data[index].id) {
                        let deleted = localStorage.getItem('offline_deleted_' + $('#local_inventory_select').val());
                        if (deleted === null) {
                            deleted = '[]';
                        }
                        deleted = JSON.parse(deleted);
                        deleted.push(data[index]);
                        localStorage.setItem('offline_deleted_' + $('#local_inventory_select').val(), JSON.stringify(deleted));
                    }
                    if (data[index].familiar) {
                        data[index].id = null;
                        data[index].checked = null;
                        data[index].familiar = null;
                        data[index].status_label = {id: null, name: null},
                        data[index].available_actions = {update: false, delete: false};
                    } else {
                        data.splice(index, 1);
                    }
                    localStorage.setItem('inventoryresult_' + $('#local_inventory_select').val(), JSON.stringify(data));
                    if ($(this).attr("data-tag") == $('#highlight').val()) {
                        $('#highlight').val('');
                    }
                    loadData(data);
                    alertHtml = '<strong>[' + data[index].asset_tag + ' - ' + data[index].name + ']</strong> ' + '{{ trans('admin/inventories/result.save_results_success') }}';
                    loadScanAlert('success', alertHtml);
                }
            });
        }

        // Load save alert div
        function loadSaveAlert(status, htmlCode) {
            resetSaveAlert();
            switch (status) {
                case 'success':
                    $('#div-save-alert .alert').addClass('alert-success');
                    $('#div-save-alert i').addClass('fa-check');
                    $('#save-alert-title').text('{{ trans('admin/inventories/result.success') }}');
                    $('#save-alert-content').html(htmlCode);
                    break;
                default:
                    $('#div-save-alert .alert').addClass('alert-warning');
                    $('#div-save-alert i').addClass('fa-warning');
                    $('#save-alert-title').text('{{ trans('admin/inventories/result.error') }}');
                    $('#save-alert-content').html(htmlCode);
                    break;
            }
            $('#div-save-alert').show();
        }

        // Load scan alert div
        function loadScanAlert(status, htmlCode) {
            resetScanAlert();
            switch (status) {
                case 'success':
                    $('#div-scan-alert .alert').addClass('alert-success');
                    $('#div-scan-alert i').addClass('fa-check');
                    $('#scan-alert-title').text('{{ trans('admin/inventories/result.success') }}');
                    $('#scan-alert-content').html(htmlCode);
                    break;
                case 'camera_error':
                    $('#div-scan-alert .alert').addClass('alert-warning');
                    $('#div-scan-alert i').addClass('fa-warning');
                    $('#scan-alert-title').text('{{ trans('admin/inventories/result.error') }}');
                    $('#scan-alert-content').html('{{ trans('admin/inventories/result.camera_load_failed') }}');
                    break;
                default:
                    $('#div-scan-alert .alert').addClass('alert-warning');
                    $('#div-scan-alert i').addClass('fa-warning');
                    $('#scan-alert-title').text('{{ trans('admin/inventories/result.error') }}');
                    $('#scan-alert-content').html(htmlCode);
                    break;
            }
            $('#div-scan-alert').show();
        }

        // Load batch submit div
        function loadBatchSubmitResult(status, htmlCode) {
            resetBatchAlert();
            switch (status) {
                case 'success':
                    $('#div-batch-alert .alert').addClass('alert-success');
                    $('#div-batch-alert i').addClass('fa-check');
                    $('#batch-alert-title').text('{{ trans('admin/inventories/result.success') }}');
                    $('#batch-alert-content').html(htmlCode);
                    $('.rm-stored').html('{{ trans('admin/inventories/result.rm_stored') }}');
                    $('#btn-batch-close').hide();
                    $('#btn-batch-cancel').show();
                    $('#btn-batch-yes').show();
                    break;
                default:
                    $('#div-batch-alert .alert').addClass('alert-warning');
                    $('#div-batch-alert i').addClass('fa-warning');
                    $('#batch-alert-title').text('{{ trans('admin/inventories/result.error') }}');
                    $('#batch-alert-content').html(htmlCode);
                    $('.rm-stored').html('');
                    $('#btn-batch-yes').hide();
                    $('#btn-batch-cancel').hide();
                    $('#btn-batch-close').show();
                    break;
            }
            $('#batch').modal('show');
        }

        // Get current datetime YYYY-mm-dd hh:mm:ss
        function getDateTime() {
            var today = new Date(),
                month = '' + (today.getMonth() + 1),
                day = '' + today.getDate(),
                year = today.getFullYear(),
                hours = '' + today.getHours(),
                mins = '' + today.getMinutes(),
                secs = '' + today.getSeconds();
            if (month.length < 2) month = '0' + month;
            if (day.length < 2) day = '0' + day;
            if (hours.length < 2) hours = '0' + hours;
            if (mins.length < 2) mins = '0' + mins;
            if (secs.length < 2) secs = '0' + secs;
            var date = [year, month, day].join('-');
            var time = [hours, mins, secs].join(':');

            return date + ' ' + time;
        }

        // Scan Row highlight
        function rowStyle(row, index) {
            if (row.asset_tag == $("#highlight").val()) {
                return {
                    classes: 'highlight'
                }
            }
            return {
                classes: ''
            }
        }

        // Reset Save Alert Div
        function resetSaveAlert() {
            $('#div-save-alert').hide();
            $('#div-save-alert .alert').removeClass('alert-success alert-warning');
            $('#div-save-alert i').removeClass('fa-check fa-warning');
            $('#save-alert-title').text('');
            $('#save-alert-content').text('');
        }

        // Reset Scan Alert Div
        function resetScanAlert() {
            $('#div-scan-alert').hide();
            $('#div-scan-alert .alert').removeClass('alert-success alert-warning');
            $('#div-scan-alert i').removeClass('fa-check fa-warning');
            $('#scan-alert-title').text('');
            $('#scan-alert-content').text('');
        }

        // Reset Batch Alert Div
        function resetBatchAlert() {
            $('#batch').modal('hide');
            $('#div-batch-alert .alert').removeClass('alert-success alert-warning');
            $('#div-batch-alert i').removeClass('fa-check fa-warning');
            $('#batch-alert-title').text('');
            $('#batch-alert-content').text('');
            $('.rm-stored').html('');
            $('#btn-batch-cancel').hide();
            $('#btn-batch-yes').hide();
            $('#btn-batch-close').hide();
        }

        // Check Device camera
        function checkCamera() {
            if(navigator.mediaDevices && navigator.mediaDevices.enumerateDevices) {
        		try {
        			navigator.mediaDevices.enumerateDevices()
        			.then(function(devices) {
                        devices.forEach(function(device) {
                            if (device.kind === 'videoinput') {
                                if(device.label.toLowerCase().search("back") >-1)
                                    $('#btn-switch-camera').show();
                            }
                        });
                    });
        		} catch(e) {
                    loadScanAlert('camera_error');
        		}
        	}
        }

        // Trigger back button close camera
        if (window.history && window.history.pushState) {
            $('#scanner').on('show.bs.modal', function (e) {
                window.history.pushState('forward', null, './#scanner');
            });

            $(window).on('popstate', function () {
                $('#scanner').modal('hide');
            });
        }

    </script>
@stop

<style>
    #div-results,
    #div-save-alert,
    #div-scan-alert,
    #scanner-stream,
    #qr-canvas {
        display: none;
    }

    #qr-canvas {
        width: 800px;
        height: 600px;
    }

    #v {
        height: 50vh;
    }

    .highlight {
        background-color: #C3D7EB !important;
    }

    .rm-stored {
        text-align: left;
        margin-bottom: 10px;
    }

    #batch .modal-body {
        padding: 15px 15px 0px 15px;
    }

    ul.nav-tabs {
        display: inline-block;
    }

    #btn-batch-submit {
        margin: 10px;
    }

    #scanner .modal-body {
        background-color: black;
    }

    #btn-switch-camera {
        display: none;
    }

    #tbl-results-search, #tbl-results-scan {
        font-size: 10px;
    }

    .row {
        margin-left: -25px !important;
        margin-right: -25px !important;
    }

    .col-md-12 {
        margin-left: 5px !important;
        margin-right: 5px !important;
    }

    #search-form .box-body, #scan-form .box-body {
        padding: 0px !important;
    }

</style>
