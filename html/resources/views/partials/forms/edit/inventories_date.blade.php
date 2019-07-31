<!-- Purchase Date -->
<div class="form-group {{ $errors->has('purchase_date') ? ' has-error' : '' }}">
<label for="purchase_date" class="col-md-3 control-label">{{trans('admin/inventories/table.inventory_date')}}</label>
   <div class="input-group col-md-3 {{  (\App\Helpers\Helper::checkIfRequired($item, 'inventory_date')) ? ' required' : '' }}">
        <div class="input-group date" data-provide="datepicker" data-date-format="yyyy-mm-dd"  data-autoclose="true">
            <input type="text" class="form-control" placeholder="{{ trans('general.select_date') }}" name="inventory_date" id="inventory_date" value="{{ Input::old('inventory_date', ($item->inventory_date) ? $item->inventory_date->format('Y-m-d') : '') }}">
            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
       </div>
       {!! $errors->first('inventory_date', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
   </div>
</div>

