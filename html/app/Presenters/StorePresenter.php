<?php

namespace App\Presenters;

/**
 * Class ComponentPresenter
 * @package App\Presenters
 */
class StorePresenter extends Presenter
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
                "sortable" => true,
                "switchable" => true,
                "title" => trans('general.id'),
                "visible" => false
            ],
            [
                "field" => "company",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('general.company'),
                "visible" => false,
                "formatter" => 'companiesLinkObjFormatter',
            ],
            [
                "field" => "name",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('general.store_name'),
                "visible" => false,
                "formatter" => 'storeLinkFormatter',
            ], [
                "field" => "image",
                "searchable" => false,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('general.image'),
                "visible" => true,
                "formatter" => 'imageFormatter',
            ], [
                "field" => "location",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('general.location'),
                "formatter" => "locationsLinkObjFormatter"
            ], 
        ];
        $layout[] = [
            "field" => "actions",
            "searchable" => false,
            "sortable" => false,
            "switchable" => false,
            "visible" => false,
            "title" => trans('table.actions'),
            "formatter" => "storeActionsFormatter",
        ];

        return json_encode($layout);
    }

}
