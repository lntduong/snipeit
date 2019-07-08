<div id="{{ $fieldname }}" class="form-group">
    {{ Form::label($fieldname, $translated_name, array('class' => 'col-md-3 control-label')) }}
    <div class="col-md-7 {{isset($required) ? ((\App\Helpers\Helper::checkIfRequired($item, 'contract_id')) ? ' required' : '') : '' }}">
        <select class="contract_select" data-endpoint="contract" data-placeholder="Select contract" name="{{ $fieldname }}" style="width: 100%" id="contract_select">
            @if ($contract_id = Input::old($fieldname, (isset($item)) ? $item->{$fieldname} : ''))
                <option value="{{ $contract_id }}" selected="selected">
                    {{ (\App\Models\Contract::find($contract_id)) ? \App\Models\Contract::find($contract_id)->name : '' }}
                </option>
            @else
                <option value="">Select contract</option>
            @endif
        </select>
    </div>
    {!! $errors->first($fieldname, '<div class="col-md-8 col-md-offset-3"><span class="alert-msg"><i class="fa fa-times"></i> :message</span></div>') !!}

</div>
