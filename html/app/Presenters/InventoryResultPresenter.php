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
                "title" => trans('admin/inventories/table.device_image'),
                "visible" => true,
                "formatter" => "imageFormatter"
            ],
            [
                "field" => "asset_tag",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('admin/hardware/table.asset_tag'),
                "visible" => true,
                "formatter" => "inventoryresultsHardwareLinkFormatter"
            ],
            [
                "field" => "checked",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('admin/inventories/table.checked'),
                "visible" => true,

            ],
            [
                "field" => "familiar",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('admin/inventories/table.recognized'),
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

    /**
     * Json Column Layout for bootstrap table - Scan Result Layout
     * @version 1.0
     * @author ThongLT
     * @return JSON
     */
    public static function scanTableLayout()
    {
        $layout = [
            [
                "field" => "asset_id",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('admin/hardware/form.name'),
                "visible" => true,
                "formatter" => 'scanHardwareLinkFormatter',
            ], [
                "field" => "asset_tag",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('admin/hardware/table.asset_tag'),
                "visible" => true,
                "formatter" => "scanTagLinkFormatter"
            ], [
                "field" => "status_label",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('admin/hardware/table.status'),
                "visible" => true,
                "formatter" => 'scanStatusFormatetter',
            ], [
                "field" => "checked",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('admin/inventories/table.checked'),
                "visible" => true,
                "formatter" => 'scanDateDisplayFormatter',
            ], [
                "field" => "familiar",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('admin/inventories/table.recognized'),
                "visible" => true,
                "formatter" => 'resultRecognizedFormatter',
            ], [
                "field" => "actions",
                "searchable" => false,
                "sortable" => false,
                "switchable" => false,
                "title" => trans('table.actions'),
                "formatter" => "scanActionsFormatter",
            ]
        ];

        return json_encode($layout);
    }

    /**
     * Json Column Layout for bootstrap table - Offline Result Layout
     * @version 1.0
     * @author ThongLT
     * @return JSON
     */
    public static function offlineSearchTableLayout()
    {
        $layout = [
            [
                "field" => "asset_id",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('admin/hardware/form.name'),
                "visible" => true,
                "formatter" => 'scanHardwareLinkFormatter',
            ], [
                "field" => "asset_tag",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('admin/hardware/table.asset_tag'),
                "visible" => true,
                "formatter" => "scanTagLinkFormatter"
            ], [
                "field" => "checked",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('admin/inventories/table.checked'),
                "visible" => true,
                "formatter" => 'scanDateDisplayFormatter',
            ], [
                "field" => "familiar",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('admin/inventories/table.recognized'),
                "visible" => true,
                "formatter" => 'resultRecognizedFormatter',
            ], [
                "field" => "status_label",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('admin/hardware/table.status'),
                "visible" => true,
                "formatter" => 'scanStatusFormatetter',
            ]
        ];

        return json_encode($layout);
    }
}