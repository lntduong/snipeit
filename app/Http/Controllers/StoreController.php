<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use App\Models\Location;
use App\Models\Company;
use App\Models\Store;
use App\Http\Requests\StoreRequest;
use App\Rules\StoreRule;
use Auth;
use Image;
class StoreController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->authorize('index', Store::class);
        return view('store/index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->authorize('create', Store::class);
        $location = Location::get()->pluck('name','id')->prepend('Please select', '');
        $company = Company::get()->pluck('name','id')->prepend('Please select', '');
        return view('store/edit')->with('item', new Store);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     *  
     */
    public function store(StoreRequest $request)
    {
        $this->authorize(Store::class);

        $store = new Store();
        $store->name = $request->input('name');
        $store->company_id = $request->input('company_id');
        $store->location_id = $request->input('location_id');
        $store->user_id = Auth::id();
        if ($request->file('image')) {
            $image = $request->file('image');
            $file_name = str_random(25).".".$image->getClientOriginalExtension();
            $path = public_path('uploads/store/'.$file_name);
            Image::make($image->getRealPath())->resize(800, null, function ($constraint) {
                $constraint->aspectRatio();
                $constraint->upsize();
            })->save($path);
            $store->image = $file_name;
        }
        if ($store->save()) {
            return redirect()->route('store.index');
        }
        return response()->json(['errors' => $store->getErrors()], 500);
    }
     

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $this->authorize('view', Store::class);

        if (is_null($store = Store::find($id))) {
            return redirect()->route('store.index')
                ->with('error', trans('admin/companies/message.not_found'));
        } else {
            return view('store/view')->with('store',$store);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($storeId)
    {
        if (is_null($item = Store::find($storeId))) {
            return redirect()->route('store.index')
                ->with('error', trans('admin/companies/message.does_not_exist'));
        }

        $this->authorize('update', $item);
        $location = Location::get()->pluck('name','id');
        $company = Company::get()->pluck('name','id');
        return view('store/edit', compact('location','store','company'))->with('item', $item)
        ->with('location', $location)->with('company',$company);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(StoreRequest $request, $storeId)
    {
        if (is_null($store = Store::find($storeId))) {
            return redirect()->route('store.index')->with('error', trans('admin/companies/message.does_not_exist'));
        }

        $this->authorize('update', $store);

        $store->name = $request->input('name');
        $store->company_id = $request->input('company_id');
        $store->location_id = $request->input('location_id');
        //$store = Store::create($request->all());
        $old_image = $store->image;

        // Set the model's image property to null if the image is being deleted
        if ($request->input('image_delete') == 1) {
            $store->image = null;
        }

        if ($request->file('image')) {
            $image = $request->file('image');
            $file_name = $store->id.'-'.str_slug($image->getClientOriginalName()) . "." . $image->getClientOriginalExtension();

            if ($image->getClientOriginalExtension()!='svg') {
                Image::make($image->getRealPath())->resize(800, null, function ($constraint) {
                    $constraint->aspectRatio();
                    $constraint->upsize();
                })->save(app('store_upload_path').$file_name);
            } else {
                $image->move(app('store_upload_path'), $file_name);
            }
            $store->image = $file_name;

        }

        if ((($request->file('image')) && (isset($old_image)) && ($old_image!='')) || ($request->input('image_delete') == 1)) {
            try  {
                unlink(app('store_upload_path').$old_image);
            } catch (\Exception $e) {
                \Log::info($e);
            }
        }

        if ($store->save()) {
            return redirect()->route('store.index')
                ->with('success', trans('admin/companies/message.update.success'));
        }
        return redirect()->route('store.edit', ['store' => $storeId])
            ->with('error', trans('admin/companies/message.update.error'));

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($storeId)
    {
        if (is_null($store = Store::find($storeId))) {
            return redirect()->route('store.index')
                ->with('error', trans('admin/companies/message.not_found'));
        } else {

            $this->authorize('delete', $store);

            try {
                $store->delete();
                return redirect()->route('store.index')
                    ->with('success', trans('admin/companies/message.delete.success'));
            } catch (\Illuminate\Database\QueryException $exception) {
            /*
                 * NOTE: This happens when there's a foreign key constraint violation
                 * For example when rows in other tables are referencing this company
                 */
                if ($exception->getCode() == 23000) {
                    return redirect()->route('store.index')
                        ->with('error', trans('admin/companies/message.assoc_users'));
                } else {
                    throw $exception;
                }
            }
        }
    }
}
