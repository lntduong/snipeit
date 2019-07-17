<?php
namespace App\Http\Controllers;

use App\Models\Inventory;

class InventorysController extends Controller
{
    public function create()
    {
        return view('inventory/edit')
            ->with('item', new Inventory);
    }
}
