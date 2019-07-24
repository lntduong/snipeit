
<div class="form-group" id="assignto_selector"{!!  (isset($style)) ? ' style="'.e($style).'"' : ''  !!}>
    {{ Form::label('name', trans('general.scope'), array('class' => 'col-md-3 control-label')) }}
    <div class="col-md-8">
        <div class="btn-group" data-toggle="buttons">
            @if ((isset($scope_company_contract)) && ($scope_company_contract!='false'))
                <label class="btn btn-default {!! (!$item->id) ? 'active' : (isset($scopeCompany)) ? 'active' : ''!!}">
                    <input name="checkout_to_type_contract" value="company" type="radio" checked="checked"><i class="fa fa-user"></i> {{ trans('general.company') }}
                </label>
            @endif
            @if ((isset($scope_store_contract)) && ($scope_store_contract!='false'))
            <label class="btn btn-default {!!(isset($scopeStore)) ? 'active' : ''!!}">
                <input name="checkout_to_type_contract" value="store" type="radio" {!!  (isset($scopeStore))  ? ' checked="checked"' : ''  !!}><i class="fa fa-barcode"></i> {{ trans('general.store') }}
            </label>
            @endif
            @if ((isset($scope_department_contract)) && ($scope_department_contract!='false'))
            <label class="btn btn-default {!!(isset($scopeDepartment)) ? 'active' : ''!!}">
                <input name="checkout_to_type_contract" value="department" class="active" type="radio" {!!  (isset($scopeDepartment))  ? ' checked="checked"' : ''  !!}"><i class="fa fa-map-marker"></i> {{ trans('general.department') }}
            </label>
            @endif

            {!! $errors->first('checkout_to_type_contract', '<span class="alert-msg"><i class="fa fa-times"></i> :message</span>') !!}
        </div>
    </div>
</div>
