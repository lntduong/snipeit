@extends('layouts/edit-form', [
    'createText' => trans('admin/contracts/table.create') ,
    'updateText' => trans('admin/contracts/table.update'),
    'formAction' => ($item) ? route('contracts.update', ['contracts' => $item->id]) : route('contracts.store'),
])

{{-- Page content --}}
@section('inputFields')

<!-- contract name-->
@include ('partials.forms.edit.name', ['translated_name' => trans('admin/contracts/table.contract_name')])

<!-- Company-->
@include ('partials.forms.edit.company-select', ['translated_name' => trans('admin/contracts/table.contracts_company'), 'fieldname' => 'company_id'])

<!-- Store-->
@include ('partials.forms.edit.store-select', ['translated_name' => trans('admin/contracts/table.store'), 'fieldname' => 'store_id'])

<!-- Location-->
@include ('partials.forms.edit.location-select', ['translated_name' => trans('admin/contracts/table.location'), 'fieldname' => 'location_id', 'new' => 'no'])

<!-- Contact Person 1-->
@include ('partials.forms.edit.user2-select', ['translated_name' => trans('admin/contracts/table.contact_person1'), 'fieldname' => 'contact_id_1', 'classname' => 'user_select_id'])

<!-- Contact Person 2-->
@include ('partials.forms.edit.user2-select', ['translated_name' => trans('admin/contracts/table.contact_person2'), 'fieldname' => 'contact_id_2', 'classname' => 'user2_select_id'])

<!-- Date contracts-->   
@include ('partials.forms.edit.date-contract')

