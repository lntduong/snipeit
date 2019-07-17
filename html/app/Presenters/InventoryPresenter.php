<?php

namespace App\Presenters;

/**
 * Class ComponentPresenter
 * @package App\Presenters
 */
class InventoryPresenter extends Presenter
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
                "title" => trans('general.company'),
                "visible" => true,
                "formatter" => 'companiesLinkObjFormatter',
            ],
            [
                "field" => "store",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('general.store'),
                "visible" => true,
                "formatter" => 'storesLinkObjFormatter',
            ],
            [
                "field" => "contract",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('general.contract'),
                "visible" => true,
             
            ],
            [
                "field" => "date",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('general.date'),
                "visible" => true,
                "formatter" => "dateDisplayFormatter"
              
            ],
            [
                "field" => "name",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('admin/inventory/table.inventory'),
                "visible" => true,
               
            ],
            [
                "field" => "notes",
                "searchable" => true,
                "sortable" => true,
                "visible" => false,
                "title" => trans('general.notes'),

            ],
        ];
        $layout[] = [
            "field" => "actions",
            "searchable" => false,
            "sortable" => false,
            "switchable" => false,
            "visible" => true,
            "title" => trans('table.actions'),
            "formatter" => "inventoriesActionsFormatter",
        ];


        return json_encode($layout);
    }
}
