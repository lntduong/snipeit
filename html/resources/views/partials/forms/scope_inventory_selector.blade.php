<div class="form-group" id="assignto_selector"{!!  (isset($style)) ? ' style="'.e($style).'"' : ''  !!}>
    {{ Form::label('name', trans('admin/hardware/form.checkout_to'), array('class' => 'col-md-3 control-label')) }}
    <div class="col-md-8">
        <div class="btn-group" data-toggle="buttons">
            @if ((isset($company_select)) && ($company_select!='false'))
            <label class="btn btn-default {{ ($check=="company")? "active" : "" }}">
                <input name="checkout_inventory_to_type" value="company" type="radio" {{ ($check=="company")? "checked" : "" }}> {{trans('general.company')}}
            </label>
            @endif
            @if ((isset($store_select)) && ($store_select!='false'))
            <label class="btn btn-default {{ ($check=="store")? "active" : "" }}">
                <input name="checkout_inventory_to_type" value="store" type="radio" {{ ($check=="store")? "checked" : "" }}> {{trans('admin/contracts/table.store')}}
            </label>
            @endif
            @if ((isset($department_select)) && ($department_select!='false'))
            <label class="btn btn-default {{ ($check=="department")? "active" : "" }}">
                <input name="checkout_inventory_to_type" value="department" class="active" type="radio" {{ ($check=="department")? "checked" : "" }}> {{trans('general.department')}}
            </label>
            @endif
            @if ((isset($contract_select)) && ($contract_select!='false'))
            <label class="btn btn-default {{ ($check=="contract")? "active" : "" }}">
                <input name="checkout_inventory_to_type" value="contract" class="active" type="radio" {{ ($check=="contract")? "checked" : "" }}> {{trans('general.contract')}}
            </label>
            @endif

            {!! $errors->first('checkout_inventory_to_type', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
        </div>
    </div>
</div>
