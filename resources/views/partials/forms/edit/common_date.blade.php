<!-- Start Date -->
<div class="form-group {{ $errors->has('start_date') ? ' has-error' : '' }}">
   <label for="start_date" class="col-md-3 control-label">{{ trans('general.start_date') }}</label>
   <div class="input-group col-md-3 required">
        <div class="input-group date " data-provide="datepicker" data-date-format="yyyy-mm-dd"  data-autoclose="true">
            <input type="text" class="form-control" placeholder="{{ trans('general.select_date') }}" name="start_date" id="start_date" value="{{ Input::old('start_date', ($item->start_date) ? $item->start_date->format('Y-m-d') : '') }}">
            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
       </div>
       {!! $errors->first('start_date', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
   </div>
</div>
<div class="form-group {{ $errors->has('end_date') ? ' has-error' : '' }}">
   <label for="end_date" class="col-md-3 control-label">{{ trans('general.end_date') }}</label>
   <div class="input-group col-md-3 required">
        <div class="input-group date " data-provide="datepicker" data-date-format="yyyy-mm-dd"  data-autoclose="true">
            <input type="text" class="form-control" placeholder="{{ trans('general.select_date') }}" name="end_date" id="end_date" value="{{ Input::old('end_date', ($item->end_date) ? $item->end_date->format('Y-m-d') : '') }}">
            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
       </div>
       {!! $errors->first('end_date', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
   </div>
</div>
<div class="form-group {{ $errors->has('billing_date') ? ' has-error' : '' }}">
   <label for="billing_date" class="col-md-3 control-label">{{ trans('general.billing_date') }}</label>
   <div class="input-group col-md-3">
        <div class="input-group date" data-provide="datepicker" data-date-format="yyyy-mm-dd"  data-autoclose="true">
            <input type="text" class="form-control" placeholder="{{ trans('general.select_date') }}" name="billing_date" id="billing_date" value="{{ Input::old('billing_date', ($item->billing_date) ? $item->billing_date->format('Y-m-d') : '') }}">
            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
       </div>
       {!! $errors->first('billing_date', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
   </div>
</div>
<div class="form-group {{ $errors->has('payment_date') ? ' has-error' : '' }}">
   <label for="payment_date" class="col-md-3 control-label">{{ trans('general.payment_date') }}</label>
   <div class="input-group col-md-3">
        <div class="input-group date" data-provide="datepicker" data-date-format="yyyy-mm-dd"  data-autoclose="true">
            <input type="text" class="form-control" placeholder="{{ trans('general.select_date') }}" name="payment_date" id="payment_date" value="{{ Input::old('payment_date', ($item->payment_date) ? $item->payment_date->format('Y-m-d') : '') }}">
            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
       </div>
       {!! $errors->first('payment_date', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
   </div>
</div>

