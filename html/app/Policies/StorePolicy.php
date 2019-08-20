<?php

namespace App\Policies;

use App\Policies\SnipePermissionsPolicy;

class StorePolicy extends SnipePermissionsPolicy
{
    protected function columnName()
    {
        return 'stores';
    }
}