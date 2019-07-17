<?php
namespace App\Http\Controllers;

use App\Http\Requests\ImageUploadRequest;
use App\Models\Company;
use App\Models\Store;
use Auth;
use Input;
use Image;
use File;

/**
 * @author [Dang.HT]
 * @version[v1.0]
 */
class StoresController extends Controller
{
    /**
    * Returns a view that invokes the ajax tables which actually contains
    * the content for the stores listing, which is generated in getDatatable.
    *
    * @see storesController::getDatatable() method that generates the JSON response
    * @return \Illuminate\Contracts\View\View
    */
    public function index()
    {
        $this->authorize('view', Store::class);
        return view('store/index');
    }


    /**
    * Returns a form to create a new store.
    *
    * @see storesController::postCreate() method that stores the data
    * @return \Illuminate\Contracts\View\View
    */
    public function create()
    {
        $this->authorize('create', Store::class);
        return view('store/edit')->with('item',new Store);
    }


    /**
    * Validate and store data for new store.
    *
    * @see storesController::getCreate() method that generates the view
    * @return \Illuminate\Http\RedirectResponse
     */
    public function store(ImageUploadRequest $request)
    {
        $this->authorize('create', Store::class);
        $store = new Store();
        $store->name                   = $request->input('name');
     
        $store->location_id            = $request->input('location_id');
        $store->company_id             = Company::getIdForCurrentUser($request->input('company_id'));
        $store->user_id                = Auth::id();


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
            return redirect()->route('stores.index')->with('success', trans('admin/store/message.create.success'));
        }
        return redirect()->back()->withInput()->withErrors($store->getErrors());
    }

    /**
    * Return a view to edit a store.
    *
    * @see storesController::postEdit() method that stores the data.
    * @param int $storeId
    * @return \Illuminate\Contracts\View\View
     */
    public function edit($store = null)
    {
        if ($item = Store::find($store)) {
            $this->authorize('update', $item);
            return view('store/edit', compact('item'));
        }
        return redirect()->route('stores.index')->with('error', trans('admin/store/message.not_found'));

    }
    /**
    * Return a view to edit a store.
    *
    * @see storesController::getEdit() method presents the form.
    * @param int $storeId
    * @return \Illuminate\Http\RedirectResponse
     */
    public function update(ImageUploadRequest $request, $storeId = null)
    {
        if (is_null($store = Store::find($storeId))) {
            return redirect()->route('stores.index')->with('error', trans('admin/store/message.not_found'));
        }

        $this->authorize('update', $store);

        // Update the store data
        $store->name                   = Input::get('name');
        $store->location_id            = Input::get('location_id');
        $store->company_id             = Company::getIdForCurrentUser(Input::get('company_id'));
       
        if ($request->file('image')) {
            // delete file image (S)
            $image_path = public_path('uploads/store/'.$store->image); // Value is not URL but directory file path
            if(File::exists($image_path)) {
                File::delete($image_path);
            }
            // delete file image (E)
            $image = $request->file('image');
            $file_name = str_random(25).".".$image->getClientOriginalExtension();
            $path = public_path('uploads/store/'.$file_name);
            Image::make($image->getRealPath())->resize(800, null, function ($constraint) {
                $constraint->aspectRatio();
                $constraint->upsize();
            })->save($path);
            $store->image = $file_name;
        } elseif ($request->input('image_delete') == '1') {
             // delete file image (S)
             $image_path = public_path('uploads/store/'.$store->image); // Value is not URL but directory file path
             if(File::exists($image_path)) {
                 File::delete($image_path);
             }
             // delete file image (E)
            $store->image = null;
            
        }

        if ($store->save()) {
            return redirect()->route('stores.index')->with('success', trans('admin/store/message.update.success'));
        }
        return redirect()->back()->withInput()->withErrors($store->getErrors());
    }

    /**
    * Delete a store.
    *
    * @param int $storeId
    * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($storeId)
    {
        if (is_null($store = Store::find($storeId))) {
            return redirect()->route('stores.index')->with('error', trans('admin/store/message.not_found'));
        }

        $this->authorize('delete', $store);
        $store->delete();
        return redirect()->route('stores.index')->with('success', trans('admin/store/message.delete.success'));
    }

    public function show($id) {
        $this->authorize('view', Store::class);

        if (is_null($store = Store::find($id))) {
            return redirect()->route('stores.index')
                ->with('error', trans('admin/store/message.not_found'));
        } else {
            return view('store/view')->with('store',$store);
        }

    }
    
}
