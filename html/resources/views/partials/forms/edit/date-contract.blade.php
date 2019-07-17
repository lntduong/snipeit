<!-- Purchase Date -->
<div class="form-group form-inline {{ $errors->has('start_date') ? ' has-error' : '' }}">
    <div>
        <label for="start_date" class="col-md-3 control-label">{{ trans('admin/contracts/table.start_date') }}</label>
        <div class="input-inline col-md-3{{  (\App\Helpers\Helper::checkIfRequired($item, 'start_date')) ? ' required' : '' }}">
            <div class="input-group date datepicker-contract" data-provide="datepicker" data-date-format="yyyy-mm-dd"  data-autoclose="true">
                <input type="text" class="form-control" placeholder="{{ trans('general.select_date') }}" name="start_date" id="start_date" value="{{ Input::old('start_date', $item->start_date) }}">
                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
            </div>
            {!! $errors->first('start_date', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
        </div>
    </div>
    <div>
        <label for="end_date" class="col-md-2 control-label">~ {{ trans('admin/contracts/table.end_date') }}</label>
        <div class="input-inline col-md-3{{  (\App\Helpers\Helper::checkIfRequired($item, 'end_date')) ? ' required' : '' }}">
            <div class="input-group date datepicker-contract" data-provide="datepicker" data-date-format="yyyy-mm-dd"  data-autoclose="true">
                <input type="text" class="form-control" placeholder="{{ trans('general.select_date') }}" name="end_date" id="end_date" value="{{ Input::old('end_date', $item->end_date) }}">
                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
            </div>
            {!! $errors->first('end_date', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
        </div>
    </div>
</div>
     
     