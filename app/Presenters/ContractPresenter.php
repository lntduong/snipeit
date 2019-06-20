<?php

namespace App\Presenters;

/**
 * Class CompanyPresenter
 * @package App\Presenters
 */
class ContractPresenter extends Presenter
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
                "field" => "name",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('Contract Name'),
                "visible" => true,
            ],[
                "field" => "store",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('Store Name'),
                "visible" => true,
                'formatter' => 'storeLinkObjFormatter',
            ],
            [
                "field" => "location",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('Location'),
                "visible" => true,
                'formatter' => 'locationsLinkObjFormatter',
            ],
            [
                "field" => "contact_id_1",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('Contact Person 1'),
                "visible" => true,
                "formatter" => "usersLinkObjFormatter"
            ],
            [
                "field" => "contact_id_2",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('Contact Person 2'),
                "visible" => true,
                "formatter" => "usersLinkObjFormatter"
            ],
            [
                "field" => "start_date",
                "searchable" => false,
                "sortable" => true,
                "visible" => false,
                "title" => trans('Start Date'),
                'formatter' => 'dateDisplayFormatter'
            ],
            [
                "field" => "end_date",
                "searchable" => false,
                "sortable" => true,
                "visible" => false,
                "title" => trans('End Date'),
                'formatter' => 'dateDisplayFormatter'
            ],
            [
                "field" => "billing_date",
                "searchable" => false,
                "sortable" => true,
                "visible" => false,
                "title" => trans('Billing Date'),
                'formatter' => 'dateDisplayFormatter'
            ],
            [
                "field" => "payment_date",
                "searchable" => false,
                "sortable" => true,
                "visible" => false,
                "title" => trans('Payment Date'),
                'formatter' => 'dateDisplayFormatter'
            ],
            [
                "field" => "terms_and_conditions",
                "searchable" => false,
                "sortable" => true,
                "visible" => false,
                "title" => trans('Terms and Conditions'),
            ],
            [
                "field" => "notes",
                "searchable" => false,
                "sortable" => true,
                "visible" => false,
                "title" => trans('Notes'),
            ],
            [
                "field" => "updated_at",
                "searchable" => false,
                "sortable" => true,
                "visible" => false,
                "title" => trans('general.updated_at'),
                'formatter' => 'dateDisplayFormatter'
            ],[
                "field" => "created_at",
                "searchable" => false,
                "sortable" => true,
                "visible" => false,
                "title" => trans('general.created_at'),
                'formatter' => 'dateDisplayFormatter'
            ],
            [
                "field" => "actions",
                "searchable" => false,
                "sortable" => false,
                "switchable" => false,
                "title" => trans('table.actions'),
                "visible" => true,
                "formatter" => "contractActionsFormatter",
            ]
        ];

        return json_encode($layout);
    }


    /**
     * Link to this companies name
     * @return string
     */
    public function nameUrl()
    {
        return (string) link_to_route('contract.show', $this->name, $this->id);
    }

    /**
     * Url to view this item.
     * @return string
     */
    public function viewUrl()
    {
        return route('contract.show', $this->id);
    }
}
