<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\Category\CreateFormRequest;
use App\Http\Services\Category\CategoryService;
use App\Models\Category;
use Illuminate\Support\Facades\Redirect;

class CategoryController extends Controller
{
    protected $categoryService;

    public function __construct(CategoryService $categoryService)
    {
        $this->categoryService = $categoryService;
    }

    public function index()
    {
        return view('admin.category.list', [
            'title' => 'DANH SÁCH DANH MỤC',
            'categories' => $this->categoryService->getAll(),
        ]);
    }

    public function create()
    {
        return view('admin.category.add', [
            'title' => 'THÊM DANH MỤC',
            'categories' => $this->categoryService->getParent(),
        ]);
    }

    public function store(CreateFormRequest $request)
    {
        $result = $this->categoryService->create($request);

        return redirect()->back();
    }

    public function destroy(Request $request)
    {
        $result = $this->categoryService->destroy($request);

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

    public function show(Category $category)
    {
        return view('admin.category.edit', [
            'title' => 'CHỈNH SỬA DANH MUC: ' . $category->name,
            'category' => $category,
            'categories' => $this->categoryService->getParent(),
        ]);
    }

    public function update(Category $category, CreateFormRequest $request)
    {
        $this->categoryService->update($category, $request);

        return Redirect('/admin/category/list');
    }
}
