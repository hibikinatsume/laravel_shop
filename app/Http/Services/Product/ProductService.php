<?php

namespace App\Http\Services\Product;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Session;
use App\Models\Product;

class ProductService
{

    const LIMIT = 4;

    public function get($page = null)
    {
        return Product::select('id', 'name', 'price', 'price_sale', 'thumb')
                    ->orderByDesc('id')
                    ->when($page != null, function ($query) use ($page) {
                        $query->offset($page * self::LIMIT);
                    })
                    ->limit(self::LIMIT)
                    ->get();
    }

    public function show($id)
    {
        return Product::where('id', $id)->where('active', 1)->with('category')->firstOrFail();
    }

    public function relation($category_id, $product_id)
    {
        return Product::select('id', 'name', 'price', 'price_sale', 'thumb')
        ->where('category_id', $category_id)
        ->where('active', 1)
        ->where('id', '!=', $product_id)
        ->limit(4)
        ->get();
    }

}
