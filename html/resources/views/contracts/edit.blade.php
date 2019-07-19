<!-- **
 * @author [Duong.LNT]
 * -->
@extends('layouts/edit-form-contract', [
    'createText' => trans('admin/contracts/table.create') ,
    'updateText' => trans('admin/contracts/table.edit'),
    'formAction' => ($item) ? route('contracts.update', ['contracts_id' => $item->id]) : route('contracts.store'),
])
<style>

#table_contract_assets {
    font-size: 13px;
}
#add_asset {
    width: 60px;
}
</style>
{{-- Page content --}}
@section('inputFields')
<!-- contract name-->
@include ('partials.forms.edit.name', ['translated_name' => trans('admin/contracts/table.contract_name')])

@include ('partials.forms.scope-selector-contract', ['scope_company_contract' => 'true','scope_store_contract' => 'true', 'scope_department_contract' => 'true'])

<!-- Company-->
@include ('partials.forms.edit.scope-company-contract', ['translated_name' => trans('general.company'), 'fieldname' => 'assigned_company', 'required'=>'true'])

<!-- Store-->
@include ('partials.forms.edit.scope-store-contract', ['translated_name' => trans('general.store'), 'fieldname' => 'assigned_store', 'unselect' => 'true', 'style' => 'display:none;', 'required'=>'true'])

<!-- Department-->
@include ('partials.forms.edit.scope-department-contract', ['translated_name' => trans('general.department'), 'fieldname' => 'assigned_department', 'style' => 'display:none;', 'required'=>'true'])

<!-- Location-->
@include ('partials.forms.edit.location-select-contract', ['translated_name' => trans('admin/contracts/table.location'), 'fieldname' => 'location_id', 'new' => 'no'])

<!-- Contact Person 1-->
@include ('partials.forms.edit.user2-select', ['translated_name' => trans('admin/contracts/table.contact_person1'), 'fieldname' => 'contact_id_1', 'classname' => 'user_select_id'])

<!-- Contact Person 2-->
@include ('partials.forms.edit.user2-select', ['translated_name' => trans('admin/contracts/table.contact_person2'), 'fieldname' => 'contact_id_2', 'classname' => 'user2_select_id'])

<!-- Date contracts-->   
@include ('partials.forms.edit.date-contract')

