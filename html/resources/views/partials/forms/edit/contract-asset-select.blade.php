<!-- Contract Assets -->
<div id="assigned_asset" class="form-group{{ $errors->has($fieldname) ? ' has-error' : '' }}"{!!  (isset($style)) ? ' style="'.e($style).'"' : ''  !!}>
    <div class="col-md-3 control-label"></div>
    <div class="col-md-7">
        <select class="js-data-ajax select2" data-endpoint="hardware" data-placeholder="{{ trans('general.select_asset') }}" name="{{ $fieldname }}" style="width: 100%" id="{{ (isset($select_id)) ? $select_id : 'assigned_asset_select' }}"{{ (isset($multiple)) ? ' multiple' : '' }}{!! (!empty($asset_status_type)) ? ' data-asset-status-type="' . $asset_status_type . '"' : '' !!}>

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
    <div class="col-md-1 col-sm-1 text-left">
        <a class="btn btn-sm btn-warning" onclick="addContractAsset($asset_id)">Add</a>
    </div>
</div>

