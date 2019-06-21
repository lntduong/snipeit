<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Transformers\UsersTransformer;
use App\Models\Company;
use App\Models\User;
use App\Helpers\Helper;
use App\Http\Requests\SaveUserRequest;
use App\Models\Contact;
use App\Http\Transformers\AssetsTransformer;
use App\Http\Transformers\SelectlistTransformer;
use App\Http\Transformers\AccessoriesTransformer;

class ContactOneController extends Controller
{
public function selectlist(Request $request)
    {

        $users_contact = User::select(
            [
                'users.id',
                'users.username',
                'users.employee_num',
                'users.first_name',
                'users.last_name',
                'users.gravatar',
                'users.avatar',
                'users.email',
            ]
            )->where('show_in_list', '=', '1');

        $users_contact = Company::scopeCompanyables($users_contact);

        if ($request->filled('search')) {
            $users_contact = $users_contact->SimpleNameSearch($request->get('search'))
                ->orWhere('username', 'LIKE', '%'.$request->get('search').'%')
                ->orWhere('employee_num', 'LIKE', '%'.$request->get('search').'%');
        }

        $users_contact = $users_contact->orderBy('last_name', 'asc')->orderBy('first_name', 'asc');
        $users_contact = $users_contact->paginate(50);

        foreach ($users_contact as $user) {
            $name_str = '';
            if ($user->last_name!='') {
                $name_str .= e($user->last_name).', ';
            }
            $name_str .= e($user->first_name);

            if ($user->username!='') {
                $name_str .= ' ('.e($user->username).')';
            }

            if ($user->employee_num!='') {
                $name_str .= ' - #'.e($user->employee_num);
            }

            $user->use_text = $name_str;
            $user->use_image = ($user->present()->gravatar) ? $user->present()->gravatar : null;
        }

        return (new SelectlistTransformer)->transformSelectlist($users_contact);

    }
}