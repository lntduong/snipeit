<?php

namespace App\Policies;

use App\Policies\SnipePermissionsPolicy;

class InventoryResultPolicy extends SnipePermissionsPolicy
{
    protected function columnName()
    {
        return 'inventoryresults';
    }
}