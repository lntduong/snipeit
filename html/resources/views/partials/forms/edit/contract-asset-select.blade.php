<style type="text/css">
    form{
        margin: 20px 0;
    }
    form input, button{
        padding: 5px;
    }
    table{
        width: 100%;
        margin-bottom: 20px;
		border-collapse: collapse;
    }
    table, th, td{
        border: 1px solid #cdcdcd;
    }
    table th, table td{
        padding: 10px;
        text-align: left;
    }
    span.select2-selection__clear {
    display: none;
}
</style>
<!-- Contract Assets -->
<div id="assigned_asset" class="form-group{{ $errors->has($fieldname) ? ' has-error' : '' }}"{!!  (isset($style)) ? ' style="'.e($style).'"' : ''  !!}>
    <div class="col-md-3 control-label"></div>
    <div class="col-md-7">
        <select multiple="multiple" onchange="selectedValue()" class="js-data-ajax select2" data-endpoint="hardware" data-placeholder="{{ trans('general.select_asset') }}" name="{{ $fieldname }}[]" style="width: 100%" id="asset_id">

            @if ((!isset($unselect)) && ($asset_id = Input::old($fieldname, (isset($asset) ? $asset->id  : (isset($item) ? $item->{$fieldname} : '')))))
                <option value="{{ $asset_id }}" selected="selected">
                    {{ (\App\Models\Asset::find($asset_id)) ? \App\Models\Asset::find($asset_id)->present()->fullName : '' }}
                </option>
            @else
                @if(!isset($multiple))
                    <option value="">{{ trans('general.select_asset') }}</option>
                @endif
            @endif
        </select>
    </div>
    
    {!! $errors->first($fieldname, '<div class="col-md-8 col-md-offset-3"><span class="alert-msg"><i class="fa fa-times"></i> :message</span></div>') !!}
    <div class="col-md-1 col-sm-1 text-left" id="toolbar">
        <a class="btn btn-sm btn-warning" id="add_asset">Add</a>
    </div>    
</div>
<!-- <table 
      id="table_contract_assets"
      data-toggle="table"
      data-toolbar="#toolbar"
      >
  <thead>
  <tr>
    <th data-field="id">ID</th>
    <th data-field="device">Device</th>
    <th data-field="device_img">Device Image</th>
    <th data-field="action">Action</th>
  </tr>
  </thead>
</table> -->
