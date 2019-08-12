@extends('layouts.default')

{{-- Page title --}}
@section('title')
    {{ trans('admin/inventories/result.title_online_mode') }}
@parent
@stop

@section('header_right')
<a href="{{ route('inventoryresults_sp_offline') }}" class="btn btn-primary text-right">{{ trans('admin/inventories/result.switch_to_offline') }}</a>
<a href="{{ URL::previous() }}" class="btn btn-default text-right">{{ trans('general.back') }}</a>
@stop

{{-- Page content --}}

@section('content')

<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <!-- Search Inventory Block -->
        <div class="box box-default" id="div-search">
            <div class="box-header with-border">
                <h3 class="box-title">
                    {{ trans('admin/inventories/result.title_search_block') }}
                </h3>
                <div class="box-tools pull-right">
                    <button class="slideout-menu-toggle btn btn-box-tool btn-box-tool-lg" data-toggle="tooltip" title="Help"><i class="fa fa-question"></i></button>
                </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <form id="search-form" class="form-horizontal" method="post" autocomplete="off" role="form" enctype="multipart/form-data">
                    {{-- Page content --}}
                    @section('inputFields')
                        {{-- Company-Name --}}
                        @include ('partials.forms.edit.company-select', ['translated_name' => trans('general.company'), 'fieldname' => 'select_company'])
                        {{-- Store-Name --}}
                        @include ('partials.forms.edit.store-select', ['translated_name' => trans('admin/contracts/table.store'), 'fieldname' => 'select_store'])
                        {{-- Department-Name --}}
                        @include ('partials.forms.edit.department-select', ['translated_name' => trans('general.department'), 'fieldname' => 'select_department', 'class' => 'department_select'])
                        {{-- Contract-Name --}}
                        @include ('partials.forms.edit.contract-select', ['translated_name' => trans('general.contract'), 'fieldname' => 'select_contract'])
                        {{-- Inventory-Name --}}
                        @include ('partials.forms.edit.inventory-select', ['translated_name' => trans('general.inventory'), 'fieldname' => 'select_inventory'])
                    @stop
                    <!-- CSRF Token -->
                    {{ csrf_field() }}
                    @yield('inputFields')
                    <div class="box-footer text-right">
                        <button type="submit" class="btn btn-disabled" id="btn-start" disabled=disabled> {{ trans('admin/inventories/result.start') }}</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- Search Inventory Block End -->

        <!-- Inventory Results Block -->
        <div class="box box-default" id="div-results">
            <div class="box-header with-border">
                <h3 class="box-title" id="results-title">
                    {{ trans('admin/inventories/result.default_results_title') }}
                </h3>
                <div class="pull-right">
                    <button type="button" class="btn btn-primary" id="btn-change"> {{ trans('admin/inventories/result.change') }}</button>
                </div>
            </div><!-- /.box-header -->
            <div class="box-body">
                <div class="col-md-12">
                    <table
                        data-columns="{{ \App\Presenters\InventoryResultPresenter::scanTableLayout() }}"
                        data-cookie-id-table="tbl-results"
                        data-toolbar="#toolbar"
                        data-pagination="true"
                        data-id-table="tbl-results"
                        data-search="true"
                        data-sort-order="asc"
                        data-sort-name="name"
                        data-row-style="rowStyle"
                        id="tbl-results"
                        class="table table-striped snipe-table"
                        data-url="">
                    </table>
                </div>
            </div>
            <div id="div-alert" class="col-md-12">
                <div class="alert alert-success fade in">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    <i class="fa fa-check faa-pulse animated"></i>
                    <strong><span id="alert-title"></span></strong>
                    <span id="alert-content"></span>
                </div>
            </div>
            <div class="box-footer text-right">
                <button type="button" class="btn btn-primary" id="btn-scan"> {{ trans('admin/inventories/result.scan') }}</button>
            </div>
        </div>
        <!-- Inventory Results Block End -->
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

    <div class="slideout-menu">
        <a href="#" class="slideout-menu-toggle pull-right">×</a>
        <h3>
            {{ trans('admin/inventories/result.help_title') }}
        </h3>
        <p>{{ trans('admin/inventories/result.help_text') }} </p>
    </div>
</div>

<input type="hidden" id="setting-tag" value="{!! $asset_tag !!}" />
<input type="hidden" id="highlight" value="" />

@stop

