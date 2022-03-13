<?php

namespace App\Http\Services\Cart;

use App\Jobs\SendMail;
use App\Models\Cart;
use App\Models\Customer;
use App\Models\Product;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;

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

    public function checkout($request)
    {
        try {
            DB::beginTransaction();
            $carts = Session::get('carts');

            if (is_null($carts)) return false;

            $customer = Customer::create([
                'name' => $request->input('name'),
                'phone' => $request->input('phone'),
                'address' => $request->input('address'),
                'email' => $request->input('email'),
                'content' => $request->input('content'),
            ]);

            $this->infoProductCart($carts, $customer->id);
            DB::commit();
            Session::flash('success', 'Đặt hàng thành công');

            SendMail::dispatch($request->input('email'))->delay(now()->addSeconds(2));

            Session::forget('carts');
        } catch (\Exception $th) {
            DB::rollBack();
            Session::flash('success', 'Xảy ra lỗi');
            return false;
        }

        return true;
    }

    protected function infoProductCart($carts, $customer_id)
    {
        $product_id = array_keys($carts);
        $products =  Product::select('id', 'name', 'price', 'price_sale', 'thumb')
                ->where('active', 1)
                ->whereIn('id', $product_id)->get();

        $data = [];
        foreach ($products as $key => $product) {
            $data[] = [
                'customer_id' => $customer_id,
                'product_id' => $product->id,
                'pty' => $carts[$product->id],
                'price' => $product->price_sale != 0 ? $product->price_sale : $product->price,
            ];
        }

        return Cart::insert($data);
    }

    public function getCustomer()
    {
        return Customer::orderByDesc('id')->get();
    }
}