<!-- billing_date -->
<div class="form-group {{ $errors->has('billing_date') ? ' has-error' : '' }}">
    <label for="billing_date" class="col-md-3 control-label">{{ trans('admin/contracts/table.billing_date') }}</label>

    <div class="input-group col-md-3">
        <div class="input-group date" data-provide="datepicker" data-date-format="yyyy-mm-dd"  data-autoclose="true">
            <input type="text" class="form-control" placeholder="{{ trans('general.select_date') }}" name="billing_date" id="billing_date" value="{{ Input::old('billing_date', $item->billing_date) }}">
            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
        </div>
        {!! $errors->first('billing_date', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
    </div>

</div>

<!-- payment_date -->
<div class="form-group {{ $errors->has('payment_date') ? ' has-error' : '' }}">
    <label for="payment_date" class="col-md-3 control-label">{{ trans('admin/contracts/table.payment_date') }}</label>

    <div class="input-group col-md-3">
        <div class="input-group date" data-provide="datepicker" data-date-format="yyyy-mm-dd"  data-autoclose="true">
            <input type="text" class="form-control" placeholder="{{ trans('general.select_date') }}" name="payment_date" id="payment_date" value="{{ Input::old('payment_date', $item->payment_date) }}">
            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
        </div>
        {!! $errors->first('payment_date', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
    </div>

</div>

<!--terms_and_conditions -->
<div class="form-group {{ $errors->has('terms_and_conditions') ? ' has-error' : '' }}">
        <label for="terms_and_conditions" class="col-md-3 control-label">{{ trans('admin/contracts/table.terms_and_conditions') }}</label>
        <div class="col-md-7 col-sm-12">
            <textarea class="col-md-6 form-control" id="terms_and_conditions" name="terms_and_conditions">{{ Input::old('notes', $item->terms_and_conditions) }}</textarea>
            {!! $errors->first('terms_and_conditions', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
        </div>
    </div>

<!-- note -->
@include ('partials.forms.edit.notes')
<div id="hideForm" style="display:none;">
<!-- Contract Assets -->
<h4 class="box-title">Contract Assets</h4>
@include ('partials.forms.edit.contract-asset-select', ['translated_name' => trans('admin/asset_maintenances/table.asset_name'), 'fieldname' => 'asset_id', 'required' => 'true'])
<!-- @include ('contractassets.index') -->
</div>
@stop

{{-- @if (!$item->id) --}}
@section('moar_scripts')
<script type="text/javascript">
  $(document).ready(function(){
    $('#add_asset').click(function(e){
         e.preventDefault(); 
         var form_data = $(this).serialize();
        $.ajax({
            url: '/store_asset',
            type: "post",
            data: form_data,
            dataType: 'JSON',
            success: function (data) {
            console.log(data); // this is good
            }
      });
    });
  });
</script>
<script>
    $(document).ready(function() {
        $('form').submit(function(e){
        e.preventDefault();
        document.getElementById('hideForm').style.display = null;
        var form_data = $(this).serialize();
        $.ajax({
            url:'{{ route('contracts.store') }}',
            method: "POST",
            data: form_data,
            dataType: "json",
            success: function(data) {
                console.log(data);
            }
        })
        });
    });
</script>

<script type="text/javascript">

    function selectedValue() {
        var x = document.getElementById("asset_id").value;
        console.log(x);
        $table.bootstrapTable('insertRow', {
            index: 1,
            row: {
                id: x,
                name: "",
                image: '',
                action: '<button id="remove" class="btn btn-danger btn-sm" onclick="removeAsset(this)"> <i class="fa fa-trash"></i> </button>' 
            }
        })
    }
    var $table = $('#table_contract_assets')
    var $add_asset = $('#add_asset')
    // $(function() {
    //     $add_asset.click(function () {
    //      var asset_id = $("#asset_id").val();
    
    //       var temp = {
    //         url: '{{ route('api.contractasset.index',['asset_id' => '']) }}' + asset_id
    //       };

    //       console.log(temp);
    //       $table.bootstrapTable('insertRow', {
    //         index: 1,
    //         row: {
    //             id: asset_id,
    //             name: "",
    //             image: '',
    //             action: '<button id="remove" class="btn btn-danger btn-sm" onclick="removeAsset(this)"> <i class="fa fa-trash"></i> </button>' 
    //         }
    //     })
    //       $table.bootstrapTable('refresh', temp);
    //     })
    //     })

    function removeAsset(btn) {
    var row = btn.parentNode.parentNode;
    row.parentNode.removeChild(row);
    }
</script>
@include('partials.bootstrap-table')
<script>
    $('#company_select').change(function(){
        $('#store_select').html('');
        $('#user_select_id').html('');
        $('#user2_select_id').html('');
    });
    
     $(".store_select").select2({
/**
 * Adds an empty placeholder, allowing every select2 instance to be cleared.
 * This placeholder can be overridden with the "data-placeholder" attribute.
 */
placeholder: '',
allowClear: true,

ajax: {

    // the baseUrl includes a trailing slash
    url: baseUrl + 'api/v1/store/selectlist',
    dataType: 'json',
    delay: 250,
    headers: {
        "X-Requested-With": 'XMLHttpRequest',
        "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
    },
    data: function (params) {
        var data = {
            search: params.term,
            company_id:$("#company_select").val(),
            page: params.page || 1,
            assetStatusType: $(".js-data-ajax-company").data("asset-status-type"),
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

$(".user_select").select2({

/**
 * Adds an empty placeholder, allowing every select2 instance to be cleared.
 * This placeholder can be overridden with the "data-placeholder" attribute.
 */
placeholder: '',
allowClear: true,

ajax: {

    // the baseUrl includes a trailing slash
    url: baseUrl + 'api/v1/users/selectlist',
    dataType: 'json',
    delay: 250,
    headers: {
        "X-Requested-With": 'XMLHttpRequest',
        "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
    },
    data: function (params) {
        var data = {
            search: params.term,
            company_id:$("#company_select").val(),
            page: params.page || 1,
            assetStatusType: $(".js-data-ajax-company").data("asset-status-type"),
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

</script>
@stop
{{-- @endif --}}
