<?php
namespace App\Http\Transformers;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class SelectlistTransformer
 *
 * This handles the standardized formatting of the API response we need to provide for
 * the rich (text and images) Select2 javascript.
 *
 * @package App\Http\Transformers
 * @author [A. Gianotto] [<snipe@snipe.net>]
 * @since [v4.0.16]
 * @return \Illuminate\Http\Response
 */

class SelectlistTransformer
{

    public function transformSelectlist (LengthAwarePaginator $select_items)
    {
        $items_array=[];

        // Loop through the paginated collection to set the array values
        foreach ($select_items as $select_item) {
            $items_array[]= [
                'id' => (int) $select_item->id,
                'text' => ($select_item->use_text) ? e($select_item->use_text) : e($select_item->name),
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
    public function transformSelectlistInventory (LengthAwarePaginator $select_items)
    {
        $items_array=[];

        // Loop through the paginated collection to set the array values
        foreach ($select_items as $select_item) {
            $items_array[]= [
                'id' => (int) $select_item->id,
                'text' => ($select_item->use_text) ? e($select_item->use_text) : e($select_item->inventory_date->format('Y/m/d')).' - '.e($select_item->name),
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
    public function transformSelectlistContract (LengthAwarePaginator $select_items)
    {
        $items_array=[];

        // Loop through the paginated collection to set the array values
        foreach ($select_items as $select_item) {
            if(isset($select_item['inventory_date'])) {
                $items_array[]= [
                    'id' => $select_item['id'],
                    'text' => date('Y/m/d',strtotime($select_item['inventory_date'])). ' - ' .$select_item['name'],
                    'image' => (isset($select_item['image'])) ? $select_item['image']   : null,
     
                ];
            } else {
                $items_array[]= [
                    'id' => $select_item['id'],
                    'text' => $select_item['name'],
                    'image' => (isset($select_item['image'])) ? $select_item['image']   : null,
    
                ];
            }
         

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
