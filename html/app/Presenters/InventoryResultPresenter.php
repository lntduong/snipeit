<?php

namespace App\Presenters;

use App\Helpers\Helper;

/**
 * Class ComponentPresenter
 * @package App\Presenters
 */
class InventoryResultPresenter extends Presenter
{

    /**
     * Json Column Layout for bootstrap table
     * @return string
     */
    public static function dataTableLayout()
    {
        $layout = [
            
            [
                "field" => "deviece",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('admin/hardware/form.name'),
                "visible" => true,
                "formatter" => 'inventoryresultsLinkFormatter',
            ],
            [
                "field" => "image",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('admin/inventory/table.device_image'),
                "visible" => true,
                "formatter" => "imageFormatter"
            ],
            [
                "field" => "asset_tag",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('admin/hardware/table.asset_tag'),
                "visible" => true,
                "formatter" => "hardwareLinkFormatter"
            ],
            [
                "field" => "checked",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('admin/inventory/table.checked'),
                "visible" => true,
                "formatter" => 'dateDisplayFormatter',
            ],
            [
                "field" => "familiar",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('admin/inventory/table.recognized'),
                "visible" => true,
                "formatter" => 'RecognizedFormatter',
            ],
            [
                "field" => "status_label",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('admin/hardware/table.status'),
                "visible" => true,
                "formatter" => 'statuslabelsLinkObjFormatter',
            ],
            
        ];
        $layout[] = [
            "field" => "actions",
            "searchable" => false,
            "sortable" => false,
            "switchable" => false,
            "title" => trans('table.actions'),
            "formatter" => "inventoryresultsActionsFormatter",
        ];


        return json_encode($layout);
    }
}
