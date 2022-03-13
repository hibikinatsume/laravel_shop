<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Services\Product\ProductService;

class ProductController extends Controller
{

    protected $productService;

    public function __construct(ProductService $productService)
    {
        $this->productService = $productService;
    }

    public function index($id = '', $slug = '')
    {
        $product = $this->productService->show($id);
        $relationProducts = $this->productService->relation($product->category_id, $id);
        
        return view('detail', [
            'title' => $product->name,
            'product' => $product,
            'products' => $relationProducts,
        ]);
    }
}
