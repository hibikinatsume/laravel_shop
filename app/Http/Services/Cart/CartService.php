<?php

namespace App\Http\Services\Cart;

use App\Models\Product;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Arr;

class CartService
{

    public function create($request)
    {
        $qty = (int)$request->input('num_product');
        $product_id = (int)$request->input('product_id');
        
        if ($qty == 0 || $product_id == 0) {
            Session::flash('error', 'Xảy ra lỗi');
            return false;
        }

        $carts = Session::get('carts');

        if (is_null($carts)) {
            Session::put('carts', [$product_id => $qty]);
            
            return true;
        }
        
        $exists = Arr::exists($carts, $product_id);
        if ($exists) {
            $carts[$product_id] = $carts[$product_id] + $qty;
            Session::put('carts', [$carts]);
            
            return true;
        }

        $carts[$product_id] = $qty;
        Session::put('carts', $carts);

        return true;

    }

    public function getProducts()
    {
        $carts = Session::get('carts');
        if (is_null($carts)) return [];

        $product_id = array_keys($carts);

        return Product::select('id', 'name', 'price', 'price_sale', 'thumb')
            ->where('active', 1)
            ->whereIn('id', $product_id)->get();
    }

    public function update($request)
    {
        Session::put('carts', $request->input('num_product'));

        return true;
    }

    public function remove($id)
    {
        $carts = Session::get('carts');
        unset($carts[$id]);
        
        Session::put('carts', $carts);
        return true;
    }

}
