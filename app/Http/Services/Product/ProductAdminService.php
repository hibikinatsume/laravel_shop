<?php

namespace App\Http\Services\Product;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Session;
use App\Models\Product;

class ProductAdminService
{

    protected function checkPrice($request)
    {
        if ($request->input('price') != 0 && $request->input('price_sale') != 0 && $request->input('price_sale') >> $request->input('price')) {
            Session::flash('error', 'Giá khuyến mãi phải nhỏ hơn giá gốc');
            return false;
        }

        if ($request->input('price') == 0 && $request->input('price_sale') != 0) {
            Session::flash('error', 'Giá sản phẩm không được để trống');
            return false;
        }

        return true;
    }

    public function insert($request)
    {
        $checkPrice = $this->checkPrice($request);
        if ($checkPrice === false) {
            return false;
        }

        try {
            Product::create([
                'name' => (string) $request->input('name'),
                'desc' => (string) $request->input('desc'),
                'content' => (string) $request->input('content'),
                'thumb' => (string) $request->input('file'),
                'price' => (int) $request->input('price'),
                'price_sale' => (int) $request->input('price_sale'),
                'category_id' => (int) $request->input('category_id'),
                'active' => (int) $request->input('active'),
            ]);

            Session::flash('success', 'Tạo sản phẩm thành công');
        } catch (\Exception $err) {
            Session::flash('error', $err->getMessage());
            return false;
        }

        return true;
    }

    public function get()
    {
        return Product::with('category')->orderByDesc('id')->get();
    }

    public function update($request, $product)
    {
        $checkPrice = $this->checkPrice($request);
        if ($checkPrice === false) {
            return false;
        }

        $product->name = (string) $request->input('name');
        $product->desc = (string) $request->input('desc');
        $product->content = (string) $request->input('content');
        $product->thumb = (string) $request->input('file');
        $product->price = (int) $request->input('price');
        $product->price_sale = (int) $request->input('price_sale');
        $product->category_id = (int) $request->input('category_id');
        $product->active = (int) $request->input('active');
        $product->save();

        Session::flash('success', 'Cập nhật sản phẩm thành công');
        return true;
    }

    
    public function destroy($request)
    {
        $id = $request->input('id');
        $product = Product::where('id', $id)->first();

        if ($product) {
            $product->delete();
            return true;
        }

        return false;
    }
}
