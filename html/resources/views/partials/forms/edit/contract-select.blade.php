<!-- Contracts -->
<div id="{{ $fieldname }}" class="form-group{{ $errors->has($fieldname) ? ' has-error' : '' }}" {!!  (isset($style)) ? ' style="'.e($style).'"' : ''  !!}>
    {{ Form::label($fieldname, $translated_name, array('class' => 'col-md-3 control-label')) }}
    <div class="col-md-7 col-sm-12{{  (\App\Helpers\Helper::checkIfRequired($item, $fieldname)) ? ' required' : '' }}">
        <select class="contract_select" style="width:100%" data-placeholder="{{ trans('admin/contracts/table.select_contract') }}" id="contract_select" name="{{$fieldname}}">
        @if ($contract_id = Input::old($fieldname, (isset($item)) ? $item->{$fieldname} : ''))
            <option value="{{ $contract_id }}" selected="selected">
                {{ (\App\Models\Contract::find($contract_id)) ? \App\Models\Contract::find($contract_id)->name : '' }}
            </option>
        @else
            <option value="">{{ trans('admin/contracts/table.select_contract') }}</option>
        @endif
        </select>
        <span class="select2-selection__arrow needsclick" role="presentation"><b role="presentation"></b></span>
    </div>
    {!! $errors->first($fieldname, '<div class="col-md-8 col-md-offset-3"><span class="alert-msg"><i class="fa fa-times"></i> :message</span></div>') !!}
    @if (isset($help_text))
    <div class="col-md-7 col-sm-11 col-md-offset-3">
        <p class="help-block">{{ $help_text }}</p>
    </div>
    @endif 
</div>
    

    
    
    