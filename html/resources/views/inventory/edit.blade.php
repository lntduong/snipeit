@extends('layouts/edit-form-mobile', [
    'createText' => "Inventory Scan" ,
    'formAction' => ($item) ? route('locations.update', ['location' => $item->id]) : route('locations.store'),
    ])
    {{-- Page content --}}
    @section('inputFields')

    <!-- Submit Mode -->
    <div class="box-header">
       <div class="col-xs-12" id="container-mode">
           <label for="name" class="col-xs-4 control-label form-group form-scan" >Submit Mode</label>
           <div class="col-xs-2" > </div>
           <div class="btn-group" data-toggle="buttons">
               <label class="btn btn-default active">
                   <input class="action-btn" name="online" type="radio" checked="checked" id="online" onchange="changeMode('on')"><i class="fa fa-wifi"></i> Online
               </label>
               <label class="btn btn-default">
                   <input class="action-btn" name="offline" type="radio" id="offline" onchange="changeMode('off')"><i class="fa fa-pencil"></i> Offline
               </label>
            </div>
       </div>
    </div>

    <!-- Company-->
    @include ('partials.forms.edit.company-select', ['translated_name' => "Companies", 'fieldname' => 'company_id'])
    <!-- Store-->
    @include ('partials.forms.edit.store-select', ['translated_name' => trans('admin/contracts/table.store'), 'fieldname' => 'store_id'])
    <!-- Contract-->
    @include ('partials.forms.edit.contract-select', ['translated_name' => 'Contract', 'fieldname' => 'contract_id'])
    <!-- Inventory-->
    @include ('partials.forms.edit.inventory-select', ['translated_name' => "Inventory", 'fieldname' => 'inventory_id'])

    <!-- Button Scan-->
    <div class="box-footer text-center">
       <button type="button" onclick="load()" class="btn btn-disabled" disabled=disabled id="scan-btn">SCAN</button>
    </div>

    <!-- Load Error Msg -->
    <div class="alert alert-danger col-md-8" id="alert-page"></div>

    <!-- Camera-->
    <div id="outdiv" class="text-center col-md-8"><video id="v" autoplay=""></video></div>

    <!-- Canvas-->
    <canvas id="qr-canvas" width="800" height="600" style="width: 800px; height: 600px;"></canvas>

    <!-- Scan result -->
    <div id="result-div" class="col-md-8">
      <!-- Asset tag -->
      <div class="form-group">
          <label class="col-md-3 control-label">Asset Number</label>
          <div class="col-md-7 col-sm-11">
              <input class="form-control" type="text" name="input-scan" id="input-scan" value="" readonly=readonly>
          </div>
      </div>
      <!-- Status -->
      <div class="text-left form-group">
          <label for="status_id" class="col-md-3 control-label">{{ trans('admin/hardware/form.status') }}</label>
          <div class="col-md-7 col-sm-11">
              {{ Form::select('status_id', $statuslabel_list , Input::old('status_id', $item->status_id), array('class'=>'select2 status_id', 'style'=>'width:100%','id'=>'status_select_id')) }}
          </div>
      </div>
      <div class="form-group alert-message" id="alert-asset"></div>
      <button type="button" onclick="load()" class="btn btn-primary">ReScan</button>
      <button type="button" onclick="sendOnline()" class="btn btn-success">Send</button>
    </div>
    <br>
    <div id="scan-result" class="col-md-8">
       <p> Scan Result :</p>
       <p id="scan-data-result"></p>
    </div>
    <!-- set mode -->
    <input type="hidden" id="get-mode" value="online" />
    <!-- Table-->
    <div class="row" id="div-table-asset" >
       <div class="col-md-12">
          <div class="box box-default">
             <div class="box-body">
                <div class="table-responsive">
                   <table id="body-asset" cellpadding="0" width="100%" border="2px solid">
                      <thead>
                         <th>Asset Number</th>
                         <th>Scanned Time</th>
                         <th>Status</th>
                         <th>Action</th>
                      </thead>
                      <tbody>
                      </tbody>
                   </table>
                </div>
             </div>
          </div>
       </div>
       <!-- resutl offline-->
       <div class="col-md-12"><input type="button" onclick="saveAssetScanOffline()" id="batch-submit" value="Batch Submit"> </div>
       <br>
       <div class="col-md-12" id="batch-submit-result">
       </div>
    </div>
    {{-- modal delete table local storage --}}
    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="mi-modal">
       <div class="modal-dialog modal-sm">
          <div class="modal-content">
             <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Delete Table</h4>
             </div>
             <div class="modal-footer">
                <button type="button" class="btn btn-default" id="modal-btn-yes">Yes</button>
                <button type="button" class="btn btn-primary" id="modal-btn-no">No</button>
             </div>
          </div>
       </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="/js/extensions/webqr/llqrcode.js"></script>
    <script src="/js/extensions/webqr/webqr.js"></script>
    <script>
      let assetTag = '{!! $asset_tag !!}';
      if ($('.col-md-7, .col-sm-12, .required').removeClass('required'));
      if ($('#get-mode').val() === 'online') {
          $('#body-asset').css('visibility', 'hidden');
      }

      function sendOnline() {
          if ($('#status_select_id').val() === null || $('#status_select_id').val() === '') {
              showErrorMsg($('#alert-asset'), '{{ trans('admin/inventory/api.error_required') }}', 'error');
              return;
          }
          var content_scan = $('#input-scan').val();
          if (content_scan === null || content_scan === '') {
              showErrorMsg($('#alert-asset'), '{{ trans('admin/inventory/api.error_required') }}', 'error');
              return;
          }
          $.ajax({
              url: baseUrl + 'api/v1/inventories/checkasset',
              type: 'POST',
              headers: {
                  "X-Requested-With": 'XMLHttpRequest',
                  "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
              },
              data: {
                  'contract_id': $('#contract_select').val(),
                  'asset_tag': content_scan,
                  'inventory_id': $('#inventory_select').val(),
                  'status_id': $('#status_select_id').val(),
                  // 'checked_time' : getToDate()
              },
              dataType: 'json',
              success: function(data, status, xhr) {
                  $('.alert-message').hide();
                  if (data.success_scan != undefined) {
                      document.getElementById("scan-data-result").style.color = "blue";
                      document.getElementById("scan-data-result").innerHTML = '-' + data.success_scan;
                  }
                  if (data.unrecognized_scan != undefined) {
                      document.getElementById("scan-data-result").style.color = "red";
                      document.getElementById("scan-data-result").innerHTML = '-' + data.unrecognized_scan;
                  }
                  $("#scan-result").show();
              }
          });
      }

      function offline(content) {
          var objects = null;
          var arrayAsset = localStorage.getItem("inventory" + $('#inventory_select').val());
          if (arrayAsset !== null) {
              objects = JSON.parse(arrayAsset);
          } else {
              objects = [];
          }
          for (var i = 0; i < objects.length; i++) {
              if (objects[i].asset_number === content) {
                  objects.splice(i, 1);
                  break;
              }
          }
          objects.push({
              asset_number: content,
              date_scan: getToDate()
          });
          var jsonListAsset = JSON.stringify(objects);
          localStorage.setItem("inventory" + $('#inventory_select').val(), jsonListAsset);

          var obj = localStorage.getItem("inventory" + $('#inventory_select').val());
          var objects = JSON.parse(obj);

          objects.forEach(function(key, index) {
              $("#body-asset tbody").append(
                  "<tr>" +
                  "<td>" + key.asset_number + "</td>" +
                  "<td>" + key.date_scan + "</td>" +
                  "<td>" +
                  "<a class='btn btn-danger btn-sm' onclick=deleteAssetLocal('asset_number') 	&quot; > <i class='fa fa-trash'></i> </a> ".replace('asset_number', key.asset_number) +
                  "</td>" +
                  "</tr>"
              );
          });
      }

      function loadingTableAsset() {
          $("#body-asset tbody").html('');
          var obj = localStorage.getItem("inventory" + $('#inventory_select').val());
          var objects = null;
          if (obj !== null) {
              objects = JSON.parse(obj);
          } else {
              objects = [];
          }
          objects.forEach(function(key, index) {

              $("#body-asset tbody").append(
                  "<tr>" +
                  "<td>" + key.asset_number + "</td>" +
                  "<td>" + key.date_scan + "</td>" +
                  "<td>" +
                  "<a class='btn btn-danger btn-sm' onclick=deleteAssetLocal('asset_number') 	&quot; > <i class='fa fa-trash'></i> </a> ".replace('asset_number', key.asset_number) +
                  "</td>" +
                  "</tr>"
              );

          });
      }

      function changeMode(mode) {
          $('#scan-btn').attr("disabled", true);
          $('#scan-btn').removeClass("btn-primary");
          $('#scan-btn').addClass("btn-disabled");
          $("#scan-result").hide();
          $("#result-div").hide();
          $('#company_select').html('');
          $('#contract_select').html('');
          $('#store_select').html('');
          $('#inventory_select').val('');
          $('#inventory_select').html('');
          $("#outdiv").hide();
          if (mode === 'on') {
              $("#batch-submit-result").css('visibility', 'hidden');
              $("#store_select").attr("class", "store_select");
              $("#company_select").attr("class", "company_select");
              $("#inventory_select").attr("class", "inventory_select");
              $("#contract_select").attr("class", "contract_select");
              $(".store_select").select2({
                  ajax: {
                      url: baseUrl + 'api/v1/stores/selectlist',
                      dataType: 'json',
                      delay: 250,
                      headers: {
                          "X-Requested-With": 'XMLHttpRequest',
                          "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
                      },
                      data: function(params) {
                          var data = {
                              company_id: $("#company_select").val(),
                          };
                          return data;
                      },
                      processResults: function(data) {
                          var answer = {
                              results: data.items,
                              pagination: {
                                  more: "true"
                              }
                          };
                          return answer;
                      },
                  },
              });

              $(".contract_select").select2({
                  ajax: {
                      url: baseUrl + 'api/v1/contracts/selectlist',
                      dataType: 'json',
                      delay: 250,
                      headers: {
                          "X-Requested-With": 'XMLHttpRequest',
                          "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
                      },
                      data: function(params) {
                          var data = {
                              date_contract: $("#contract_date").val(),
                              store_id: $("#store_select").val(),
                          };
                          return data;
                      },
                      processResults: function(data, params) {
                          params.page = params.page || 1;
                          var answer = {
                              results: data.items,
                              pagination: {
                                  more: "true"
                              }
                          };
                          return answer;
                      },
                      cache: true
                  },
                  escapeMarkup: function(markup) {
                      return markup;
                  },
              });

              //inventory select
              $(".inventory_select").select2({
                  ajax: {
                      url: baseUrl + 'api/v1/inventories/selectlist',
                      dataType: 'json',
                      delay: 250,
                      headers: {
                          "X-Requested-With": 'XMLHttpRequest',
                          "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
                      },
                      data: function(params) {
                          var data = {
                              contract_id: $(".contract_select").val(),
                          };
                          return data;
                      },
                      processResults: function(data, params) {
                          params.page = params.page || 1;
                          var answer = {
                              results: data.items,
                              pagination: {
                                  more: "true"
                              }
                          };
                          return answer;
                      },
                      cache: true
                  },
                  escapeMarkup: function(markup) {
                      return markup;
                  },
              });
              $(".company_select").select2({
                  ajax: {
                      url: baseUrl + 'api/v1/companies/selectlist',
                      dataType: 'json',
                      delay: 250,
                      headers: {
                          "X-Requested-With": 'XMLHttpRequest',
                          "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
                      },
                      data: function(params) {
                          var data = {
                              contract_id: $(".contract_select").val(),
                          };
                          return data;
                      },
                      processResults: function(data, params) {
                          params.page = params.page || 1;
                          var answer = {
                              results: data.items,
                              pagination: {
                                  more: "true"
                              }
                          };

                          return answer;
                      },
                      cache: true
                  },
                  escapeMarkup: function(markup) {
                      return markup;
                  },
              });
              $("#batch-submit").css("visibility", "hidden");
              $('#body-asset').css('visibility', 'hidden');
              $('#get-mode').val('online');
              $('#div-table-asset').css('display', 'none');
          } else if (mode === 'off') {
              $("#scan-result").hide();
              $("#result-div").hide();
              $("#batch-submit-result").css('visibility', 'visible');
              $("#batch-submit").css("visibility", "visible");
              changeInputOffline();
              $('#get-mode').val('offline');
              $('#body-asset').css('visibility', 'visible');
              $('#div-table-asset').css('display', 'block');
          }
      }

      //get date now
      function getToDate() {
          var currentdate = new Date();
          var datetime = currentdate.getDate() + "/" +
              (currentdate.getMonth() + 1) + "/" +
              currentdate.getFullYear() + " " +
              currentdate.getHours() + ":" +
              currentdate.getMinutes() + ":" +
              currentdate.getSeconds();
          return datetime;
          }
          // open camera
          function turnOnCamera() {
          Instascan.Camera.getCameras().then(cameras => {
              if (cameras.length > 0) {
                  scanner.start(cameras[0]);

              } else {
                  console.error("camera error");
              }
          });
      }
      </script>

      @stop
      @if(!$item -> id)
      @section('moar_scripts')
      <script>
      if ($('#get-mode').val() === 'online') {
          $(".store_select").select2({
              ajax: {
                  url: baseUrl + 'api/v1/stores/selectlist',
                  dataType: 'json',
                  delay: 250,
                  headers: {
                      "X-Requested-With": 'XMLHttpRequest',
                      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
                  },
                  data: function(params) {
                      var data = {
                          company_id: ($("#company_select").val()) ? $("#company_select").val() : "-1",
                      };
                      return data;
                  },
                  processResults: function(data) {
                      var answer = {
                          results: data.items,
                          pagination: {
                              more: "true"
                          }
                      };
                      return answer;
                  },
              },
          });

          $(".contract_select").select2({
              ajax: {
                  url: baseUrl + 'api/v1/contracts/selectlist',
                  dataType: 'json',
                  delay: 250,
                  headers: {
                      "X-Requested-With": 'XMLHttpRequest',
                      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
                  },
                  data: function(params) {
                      var data = {
                          date_contract: $("#contract_date").val(),
                          store_id: $("#store_select").val(),
                      };
                      return data;
                  },
                  processResults: function(data, params) {
                      params.page = params.page || 1;
                      var answer = {
                          results: data.items,
                          pagination: {
                              more: "true"
                          }
                      };

                      return answer;
                  },
                  cache: true
              },
              escapeMarkup: function(markup) {
                  return markup;
              }, // let our custom formatter work
          });

          //inventory select
          $(".inventory_select").select2({
              ajax: {
                  url: baseUrl + 'api/v1/inventory/selectlist',
                  dataType: 'json',
                  delay: 250,
                  headers: {
                      "X-Requested-With": 'XMLHttpRequest',
                      "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
                  },
                  data: function(params) {
                      var data = {
                          contract_id: $(".contract_select").val(),
                      };
                      return data;
                  },
                  processResults: function(data, params) {
                      params.page = params.page || 1;
                      var answer = {
                          results: data.items,
                          pagination: {
                              more: "true"
                          }
                      };

                      return answer;
                  },
                  cache: true
              },
              escapeMarkup: function(markup) {
                  return markup;
              }, // let our custom formatter work
          });
      }

      //get data use offline
      $('#offdata').click(function() {
          event.preventDefault();
          $.ajax({
              url: baseUrl + 'api/v1/inventories/offlinedata',
              type: 'GET',
              headers: {
                  "X-Requested-With": 'XMLHttpRequest',
                  "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
              },
              data: {},
              dataType: 'json',
              success: function(data, status, xhr) {
                  localStorage.setItem("listCompany", JSON.stringify(data.listCompany));
                  localStorage.setItem("listStore", JSON.stringify(data.listStore));
                  localStorage.setItem("listContract", JSON.stringify(data.listContract));
                  localStorage.setItem("listInventory", JSON.stringify(data.listInventory));

              }
          });
      });

      //select offline
      function getSelectLocal(arraySelect, itemClass, model) {
          var datapPush = [{
              id: "",
              text: ""
          }];
          if (arraySelect === null) {
              var datapPush = [{
                  id: "",
                  text: ""
              }];
          } else {
              for (var i = 0; i < arraySelect.data.length; i++) {
                  if (model === 'store') {
                      if (arraySelect.data[i].company_id + "" !== $('#company_select').val())
                          continue;
                  }
                  if (model === 'contract') {

                      if (arraySelect.data[i].store_id + "" !== $('#store_select').val())
                          continue;
                  }
                  if (model === 'inventory') {

                      if (arraySelect.data[i].contract_id + "" !== $('#contract_select').val())
                          continue;
                  }
                  if (model !== 'inventory') {
                      datapPush.push({
                          id: arraySelect.data[i].id,
                          text: arraySelect.data[i].name
                      });
                  } else {
                      var date_inventory = arraySelect.data[i].inventory_date !== undefined ? arraySelect.data[i].inventory_date : '';
                      datapPush.push({
                          id: arraySelect.data[i].id,
                          text: date_inventory.substr(0, 10).replace(/-/g, '/') + ' - ' + arraySelect.data[i].name
                      });
                  }
              }
          }
          $(itemClass).select2({
              data: datapPush
          })
      }

      $("#company_select").on({
          "change": function(e) {
              $("#store_select, #contract_select ,#inventory_select").html('');
              $("#body-asset tbody").html('');
              if ($('#get-mode').val() === 'offline') {
                  changeInputOffline();
              }
              setScanBtn();
          }
      });

      $("#store_select").on({
          "change": function(e) {
              $("#contract_select ,#inventory_select").html('');
              $("#body-asset tbody").html('');
              if ($('#get-mode').val() === 'offline') {
                  changeInputOffline();
              }
              setScanBtn();
          }
      });

      $("#contract_select").on({
          "change": function(e) {
              $("#inventory_select").val('');
              $("#body-asset tbody").html('');
              if ($('#get-mode').val() === 'offline') {
                  changeInputOffline();
              }
              setScanBtn();
          }
      })

      $("#inventory_select").on({
          "change": function(e) {
              if ($('#get-mode').val() === 'offline') {
                  $("#body-asset tbody").html('');
                  loadingTableAsset();
              }
              setScanBtn();
          }
      });

      function setScanBtn() {
          if ($('#inventory_select').val() === null || $('#inventory_select').val() === '') {
              $('#scan-btn').attr("disabled", true);
              $('#scan-btn').removeClass("btn-primary");
              $('#scan-btn').addClass("btn-disabled");
          } else {
              $('#scan-btn').attr("disabled", false);
              $('#scan-btn').removeClass("btn-disabled");
              $('#scan-btn').addClass("btn-primary");
          }
      }

      function changeInputOffline() {
          $("#company_select").attr("class", "select-company-off");
          $("#store_select").attr("class", "select-store-off");
          $("#contract_select").attr("class", "select-contract-off");
          $("#inventory_select").attr("class", "select-inventory-off");
          getSelectLocal(JSON.parse(localStorage.getItem("listCompany")), ".select-company-off", "company");
          getSelectLocal(JSON.parse(localStorage.getItem("listStore")), ".select-store-off", 'store');
          getSelectLocal(JSON.parse(localStorage.getItem("listContract")), ".select-contract-off", 'contract');
          getSelectLocal(JSON.parse(localStorage.getItem("listInventory")), ".select-inventory-off", 'inventory');
      }

      function deleteAssetLocal(asset_number) {
          var arrayAsset = localStorage.getItem("inventory" + $('#inventory_select').val());
          var objects = JSON.parse(arrayAsset);
          for (var i = 0; i < objects.length; i++) {
              if (objects[i].asset_number === asset_number + "") {
                  objects.splice(i, 1);
                  break;
              }
          }
          localStorage.setItem("inventory" + $('#inventory_select').val(), JSON.stringify(objects));
          $("#body-asset tbody").html('');
          loadingTableAsset();
      }

      function saveAssetScanOffline() {
          $.ajax({
              url: baseUrl + 'api/v1/inventories/savelist',
              type: 'POST',
              headers: {
                  "X-Requested-With": 'XMLHttpRequest',
                  "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
              },
              data: {
                  item: localStorage.getItem("inventory" + $('#inventory_select').val()),
                  inventory_id: $("#inventory_select").val()
              },
              dataType: 'json',
              success: function(data, status, xhr) {
                  $("#batch-submit-result").html('');
                  $("#batch-submit-result").append("<p> Batch Submit Result : </p>");
                  $("#batch-submit-result").css('visibility', 'visible');
                  var arrayMsg = data.success_scan.split("**");
                  for (var i = 0; i < arrayMsg.length; i++) {
                      if (arrayMsg[i].includes("Unrecognized")) {
                          $("#batch-submit-result").append(" <p style='color:red' >" + arrayMsg[i] + "</p>");
                      } else {
                          $("#batch-submit-result").append(" <p style='color:blue' >" + arrayMsg[i] + "</p>");
                      }
                  }
                  deleteLocalTable();
              }
          });
      }

      function deleteLocalTable() {
          var modalConfirm = function(callback) {

              $("#mi-modal").modal('show');
              $("#modal-btn-yes").on("click", function() {
                  callback(true);
                  $("#mi-modal").modal('hide');
              });

              $("#modal-btn-no").on("click", function() {
                  callback(false);
                  $("#mi-modal").modal('hide');
              });
          };

          modalConfirm(function(confirm) {
              if (confirm) {
                  localStorage.removeItem("inventory" + $('#inventory_select').val());
                  loadingTableAsset();
              }
          });
      }

      function scanCallback(a) {
          if (a.includes(assetTag) && $('#inventory_select').val() !== '') {
              $("#body-asset tbody").html('');
              if ($('#get-mode').val() === 'online') {
                  $("#input-scan").val(a);
                  document.getElementById('result-div').style.display = "block";
                  $("#body-asset").hide();
                  getAssetInfo(a);
              } else if ($('#get-mode').val() === 'offline') {
                  offline(a);
                  $("#body-asset").show();
                  $("#scan-result").hide();
              }
          }
          $("#outdiv").hide();
          //setwebcam();
      }

      function isInventoryNull() {
          if ($('#inventory_select').val() === null || $('#inventory_select').val() === '') {
              $("#outdiv").hide();
              return true;
          }
          return false;
      }

      function getAssetInfo(tag) {
          var curTag = tag.replace(assetTag,'');
          $.ajax({
              url: baseUrl + 'api/v1/hardware/bytag/' + curTag,
              type: 'GET',
              headers: {
                  "X-Requested-With": 'XMLHttpRequest',
                  "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
              },
              dataType: 'json',
              success: function(data, status, xhr) {
                  if (data.status !== 'error') {
                    $("#status_select_id option[value="+data.status_label.id+"]").attr('selected','selected');
                    $("#status_select_id").html($("#status_select_id").text);
                } else {
                    $("#status_select_id").val('');
                    showErrorMsg($('#alert-asset'), data.messages, 'warning');
                }
              },
              error: function (xhr, ajaxOptions, thrownError) {
                  showErrorMsg($('#alert-asset'), '{{ trans('admin/inventory/api.error_asset_request_failed') }}', 'error');
              }
          });
      }

      function showErrorMsg(target,message,type) {
          var txtClass = '';
          switch (type) {
              case 'warning':
                  txtClass = 'alert-msg-warning';
                  break;
              case 'error':
                  txtClass = 'alert-msg-error';
                  break;
              default:
                  break;
          }
          target.html('<span class="'+txtClass+'">'+message+'</span>');
          target.show();
      }

      </script>
    @include ('partials.bootstrap-table')
    @stop
    @endif
