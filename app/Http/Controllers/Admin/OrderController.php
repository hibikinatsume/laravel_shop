<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Services\Cart\CartService;
use App\Models\Customer;

class OrderController extends Controller
{
    protected $cartService;

    public function __construct(CartService $cartService)
    {
        $this->cartService = $cartService;
    }

    public function index()
    {
        $customers = $this-> cartService->getCustomer();
        return view('admin.order.customer', [
            'title' => 'DANH SÁCH ĐƠN HÀNG',
            'customers' => $customers,
        ]);
    }

    public function show(Customer $customer)
    {
        return view('admin.order.detail', [
            'title' => 'CHI TIẾT ĐƠN HÀNG',
            'customer' => $customer,
            'carts' => $customer->carts()->get(),
        ]);
    }
}
