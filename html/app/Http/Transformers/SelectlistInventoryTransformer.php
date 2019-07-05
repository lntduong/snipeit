<?php
namespace App\Http\Transformers;
use Illuminate\Pagination\LengthAwarePaginator;

/**
 * @version    v1.0
 * @author [Thinh.NP] 
 */

class SelectlistInventoryTransformer
{

    public function transformSelectlist (LengthAwarePaginator $select_items)
    {
        $items_array=[];

        // Loop through the paginated collection to set the array values
        foreach ($select_items as $select_item) {
            $items_array[]= [
                'id' => (int) $select_item->id,
                'text' => str_replace('-','/',substr(e($select_item->inventory_date),0,10)) ." - ". e($select_item->name),
                'image' => ($select_item->use_image) ?  e($select_item->use_image) : null,

            ];

        }

        $results = [
            'items' => $items_array,
            'pagination' =>
                [
                    'more' => ($select_items->currentPage() >= $select_items->lastPage()) ? false : true,
                    'per_page' => $select_items->perPage()
                ],
            'total_count' => $select_items->total(),
            'page' => $select_items->currentPage(),
            'page_count' => $select_items->lastPage()
        ];

        return $results;

    }

}
