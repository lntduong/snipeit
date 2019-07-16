<?php

namespace App\Presenters;

class ContractPresenter extends Presenter
{
    
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
                "field" => "name",
                "searchable" => true,
                "sortable" => true,
                "title" => trans('admin/contracts/table.contract_name'),
                "visible" => true,
             
            ],
            [
                "field" => "store_id",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('admin/contracts/table.store'),
                "visible" => true,
                "formatter" => "storeLinkObjFormatter"
            ],
            [
                "field" => "location_id",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('admin/contracts/table.location'),
                "visible" => true,
                "formatter" => "locationsLinkObjFormatter"
            ],

            [
                "field" => "contact_id_1",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" =>  trans('admin/contracts/table.contact_person1'),
                "visible" => true,
                "formatter" => "usersLinkObjFormatter"
            ],
            [
                "field" => "contact_id_2",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" =>  trans('admin/contracts/table.contact_person2'),
                "visible" => true,
                "formatter" => "usersLinkObjFormatter"
            ],
            [
                "field" => "start_date",
                "searchable" => false,
                "sortable" => true,
                "switchable" => true,
                "title" =>  trans('admin/contracts/table.start_date'),
                "visible" => true,
            ],
            [
                "field" => "end_date",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" =>  trans('admin/contracts/table.end_date'),
                "visible" => true,
            ],
            [
                "field" => "billing_date",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" =>  trans('admin/contracts/table.billing_date'),
                "visible" => true,
                "id" => "billing_date",
                "class" => "billing_date"
                
            ],
            [
                "field" => "payment_date",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" =>  trans('admin/contracts/table.payment_date'),
                "visible" => true,
            ]
            
        ];

        $layout[] = [
            "field" => "actions",
            "searchable" => false,
            "sortable" => false,
            "switchable" => false,
            "title" => trans('table.actions'),
            "formatter" => "contractsActionsFormatter",
        ];

        return json_encode($layout);
    }

}