<?php
namespace App\Presenters;

use App\Models\CustomField;
use DateTime;

/**
 * Class AssetPresenter
 * @package App\Presenters
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
                "field" => "asset_id",
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('Device Name'),
                "visible" => true,
            ], [
                "field" => "name",
                "searchable" => false,
                "sortable" => true,
                "switchable" => true,
                "title" => trans('admin/hardware/table.image'),
                "visible" => true,
                //"formatter" => "imageFormatter"
            ]
        ];

        // This looks complicated, but we have to confirm that the custom fields exist in custom fieldsets
        // *and* those fieldsets are associated with models, otherwise we'll trigger
        // javascript errors on the bootstrap tables side of things, since we're asking for properties
        // on fields that will never be passed through the REST API since they're not associated with
        // models. We only pass the fieldsets that pertain to each asset (via their model) so that we
        // don't junk up the REST API with tons of custom fields that don't apply

        $fields =  CustomField::whereHas('fieldset', function ($query) {
            $query->whereHas('models');
        })->get();

        foreach ($fields as $field) {
            $layout[] = [
                "field" => 'custom_fields.'.$field->convertUnicodeDbSlug(),
                "searchable" => true,
                "sortable" => true,
                "switchable" => true,
                "title" => ($field->field_encrypted=='1') ?'<i class="fa fa-lock"></i> '.e($field->name) : e($field->name),
                "formatter" => "customFieldsFormatter"
            ];

        }

        $layout[] = [
            "field" => "actions",
            "searchable" => false,
            "sortable" => false,
            "switchable" => false,
            "title" => trans('table.actions'),
            "formatter" => "contractAssetsActionsFormatter",
        ];

        return json_encode($layout);
    }



    /**
     * Generate html link to this items name.
     * @return string
     */
    public function nameUrl()
    {
        return (string) link_to_route('hardware.show', e($this->name), $this->id);
    }

    /**
     * Generate img tag to this items image.
     * @return mixed|string
     */
    public function imageUrl()
    {
        $imagePath = '';
        if ($this->image && !empty($this->image)) {
            $imagePath = $this->image;
        } elseif ($this->model && !empty($this->model->image)) {
            $imagePath = $this->model->image;
        }
        $url = config('app.url');
        if (!empty($imagePath)) {
            $imagePath = "<img src='{$url}/uploads/assets/{$imagePath}' height=50 width=50>";
        }
        return $imagePath;
    }

    /**
     * Generate img tag to this items image.
     * @return mixed|string
     */
    public function imageSrc()
    {
        $imagePath = '';
        if ($this->image && !empty($this->image)) {
            $imagePath = $this->image;
        } elseif ($this->model && !empty($this->model->image)) {
            $imagePath = $this->model->image;
        }
        if (!empty($imagePath)) {
            return config('app.url').'/uploads/assets/'.$imagePath;
        }
        return $imagePath;
    }

    /**
     * Get Displayable Name
     * @return string
     **/
    public function name()
    {

        if (empty($this->model->name)) {
            if (isset($this->model->model)) {
                return $this->model->model->name.' ('.$this->model->asset_tag.')';
            }
            return $this->model->asset_tag;
        }
        return $this->model->name . ' (' . $this->model->asset_tag . ')';

    }

    /**
     * Helper for notification polymorphism.
     * @return mixed
     */
    public function fullName()
    {
        $str = '';
        if ($this->model->name) {
            $str .= $this->name;
        }

        if ($this->asset_tag) {
            $str .= ' ('.$this->model->asset_tag.')';
        }
        if ($this->model->model) {
            $str .= ' - '.$this->model->model->name;
        }
        return $str;
    }

    /**
     * How many months until this asset hits EOL.
     * @return null
     */
    public function months_until_eol()
    {

        $today = date("Y-m-d");
        $d1    = new DateTime($today);
        $d2    = new DateTime($this->eol_date());

        if ($this->eol_date() > $today) {
            $interval = $d2->diff($d1);
        } else {
            $interval = null;
        }

        return $interval;
    }

    /**
     * @return string
     * This handles the status label "meta" status of "deployed" if
     * it's assigned. Should maybe deprecate.
     */
    public function statusMeta()
    {
        if ($this->model->assigned) {
            return 'deployed';
        }
        return $this->model->assetstatus->getStatuslabelType();
    }

    /**
     * @return string
     * This handles the status label "meta" status of "deployed" if
     * it's assigned. Should maybe deprecate.
     */
    public function statusText()
    {
        if ($this->model->assigned) {
            return trans('general.deployed');
        }
        return $this->model->assetstatus->name;
    }

    /**
     * @return string
     * This handles the status label "meta" status of "deployed" if
     * it's assigned. Results look like:
     *
     * (if assigned and the status label is "Ready to Deploy"):
     * (Deployed)
     *
     * (f assigned and status label is not "Ready to Deploy":)
     * Deployed (Another Status Label)
     *
     * (if not deployed:)
     * Another Status Label
     */
    public function fullStatusText() {
        // Make sure the status is valid
        if ($this->assetstatus) {

            // If the status is assigned to someone or something...
            if ($this->model->assigned) {

                // If it's assigned and not set to the default "ready to deploy" status
                if ($this->assetstatus->name != trans('general.ready_to_deploy')) {
                    return trans('general.deployed'). ' (' . $this->model->assetstatus->name.')';
                }

                // If it's assigned to the default "ready to deploy" status, just
                // say it's deployed - otherwise it's confusing to have a status that is
                // both "ready to deploy" and deployed at the same time.
                return trans('general.deployed');
            }

            // Return just the status name
            return $this->model->assetstatus->name;
        }

        // This status doesn't seem valid - either data has been manually edited or
        // the status label was deleted.
        return 'Invalid status';
    }

    /**
     * Date the warantee expires.
     * @return false|string
     */
    public function warrantee_expires()
    {
        if (($this->purchase_date) && ($this->warranty_months)) {
            $date = date_create($this->purchase_date);
            date_add($date, date_interval_create_from_date_string($this->warranty_months . ' months'));
            return date_format($date, 'Y-m-d');
        }

        return false;
    }

    /**
     * Url to view this item.
     * @return string
     */
    public function viewUrl()
    {
        return route('hardware.show', $this->id);
    }

    public function glyph()
    {
        return '<i class="fa fa-barcode"></i>';
    }
}
