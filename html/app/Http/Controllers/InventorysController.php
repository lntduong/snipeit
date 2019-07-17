<?php
namespace App\Http\Controllers;

use App\Helpers\Helper;
use App\Models\Inventory;
use App\Models\Setting;

class InventorysController extends Controller
{
    public function create()
    {
        $setting = Setting::first();
        return view('inventory/edit')
            ->with('item', new Inventory)
            ->with('statuslabel_list', Helper::statusLabelList())
            ->with('asset_tag', $setting->auto_increment_prefix);
    }
}
