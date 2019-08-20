<?php

namespace App\Policies;

use App\Policies\SnipePermissionsPolicy;

class InventoryPolicy extends SnipePermissionsPolicy
{
    protected function columnName()
    {
        return 'inventories';
    }
}