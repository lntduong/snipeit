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
<a href="#" id="offdata" class="btn btn-primary pull-right" style="margin-right: 5px;">  Offline Data Sync</a>
@stop

{{-- Page content --}}

@section('content')

<div class="row">
    <div class="col-md-12">
        <div class="box box-default">
            <div class="box-body">
                <form id="create-form" class="form-horizontal" method="post" action="{{ (isset($formAction)) ? $formAction : \Request::url()  }}" autocomplete="off" role="form" enctype="multipart/form-data">

                    @if ($item->id)
                    {{ method_field('PUT') }}
                    @endif
                    {{ csrf_field() }}
                    @yield('inputFields')
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
