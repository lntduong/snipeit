<?php
namespace App\Presenters;

use App\Models\CustomField;
use DateTime;

/**
 * Class AssetPresenter
 * @package App\Presenters
 */
/**
 * @author [Duong.LNT]
 */
class ContractAssetsPresenter extends Presenter
{
    /**
     * Json Column Layout for bootstrap table
     * @return string
     */
    public static function dataTableLayout()
    {
        $layout = [
            [
                "field" => "id",
                "searchable" => false,
                "switchable" => true,
                "title" => trans('general.id'),
                "visible" => false
            ], [
                "field" => "name",
                "searchable" => true,
                "title" => trans('admin/hardware/form.name'),
                "visible" => true,
                "formatter" => "hardwareLinkFormatter",
                "sortable" => true,
            ], [
                "field" => "image",
                "searchable" => false,
                "switchable" => true,
                "title" => trans('admin/hardware/table.image'),
                "visible" => true,
            ]
        ];

        $layout[] = [
            "field" => "actions",
            "switchable" => false,
            "title" => trans('table.actions'),
        ];

        return json_encode($layout);
    }
}
