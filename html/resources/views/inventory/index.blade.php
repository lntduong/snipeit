@extends('layouts/default')
{{-- Page title --}}
@section('title')
{{ trans('general.inventory') }}
@parent
@stop
@section('header_right')
@can('create', \App\Models\Component::class)
<a href="{{ route('inventory.create') }}" class="btn btn-primary pull-right"> {{ trans('general.create') }}</a>
@endcan
@stop
{{-- Page content --}}
@section('content')
<div class="row">
   <div class="col-md-12">
      <div class="box">
         <div class="box-body">
            <div class="row">
               <div class="col-md-3">
                  @if (Input::get('status')!='Deleted')
                  <div id="toolbar">
                     <label> {{ trans('admin/inventory/table.company') }} : </label>
                     <select name="company_id" class="form-control select2" id="company_id">
                        @foreach($company as $cp)
                        <option value="{{$cp->id}}">{{$cp->name}}</option>
                        @endforeach
                     </select>
                  </div>
                  @endif
               </div>
               <div class="col-md-12">
                  <table
                  data-columns="{{ \App\Presenters\InventoryPresenter::dataTableLayout() }}"
                  data-cookie-id-table="inventoryTable"
                  data-toolbar="#toolbar"
                  data-pagination="true"
                  data-id-table="inventoryTable"
                  data-search="true"
                  data-side-pagination="server"
                  data-show-columns="true"
                  data-show-export="true"
                  data-show-footer="true"
                  data-show-refresh="true"
                  data-sort-order="asc"
                  data-sort-name="name"
                  id="inventoryTable"
                  class="table table-striped snipe-table"
                  data-url="{{ route('api.inventory.index') }}"
                  data-export-options='{
                  "fileName": "export-components-{{ date('Y-m-d') }}",
                  "ignoreColumn": ["actions","image","change","checkbox","checkincheckout","icon"]
                  }'>
                  </table>
               </div>
               <!-- /.col -->
            </div>
            <!-- /.row -->
         </div>
         <!-- /.box-body -->
      </div>
      <!-- /.box -->
   </div>
</div>
@stop
@section('moar_scripts')
@include ('partials.bootstrap-table', ['exportFile' => 'components-export', 'search' => true, 'showFooter' => true, 'columns' => \App\Presenters\StorePresenter::dataTableLayout()])
<script>
   $table = $('#inventoryTable')
   $('#company_id').change(function () {
     var company_id1=$('#company_id').val();
     var temp = {
       url: '{{ route('api.inventory.index',['company_id' => '']) }}' + company_id1
     };
     $table.bootstrapTable('refresh', temp);
   });   
   
</script>
@stop