@section('moar_scripts')
    @include ('partials.bootstrap-table-no-responsive', ['exportFile' => 'components-export', 'search' => true, 'showFooter' => true, 'columns' => \App\Presenters\StorePresenter::dataTableLayout()])
    <script>
    $("#store_select").select2({
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
                          more: "true"
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

      $("#department_select").select2({
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
                            more: "true"
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

        $("#contract_select").select2({
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
                        company_id: $("#company_select").val(),
                        store_id: $("#store_select").val(),
                        department_id: $("#department_select").val(),
                        page: params.page || 1,
                    };
                    return data;
                },
                processResults: function (data, params) {
                    params.page = params.page || 1;
                    var answer =  {
                        results: data.items,
                        pagination: {
                            more: "true"
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

        $("#inventory_select").select2({
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
                        company_id: $("#company_select").val(),
                        store_id: $("#store_select").val(),
                        department_id: $("#department_select").val(),
                        contract_id: $("#contract_select").val(),
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

        $('#status_select_id').select2();
        checkCamera();

        // Stop camera stream
        $("#scanner").on('hide.bs.modal', function(){
            stopCamera();
        });

        // Submit inventory results search form
        $("#search-form").submit(function(e) {
            e.preventDefault();
            resetAlert();
            var inventory_id = $('.inventory_select').val();
            var url = '{{ route('api.inventoryresults.showbyscan') }}' + '?inventory_id=' + inventory_id;
            $('#results-title').html($('#inventory_select').select2('data')[0].text);
            $('#tbl-results').bootstrapTable('refresh', {  url  });
            $('#tbl-results').on('load-success.bs.table', function () {
                enableScanBtn();
                bindAction();
                $('#div-search').hide();
                $('#div-results').show();
            });
        });

        // Change button click
        $('#btn-change').click(function() {
            $('#div-results').hide();
            $('#div-search').show();
            $('#highlight').val('');
            disableScanBtn();
        });

        // Scan button click
        $('#btn-scan').click(function() {
            loadCamera();
        });

        // Status save button click
        $('#status-save').click(function() {
            let data = $('#tbl-results').bootstrapTable('getData');
            let index = data.findIndex(a => a.asset_tag === $('#txt-edit-tag').val());
            if (index > -1) {
                if (localStorage.getItem('tmp_' + data[index].asset_tag) === null) {
                    if (data[index].available_actions.update == false)
                        localStorage.setItem('tmp_' + data[index].asset_tag, JSON.stringify(data[index]));
                }
                if (data[index].status_label === null) data[index].status_label = {};
                if (data[index].checked === null) data[index].checked = {date: null, formatted: null};
                data[index].status_label.id = $('#status_select_id').val();
                data[index].status_label.name = $('#status_select_id').select2('data')[0].text;
                data[index].available_actions = {update: true, delete: false};
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
            setStartBtn();
        });

        // Inventory unselecting event
        $('#inventory_select').on('select2:unselecting', function (e) {
            $('#inventory_select').val('');
            setStartBtn();
        });

        // Enable/Disable Start button
        function setStartBtn() {
            if ($('#inventory_select').val() != null && $('#inventory_select').val() != '') {
                if ($('#btn-start').hasClass('btn-disabled'))
                    $('#btn-start').removeClass('btn-disabled');
                if (!$('#btn-start').hasClass('btn-primary'))
                    $('#btn-start').addClass('btn-primary');
                $('#btn-start').attr('disabled', false);
            } else {
                if ($('#btn-start').hasClass('btn-primary'))
                    $('#btn-start').removeClass('btn-primary');
                if (!$('#btn-start').hasClass('btn-disabled'))
                    $('#btn-start').addClass('btn-disabled');
                $('#btn-start').attr('disabled', true);
            }
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

        // Scan Callback function
        function scanCallback(scannedText) {
            var asset_tag_scanned = scannedText.replace($('#setting-tag').val(), '');
            var dateTime = getDateTime();
            if (scannedText.includes($("#setting-tag").val())) {
                stopCamera();
                $('#highlight').val(asset_tag_scanned);
                $('#scanner').modal('hide');
                let data = $('#tbl-results').bootstrapTable('getData');
                let index = data.findIndex(a => a.asset_tag === asset_tag_scanned);
                if (index > -1) {
                    localStorage.setItem('tmp_' + data[index].asset_tag, JSON.stringify(data[index]));
                    data[index].checked = {datetime: dateTime, formatted: dateTime};
                    data[index].available_actions = {update: true, delete: false};
                } else {
                    index = $('#tbl-results').bootstrapTable('getOptions').totalRows;
                    data.push({
                        id: null,
                        asset_id: null,
                        image: false,
                        asset_tag: asset_tag_scanned,
                        name: null,
                        checked: {datetime: dateTime, formatted: dateTime},
                        familiar: 0,
                        status_label: {id: null, name: null},
                        available_actions: {update: true, delete: false}
                    });
                }
                loadData(data);
                $('html, body').animate({ scrollTop: $('tr:contains("' + asset_tag_scanned + '")').offset().top}, 1000);
                //$('body').scrollTo('tr:contains("' + asset_tag_scanned + '")');
            } else {
                loadCamera();
            }
        }

        // Result Table load data
        async function loadData(data) {
            await $('#tbl-results').bootstrapTable('load', data);
            bindAction();
        }

        // Bind Action
        function bindAction() {
            let alertStatus = '';
            let alertHtml = '';

            $('.status').unbind("click");

            $('.status').bind("click", function() {
                let data = $('#tbl-results').bootstrapTable('getData');
                let index = data.findIndex(a => a.asset_tag === $(this).attr("data-tag"));
                $('#txt-edit-tag').val($(this).attr("data-tag"));
                $('#status_select_id').val(data[index].status_label.id);
                $('#status_select_id').trigger("change");
            });

            $('.asset-clear').unbind("click");

            $('.asset-clear').bind("click", function() {
                event.preventDefault();
                resetAlert();
                let data = $('#tbl-results').bootstrapTable('getData');
                let index = data.findIndex(a => a.id === $(this).data("id"));
                if (index > -1) {
                    $.ajax({
                        type: "POST",
                        url: "{{ route('api.inventoryresults.destroy') }}",
                        dataType: 'json',
                        data: { id: $(this).data("id") },
                        delay: 250,
                        headers: {
                            "X-Requested-With": 'XMLHttpRequest',
                            "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
                        },
                        success: function(res)
                        {
                            if (res.status == 'success') {
                                alertHtml = '<strong>[' + data[index].asset_tag + ' - ' + data[index].name + ']</strong> ' + res.messages;
                                if (res.payload.familiar) {
                                    data[index].id = null;
                                    data[index].checked = null;
                                    data[index].familiar = null;
                                    data[index].status_label = {id: null, name: null},
                                    data[index].available_actions = {update: false, delete: false};
                                } else {
                                    data.splice(index, 1);
                                }
                                loadData(data);
                            } else {
                                alertHtml = '<strong>[' + data[index].asset_tag + ' - ' + data[index].name + ']</strong> ' + res.messages;
                            }
                            alertStatus = res.status;
                       },
                       error: function (xhr, ajaxOptions, thrownError) {
                           alertStatus = 'error';
                           alertHtml = '<strong>[' + data[index].asset_tag + ' - ' + data[index].name + ']</strong> ' + '{{ trans('admin/inventories/result.error_msg') }}';
                       },
                    })
                    .done(function (d) { loadScanAlert(alertStatus, alertHtml); });
                }
            });

            $('.asset-update').unbind("click");

            $('.asset-update').bind("click", function() {
                event.preventDefault();
                let data = $('#tbl-results').bootstrapTable('getData');
                let index = data.findIndex(a => a.asset_tag === $(this).attr("data-tag"));
                if (index > -1) {
                    $.ajax({
                        type: "POST",
                        url: "{{ route('api.inventoryresults.storebyscan') }}",
                        dataType: 'json',
                        data: {
                            id: data[index].id,
                            inventory_id: $('#inventory_select').val(),
                            asset_tag: data[index].asset_tag,
                            checked_time: data[index].checked.datetime,
                            familiar: data[index].familiar,
                            status_id: data[index].status_label.id
                        },
                        delay: 250,
                        headers: {
                            "X-Requested-With": 'XMLHttpRequest',
                            "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
                        },
                        success: function(res)
                        {
                           if (res.status == 'success') {
                               data[index] = {
                                   id: res.payload.id,
                                   asset_id: res.payload.asset_id,
                                   image: false,
                                   asset_tag: res.payload.asset.asset_tag,
                                   name: res.payload.asset.name,
                                   checked: {datetime: res.payload.checked_time, formatted: res.payload.checked_time},
                                   familiar: res.payload.familiar,
                                   status_label: {id: res.payload.status_id, name: res.payload.status_name},
                                   available_actions: {update: false, delete: true}
                               }
                               loadData(data);
                               localStorage.removeItem('tmp_' + $(this).attr("data-tag"));
                               alertHtml = '<strong>[' + res.payload.asset.asset_tag + ' - ' + (res.payload.asset.name ? res.payload.asset.name : '') + ']</strong> ' + res.messages;
                           } else {
                               alertHtml = '<strong>[' + data[index].asset_tag + ']</strong> ' + res.messages;
                           }
                           alertStatus = res.status;
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alertStatus = 'error';
                            alertHtml = '<strong>[' + data[index].asset_tag + ']</strong> ' + '{{ trans('admin/inventories/result.error_msg') }}';
                        },
                    })
                    .done(function (d) { loadScanAlert(alertStatus, alertHtml); });
                }
                if ($(this).attr("data-tag") == $('#highlight').val()) {
                    $('#highlight').val('');
                }
            });

            $('.asset-cancel').unbind("click");

            $('.asset-cancel').bind("click", function() {
                event.preventDefault();
                let data = $('#tbl-results').bootstrapTable('getData');
                let index = data.findIndex(a => a.asset_tag === $(this).attr("data-tag"));
                if (index > -1) {
                    let stored = localStorage.getItem('tmp_' + $(this).attr("data-tag"));
                    if (stored) {
                        data[index] = JSON.parse(stored);
                    } else {
                        data.splice(index, 1);
                    }
                    if ($(this).attr("data-tag") == $('#highlight').val()) {
                        $('#highlight').val('');
                    }
                    loadData(data);
                    localStorage.removeItem('tmp_' + $(this).attr("data-tag"));
                }
            });
        }

        // Load alert div
        function loadScanAlert(status, htmlCode) {
            resetAlert();
            switch (status) {
                case 'success':
                    $('#div-alert .alert').addClass('alert-success');
                    $('#div-alert i').addClass('fa-check');
                    $('#alert-title').text('{{ trans('admin/inventories/result.success') }}');
                    $('#alert-content').html(htmlCode);
                    break;
                case 'camera_error':
                    $('#div-alert .alert').addClass('alert-warning');
                    $('#div-alert i').addClass('fa-warning');
                    $('#alert-title').text('{{ trans('admin/inventories/result.error') }}');
                    $('#alert-content').html('{{ trans('admin/inventories/result.camera_load_failed') }}');
                    break;
                default:
                    $('#div-alert .alert').addClass('alert-warning');
                    $('#div-alert i').addClass('fa-warning');
                    $('#alert-title').text('{{ trans('admin/inventories/result.error') }}');
                    $('#alert-content').html(htmlCode);
                    break;
            }
            $('#div-alert').show();
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

        // Reset Alert Div
        function resetAlert() {
            $('#div-alert').hide();
            $('#div-alert .alert').removeClass('alert-success alert-warning');
            $('#div-alert i').removeClass('fa-check fa-warning');
            $('#alert-title').text('');
            $('#alert-content').text('');
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

        var loc = window.location.href;
        // Trigger back button close camera
        if (window.history && window.history.pushState) {
            $('#scanner').on('show.bs.modal', function (e) {
                window.history.pushState('forward', null, loc);
            });

            $(window).on('popstate', function () {
                $('#scanner').modal('hide');
                window.history.pushState('forward', null, loc);
            });
        }

    </script>
@stop

<style>
    /* Smartphones ----------- */
    @media only screen and (max-width: 760px) {
        .navbar-static-top {
            display: none;
        }
        .content-header {
            padding-top: 50px !important;
        }
    }

    #div-results {
        display: none;
    }

    #qr-canvas {
        width: 800px;
        height: 600px;
        display: none;
    }

    #div-alert {
        display: none;
    }

    #scanner-stream {
        display: none;
    }

    #v {
        height: 50vh;
    }

    #btn-save-asset {
        display: none;
    }

    #btn-rescan {
        display: none;
    }

    #div-scanned {
        display: none;
    }

    .highlight {
        background-color: #C3D7EB !important;
    }

    #scanner .modal-body {
        background-color: black;
    }

    #btn-switch-camera {
        display: none;
    }

    #tbl-results {
        font-size: 10px;
    }

    .row {
        margin-left: -25px !important;
        margin-right: -25px !important;
    }

    .col-md-12 {
        padding-left: 5px !important;
        padding-right: 5px !important;
    }

    #div-results .box-body {
        padding: 0px !important;
    }

</style>
