<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Services\Category\CategoryService;
use Illuminate\Support\Facades\Redirect;
use App\Http\Requests\Product\ProductRequest;
use App\Http\Services\Product\ProductAdminService;
use App\Models\Product;

class ProductController extends Controller
{

    protected $categoryService;
    protected $productAdminService;

    public function __construct(CategoryService $categoryService, ProductAdminService $productAdminService)
    {
        $this->categoryService = $categoryService;
        $this->productAdminService = $productAdminService;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.product.list', [
            'title' => 'DANH SÁCH SẢN PHẨM',
            'products' => $this->productAdminService->get(),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.product.add', [
            'title' => 'THÊM SẢN PHẨM',
            'categories' => $this->categoryService->getAll(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ProductRequest $request)
    {
        $this->productAdminService->insert($request);

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        return view('admin.product.edit', [
            'title' => 'CHỈNH SỬA SẢN PHẨM',
            'product' => $product,
            'categories' => $this->categoryService->getAll(),
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $this->productAdminService->update($request, $product);

        return redirect('/admin/product/list');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {
        $result = $this->productAdminService->destroy($request);

        if ($result) {
            return response()->json([
                'error' => false,
                'message' => 'Xóa thành công!',
            ]);
        }

        return response()->json([
            'error' => true,
        ]);
    }
}
