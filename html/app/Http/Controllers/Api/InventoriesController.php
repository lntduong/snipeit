<?php
namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\Store;
use App\Models\Department;
use App\Models\Contract;
use App\Models\Setting;
use Illuminate\Http\Request;
use App\Models\ContractAsset;
use App\Models\Inventory;
use App\Http\Transformers\SelectlistTransformer;
use App\Models\InventoryResult;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use App\Models\Asset;
use DateTime;
use App\Http\Transformers\SelectlistInventoryTransformer;
use App\Http\Transformers\InventoriesTransformer;
use Input;
/**
 * @version    v1.0
 * @author [Thinh.NP]
 */
class InventoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return list Tableinventory
     */
    public function index(Request $request)
    {
        $this->authorize('view', Inventory::class);
        $inventory = Inventory::select('inventories.*')
        ->with('company')
        ->with('store')
        ->with('department')
        ->with('contract');
        if ($request->input('search')) {
            $inventory = $inventory->TextSearch($request->input('search'));
        }
        $company=$request->input('company_id');
        $store=$request->input('store_id');
        $department=$request->input('department_id');
        $contract=$request->input('contract_id');
        $inventory=self::filter($company,$store,$department,$contract,$inventory);
        
        $offset = (($inventory) && (request('offset') > $inventory->count())) ? 0 : request('offset', 0);
        $limit = request('limit', 50);
        $order = $request->input('order') === 'asc' ? 'asc' : 'desc';

        $allowed_columns = [
           'name'
        ];
        $sort = in_array($request->input('sort'), $allowed_columns) ? $request->input('sort') : 'created_at';
        $total = $inventory->count();
        $inventory->orderBy($sort, $order);

        $inventory = $inventory->skip($offset)->take($limit)->get();
        return (new InventoriesTransformer)->transformInventories($inventory, $total);
    }
    
    /**
     * Display all assets attached to a component
     * @param Request $request
     * @return List Selectlistinventory
    */
    public function selectlist(Request $request)
    {
        $page = Input::get('page', 1);
        $paginate = 50;
        $inventories = Inventory::select([
            'inventories.*'
        ]);
        $company=$request->get('company');
        $store=$request->get('store');
        $department=$request->get('data');
        $contract=$request->get('data');
        $inventories=self::filter($company,$store,$department,$contract,$inventories);
        if ($request->input('search')) {
            $inventories = $inventories->where('inventories.name', 'LIKE', '%'.$request->get('search').'%');
        }
        $inventories=$inventories->get();
        $slice = array_slice($inventories->toArray(), $paginate * ($page - 1), $paginate);
        $result = new \Illuminate\Pagination\LengthAwarePaginator($slice, count($inventories), $paginate);
        return (new SelectlistTransformer)->transformSelectlistContract($result);
    }
    /**
     * fillter inventory
     * @param company,store,department,contract,inventory
     * @return Inventory
    */
    public function filter($company = "",$store = "",$department = "",$contract = "",$inventory)
    {
        if ($department) {
            if($contract){
                $inventory = $inventory
                ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"') )
                ->whereIn('inventories.object_id', 
                    Contract::select('contracts.id')
                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn('contracts.object_id', 
                        Department::select('departments.id')
                        ->where('departments.id','=',$department)
                    )
                );
            
            } else {
                    $inventory = $inventory
                ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                ->whereIn(
                    'inventories.object_id',
                    Department::select('departments.id')
                    ->join('stores', 'stores.id', '=', 'departments.store_id')
                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                    ->where('departments.id', '=', $department)
                )
                ->union(
                    Inventory::select('inventories.*')
                    ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                    ->whereIn(
                        'inventories.object_id',
                        Contract::select('contracts.id')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn(
                            'contracts.object_id',
                            Department::select('departments.id')
                            ->where('departments.id', '=', $department)
                        )
                    )
                );
            }
          
          
     
        } else{
            if($store) {
                if ($contract) {
                    $inventory = $inventory
                    ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"') )
                    ->whereIn('inventories.object_id', 
                        Contract::select('contracts.id as id')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn('contracts.object_id', 
                            Department::select('departments.id')
                            ->join('stores','stores.id', '=', 'departments.store_id')
                            ->where('stores.id','=',$store)
                        )
                        ->union(
                            Contract::select('contracts.id as id')
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->where('contracts.object_id', '=', $store)
                        )
                        ->get()
                    );
                } else{
                    $inventory = $inventory
                    ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'inventories.object_id',
                        Department::select('departments.id')
                        ->join('stores', 'stores.id', '=', 'departments.store_id')
                        ->where('stores.id', $store)
                    )
                    ->union(
                        Inventory::select('inventories.*')
                        ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                        ->where('inventories.object_id', $store)
                    )
                    ->union(
                        Inventory::select('inventories.*')
                        ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                        ->whereIn(
                            'inventories.object_id',
                            Contract::select('contracts.id')
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                            ->whereIn(
                                'contracts.object_id',
                                Department::select('departments.id as id')
                                ->join('stores', 'stores.id', '=', 'departments.store_id')
                                ->where('stores.id', '=', $store)
                            )
                            ->union(
                                Contract::select('contracts.id as id')
                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                ->where('contracts.object_id', '=', $store)
                            )
                            ->get()
                        )
                    );
                }
            }
            elseif($company) {
                if ($contract) {
                    $inventory = $inventory
                    ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"') )
                    ->whereIn('inventories.object_id', 
                        Contract::select('contracts.id')
                        ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                        ->whereIn('contracts.object_id', 
                            Department::select('departments.id as id')
                                ->join('stores','stores.id', '=', 'departments.store_id')
                                ->join('companies','companies.id', '=', 'stores.company_id')
                                ->where('companies.id','=',$company)
                        )
                        ->union(
                            Contract::select('contracts.id as id')
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                            ->whereIn('contracts.object_id', 
                                Store::select('stores.id')
                                ->join('companies','companies.id', '=', 'stores.company_id')
                                ->where('companies.id','=',$company)
                            )
                        )
                        ->union(
                            Contract::select('contracts.id as id')
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                            ->where('contracts.object_id', '=', $company)
                        )
                        ->get()
                        
                        
                    );
                } else {
                    $inventory = $inventory
                    ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                    ->whereIn(
                        'inventories.object_id',
                        Department::select('departments.id')
                    ->join('stores', 'stores.id', '=', 'departments.store_id')
                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                    ->where('companies.id', '=', $company)
                    )
                    ->union(
                        Inventory::select('inventories.*')
                        ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                        ->whereIn(
                            'inventories.object_id',
                            Store::select('stores.id')
                            ->join('companies', 'companies.id', '=', 'stores.company_id')
                            ->where('companies.id', '=', $company)
                        )
                    )
                    ->union(
                        Inventory::select('inventories.*')
                        ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                        ->where('inventories.object_id', '=', $company)
                    )
                    ->union(
                        Inventory::select('inventories.*')
                        ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"'))
                        ->whereIn(
                            'inventories.object_id',
                            Contract::select('contracts.id')
                            ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Department"'))
                            ->whereIn('contracts.object_id',
                                    Department::select('departments.id as id')
                                    ->join('stores', 'stores.id', '=', 'departments.store_id')
                                    ->join('companies', 'companies.id', '=', 'stores.company_id')
                                    ->where('companies.id', '=', $company)
                            )
                            ->union(
                                Contract::select('contracts.id as id')
                                ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Company"'))
                                ->where('contracts.object_id', '=', $company)
                            )
                             
                             ->union(
                                    Contract::select('contracts.id as id')
                                    ->where('contracts.object_type', '=', \DB::raw('"App\\\Models\\\Store"'))
                                    ->whereIn(
                                        'contracts.object_id',
                                        Store::select('stores.id')
                                        ->join('companies', 'companies.id', '=', 'stores.company_id')
                                        ->where('companies.id', '=', $company)
                                    )
                             )
                             ->get()
                        )  
                    );
                }
               
            }
        }
        if ($contract) {
            $inventory=$inventory
            ->where('inventories.object_type', '=', \DB::raw('"App\\\Models\\\Contract"') )
            ->where('inventories.object_id',$contract);
        }
        return $inventory;
    }
    public function offlineDataSync()
    {
        $listAllCompany = Company::select('id','name')->orderBy('name', 'ASC')->paginate();
        $listAllStore = Store::select('id','name','company_id')->orderBy('name', 'ASC')->paginate();
        $listAllContract = Contract::select('id','name','store_id')->orderBy('name', 'ASC')->paginate();
        $listAllInventory = Inventories::select('id','name','contract_id', 'inventory_date')->orderBy('name', 'ASC')->paginate();

        return response()->json([
                                'listCompany'  => $listAllCompany,
                                'listStore'    => $listAllStore,
                                'listContract' => $listAllContract,
                                'listInventory' => $listAllInventory
        ]);
    } 

    public function savelist(Request $request)
    {
        $msg ="" ;
        $arrayAssetOff = json_decode($request->item, true);
        for($i = 0 ; $i < count($arrayAssetOff); $i++){
            $asset_Id =Asset::select(['id'])->where('asset_tag', '=' ,substr($arrayAssetOff[$i]['asset_number'],4) )->get();
            $arrayAssets = ContractAsset::select([
                'assets.asset_tag',
                'assets.id'
            ])->join('assets','assets.id','=','contract_assets.asset_id')
            ->where("assets.asset_tag" , '=', substr($arrayAssetOff[$i]['asset_number'],4))->get();

            $inventory = new InventoryResults();
            $inventory->inventory_id = $request->inventory_id ;
            $inventory->checked_time = Carbon::parse($arrayAssetOff[$i]['date_scan'])->format('Y-m-d h:i:s');
            $inventory->user_id = Auth::id();

            if($arrayAssets->count() <= 0){
                $inventory->asset_id = $asset_Id !=null ? $asset_Id[0]->id : '' ;
                $inventory->unrecognized= 1;
                $inventory->save();
                $msg .= trans('admin/inventories/api.device'). $arrayAssetOff[$i]['asset_number'] . trans('admin/inventories/api.unrecognized_scan') . "**";
            } else {
                $inventory->asset_id = $arrayAssets[0]->id ;
                $inventory->unrecognized = 0;
                $inventory->save();
                $msg .= trans('admin/inventories/api.device'). $arrayAssetOff[$i]['asset_number'] . trans('admin/inventories/api.success_scan') . "**";
            }
        }
        return response()->json(['success_scan'=> $msg ], 200);
    }
}
