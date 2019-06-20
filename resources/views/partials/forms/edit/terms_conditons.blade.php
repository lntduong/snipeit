<!-- Terms and conditions -->
<div class="form-group {{ $errors->has('terms_and_conditions') ? ' has-error' : '' }}">
    <label for="terms_and_conditions" class="col-md-3 control-label">{{ trans('admin/hardware/form.terms_and_conditions') }}</label>
    <div class="col-md-7 col-sm-12">
        <textarea class="col-md-6 form-control" id="terms_and_conditions" name="terms_and_conditions">{{ Input::old('terms_and_conditions', $item->terms_and_conditions) }}</textarea>
        {!! $errors->first('terms_and_conditions', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
    </div>
</div>
