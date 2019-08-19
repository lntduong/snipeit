<!-- **
 * @author [Duong.LNT]
 * -->
<table
    data-columns="{{ \App\Presenters\ContractAssetsPresenter::dataTableLayout() }}"
    data-cookie-id-table="table_contract_assets"
    data-id-table="table_contract_assets"
    data-side-pagination="server"
    data-toolbar="#toolbar"
    data-sort-order="asc"
    data-sort-name="name"
    id="table_contract_assets"
    class="table table-striped snipe-table"
    data-url="{{ route('contractassets.save') }}" 
    >
</table>
@section('moar_scripts')
  @include ('partials.bootstrap-table')
@stop

