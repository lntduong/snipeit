<!-- Status -->
<div id="{{ $fieldname }}" class="form-group{{ $errors->has($fieldname) ? ' has-error' : '' }}">
    {{ Form::label($fieldname, $translated_name, array('class' => 'col-md-3 control-label')) }}
    <div class="col-md-7">
    <select class="js-data-ajax" data-endpoint="statuslabels" data-placeholder="{{ trans('admin/inventory/table.select_status') }}" name="{{ $fieldname }}" style="width: 100%" id="status_select">
            @if ($statusSelect = Input::old($fieldname, (isset($asset)) ? $asset->{$fieldname} : ''))
                <option value="{{ $statusSelect }}" selected="selected">
                    {{ (\App\Models\Statuslabel::find($statusSelect)) ? \App\Models\Statuslabel::find($statusSelect)->name : '' }}
                </option>
            @else
                <option value="">{{ trans('admin/inventory/table.select_status') }}</option>
            @endif
        </select>
    </div>
    {!! $errors->first($fieldname, '<div class="col-md-8 col-md-offset-3"><span class="alert-msg"><i class="fa fa-times"></i> :message</span></div>') !!}
</div>
