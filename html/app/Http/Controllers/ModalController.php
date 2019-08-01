<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Helpers\Helper;
use App\Models\Asset;
use App\Models\InventoryResult;
use App\Models\Inventory;
use DB;
class ModalController extends Controller
{
    function location() {
        return view('modals.location');
    }

    function model() {
        return view('modals.model');
    }

    function statuslabel() {
        return view('modals.statuslabel')->with('statuslabel_types', Helper::statusTypeList());
    }

    function supplier() {
        return view('modals.supplier');
    }

    function user() {
        return view('modals.user');
    }

    function category() {
        return view('modals.category');
    }

    function manufacturer() {
        return view('modals.manufacturer');
    }
    function inventory_result(Request $request) {

            $inventory_id=$request->get('inventory_id');
            $device_id=$request->get('device_id');
            $familiar=$request->get('familiar');
            switch($familiar)
            {
                case '0':{
                    $item = InventoryResult::select('assets.id','inventory_results.status_id')
                    ->join('assets', 'inventory_results.asset_id', '=', 'assets.id')
                    ->where('assets.id',$device_id)
                    ->where('inventory_results.inventory_id',$inventory_id)
                    ->first();
                    $familiar=0;
                    break;
                }
                case '1':{
                    $item = InventoryResult::select('assets.id','inventory_results.status_id')
                    ->join('assets', 'inventory_results.asset_id', '=', 'assets.id')
                    ->where('assets.id',$device_id)
                    ->where('inventory_results.inventory_id',$inventory_id)
                    ->first();
                    $familiar=1;
                    break;
                }
                case "":{
                    $item = Asset::select('assets.*')
                    ->where('id',$device_id)
                    ->first();
                    $familiar=1;
                    break;
                }
            }
            return view('modals.inventory-result',['asset'=>$item,'inventory_id'=>$inventory_id,'familiar'=>$familiar]);
    }

}
