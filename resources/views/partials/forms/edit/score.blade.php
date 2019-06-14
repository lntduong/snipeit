<!-- Score -->
<div class="row">
<div class="col-xs-8 form-group {{ $errors->has('score') ? ' has-error' : '' }}">
    <label for="score" class="col-md-3 control-label">{{ $translated_name }}</label>
    <div class="select2">
        <input class="form-control" type="text" name="score" id="score" value="{{ Input::old('score', $item->score) }}" style="width:336px" />
        {!! $errors->first('score', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
    </div>
</div>
</div>