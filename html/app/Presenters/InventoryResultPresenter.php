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
                "title" => trans('admin/inventory/table.device'),
                "visible" => true,
                "formatter" => 'inventoryresultLinkFormatter',
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
                "field" => "checked",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('admin/inventory/table.checked'),
                "visible" => true,
                "formatter" => 'dateDisplayFormatter',
            ],
            [
                "field" => "recognized",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('admin/inventory/table.recognized'),
                "visible" => true,
                "formatter" => 'RecognizedFormatter',
            ],
            
        ];
        $layout[] = [
            "field" => "actions",
            "searchable" => false,
            "sortable" => false,
            "switchable" => false,
            "title" => trans('table.actions'),
            "formatter" => "inventoryresultActionsFormatter",
        ];


        return json_encode($layout);
    }
}
