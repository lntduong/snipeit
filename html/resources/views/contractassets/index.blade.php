
<table
    data-columns="{{ \App\Presenters\ContractAssetsPresenter::dataTableLayout() }}"
    data-cookie-id-table="table_contract_assets"
    data-id-table="table_contract_assets"
    data-side-pagination="server"
    data-sort-order="asc"
    data-sort-name="name"
    data-toolbar="#toolbar"
    id="table_contract_assets"
    class="table table-striped snipe-table"
    data-url="{{ route('contractAsset.storeAsset') }}" 
    >
</table>

