@extends('layouts.default')

{{-- Page title --}}
@section('title')
    @if ($item->id)
        {{ $updateText }}
    @else
        {{ $createText }}
    @endif
@parent
@stop

@section('header_right')
<a href="{{ URL::previous() }}" class="btn btn-primary pull-right">
    {{ trans('general.back') }}</a>
@stop



{{-- Page content --}}

@section('content')

<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="alert alert-success fade in" id="mgsContract" style="display: none;">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <i class="fa fa-check faa-pulse animated"></i>
            <strong>Success: </strong>
            Contract created successfully. :)
        </div>
        <div class="box box-default">
            <div class="box-header with-border">
            <h3 class="box-title">
            @if ($item->id)
            {{ $item->display_name }}
            @endif
            </h3>
                @if (isset($helpText))
                    <div class="box-tools pull-right">
                        <button class="slideout-menu-toggle btn btn-box-tool btn-box-tool-lg" data-toggle="tooltip" title="Help"><i class="fa fa-question"></i></button>
                    </div>
                @endif
            </div><!-- /.box-header -->

            <div class="box-body">
                <form id="create-form" class="form-horizontal" method="post" action="{{ (isset($formAction)) ? $formAction : \Request::url()  }}" autocomplete="off" role="form" enctype="multipart/form-data">

                    @if ($item->id)
                    {{ method_field('PUT') }}
                    @endif


                    <!-- CSRF Token -->
                    {{ csrf_field() }}
                    @yield('inputFields')
                    @include('partials.forms.edit.submit')
                    <div class="alert alert-success fade in" id="plzAddContract" style="display: none;">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <i class="fa fa-check faa-pulse animated"></i>
                        {{ trans('admin/contracts/message.require_add_contract') }}
                    </div>
                    <div class="alert alert-success fade in" id="mgsContractAssets" style="display: none;">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <i class="fa fa-check faa-pulse animated"></i>
                        <strong>{{ trans('admin/contracts/message.success') }} </strong>
                        {{ trans('admin/contracts/message.create_contract_assets') }}
                    </div>
                    <div class="alert alert-warning fade in" id="mgsContractAssetsFailed" style="display: none;">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <i class="fa fa-check faa-pulse animated"></i>
                        <strong>{{ trans('admin/contracts/message.fail') }}</strong>
                            {{ trans('admin/contracts/message.asset_required') }}
                    </div>
                    <div class="alert alert-success fade in" id="mgsContractAssetsDel" style="display: none;">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <i class="fa fa-check faa-pulse animated"></i>
                        <strong>{{ trans('admin/contracts/message.success') }} </strong>
                        {{ trans('admin/contracts/message.delete_contract_assets') }}
                    </div>
                    <!-- Contract Assets -->
                    <div id="hideForm" style="display: none;">
                        <h4 class="box-title">{{ trans('admin/contracts/table.contract_assets') }}</h4>
                        @include ('partials.forms.edit.contract-asset-select', ['translated_name' => trans('admin/asset_maintenances/table.asset_name'), 'fieldname' => 'asset_id', 'required' => 'true'])
                        <div>
                        @include ('contractassets.index')
                        </div>
                        <input type="hidden" value="{{$item->id}}" id="result-contract-id">
                    </div>
                </form>
            </div>
        </div>
    </div>

    @if ((isset($helpText)) && (isset($helpTitle)))
    <div class="slideout-menu">
        <a href="#" class="slideout-menu-toggle pull-right">×</a>
        <h3>
            {{ $helpTitle}}
        </h3>
        <p>{{ $helpText }} </p>
    </div>
    @endif
</div>

@stop