<!-- billing_date -->
<div class="form-group {{ $errors->has('billing_date') ? ' has-error' : '' }}">
    <label for="billing_date" class="col-md-3 control-label">{{ trans('admin/contracts/table.billing_date') }}</label>

    <div class="input-group col-md-3{{  (\App\Helpers\Helper::checkIfRequired($item, 'billing_date')) ? ' required' : '' }}">
        <div class="input-group date datepicker-contract" data-provide="datepicker" data-date-format="yyyy-mm-dd"  data-autoclose="true">
            <input type="text" class="form-control" placeholder="{{ trans('general.select_date') }}" name="billing_date" id="billing_date" value="{{ Input::old('billing_date', $item->billing_date) }}">
            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
        </div>
        {!! $errors->first('billing_date', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
    </div>

</div>

<!-- payment_date -->
<div class="form-group {{ $errors->has('payment_date') ? ' has-error' : '' }}">
    <label for="payment_date" class="col-md-3 control-label">{{ trans('admin/contracts/table.payment_date') }}</label>

    <div class="input-group col-md-3{{  (\App\Helpers\Helper::checkIfRequired($item, 'payment_date')) ? ' required' : '' }}">
        <div class="input-group date datepicker-contract" data-provide="datepicker" data-date-format="yyyy-mm-dd"  data-autoclose="true">
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

@stop

{{-- @if (!$item->id) --}}
@section('moar_scripts')

 @if ($item->id)
 <script type="text/javascript">
    $("#hideForm").css("display","block"); 
 </script>
 @endif

<script>
    var srcImg;
    $('input[name=checkout_to_type_contract]').on("change",function () {
        var object_type = $('input[name=checkout_to_type_contract]:checked').val();
        var object_id = $('#assigned_company option:selected').val();
        if (object_type == 'company') {
            $('#current_assets_box').fadeOut();
            $('#assigned_company').show();
            $('#assigned_store').hide();
            $('#assigned_department').hide();
            $('.notification-callout').fadeOut();
        } else if (object_type == 'store') {
            $('#current_assets_box').fadeOut();
            $('#assigned_company').show();
            $('#assigned_store').show();
            $('#assigned_department').hide();
            $('.notification-callout').fadeOut();
        } else  {
            $('#assigned_company').show();
            $('#assigned_store').show();
            $('#assigned_department').show();
            if (object_id) {
                $('#current_assets_box').fadeIn();
            }
            $('.notification-callout').fadeIn();
        }
    });
    //add contract assets action
    $(document).ready(function() {
        $table = $("#table_contract_assets");
        $('#add_asset').click(function(e){
            e.preventDefault();
            $.ajax({
                url: '{{route('contractAsset.storeAsset')}}',
                headers: {
                    "X-Requested-With": 'XMLHttpRequest',
                    "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
                    },
                method: "POST",
                data: {
                    contract_id: $("#result-contract-id").val(),
                    asset_id: $("#asset_id").val()
                },
                dataType: "json",
                success: function(data) {
                    $("#mgsContractAssets").css("display","block");
                    $("#mgsContractAssetsFailed").css("display","none");
                    $("#mgsContractAssetsDel").css("display","none");
                    $table.bootstrapTable('removeAll');
                    for(var i =0 ; i<data.length ;i++){
                        
                        if(data[i].image) {
                            srcImg = '/uploads/assets/'+ data[i].image +'';
                        }
                        else {
                            srcImg = '/uploads/models/mbp.jpg';
                        }
                        console.log(data[i].id);
                        $table.bootstrapTable('insertRow', {
                            index: 1,
                            row: {
                                name:  
                                '<a href="/hardware/'+ data[i].id +'">'+data[i].name + " (" + data[i].asset_tag + ")" + '</a>',
                                image: '<img src='+srcImg+' width="50" height="40" />',
                                actions: "<a href='#' class='btn btn-danger btn-sm' onclick='removeAsset(" + data[i].id+ "); return false;'> <i class='fa fa-trash'></i> </a>"
                            }  
                        })
                    }    
                },
                error: function(data) {
                    $("#mgsContractAssetsDel").css("display","none");
                    $("#mgsContractAssets").css("display","none");
                    $("#mgsContractAssetsFailed").css("display","block");
                }
            })
        });
    });

    //list contract asset
    $(document).ready(function() {
        $table = $("#table_contract_assets");
        $.ajax({
            url:'{{ route('contractAsset.getAssetContractByIdContract') }}',
            headers: {
                "X-Requested-With": 'XMLHttpRequest',
                "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
            },
            method: "GET",
            data: {
                contract_id: '{{$item->id}}'
            },
            dataType: "json",
            success: function(data) {
                for(var i =0 ; i<data.length ;i++){
                    if(data[i].image) {
                        srcImg = '/uploads/assets/'+ data[i].image +'';
                    }
                    else {
                        srcImg = '/uploads/models/mbp.jpg';
                    }
                    $table.bootstrapTable('insertRow', {
                        index: 1,
                        row: {
                            name:  '<a href="/hardware/'+ data[i].id +'">'+data[i].name + " (" + data[i].asset_tag + ")" + '</a>',
                            image: '<img src='+srcImg+' width="50" height="40" />',
                            actions: "<a href='#' class='btn btn-danger btn-sm' onclick='removeAsset(" + data[i].id+ "); return false;'> <i class='fa fa-trash'></i> </a>"
                        }
                    })
                }
            }
        })
    });

    //remove contract asset
    function removeAsset(idAsset) {
        $.ajax({
            url: baseUrl + 'api/v1/contractAsset/deleteAssetContracts',
            headers: {
                "X-Requested-With": 'XMLHttpRequest',
                "X-CSRF-TOKEN": $('meta[name="csrf-token"]').attr('content')
            },
            method: "POST",
            data: {
                contract_id: $("#result-contract-id").val(),
                asset_id: idAsset
            },
            dataType: "json",
            success: function(data) {
                $("#mgsContractAssetsDel").css("display","block");
                $("#mgsContractAssets").css("display","none");
                $("#mgsContractAssetsFailed").css("display","none");
                $table.bootstrapTable('removeAll');
                for(var i =0 ; i<data.length ;i++){
                    if(data[i].image) {
                        srcImg = '/uploads/assets/'+ data[i].image +'';
                    }
                    else {
                        srcImg = '/uploads/models/mbp.jpg';
                    }
                    $table.bootstrapTable('insertRow', {
                        index: 1,
                        row: {
                            name:  '<a href="/hardware/'+ data[i].id +'">'+data[i].name + " (" + data[i].asset_tag + ")" + '</a>',
                            image: '<img src='+srcImg+' width="50" height="40" />',
                            actions: "<a href='#' class='btn btn-danger btn-sm' onclick='removeAsset(" + data[i].id+ "); return false;'> <i class='fa fa-trash'></i> </a>"
                        }
                    })
                }
            }
        })
    }
</script>
@include('partials.bootstrap-table')
<script>
    $('#company_select').change(function(){
        $('#store_select').html('');
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
            company_id: ($("#company_select").val()) ? $("#company_select").val() : "-1",
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
            company_id:($("#company_select").val() == '') ? 0 : $("#company_select").val() ,
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
$(".datepicker-contract").datepicker( {
    autoclose: true,
    orientation: "top"
  });
</script>
@stop
{{-- @endif --}}


<!-- test -->

