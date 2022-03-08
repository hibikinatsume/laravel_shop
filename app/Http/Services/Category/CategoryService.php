<?php

namespace App\Http\Services\Category;

use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Session;

class CategoryService
{

    public function getParent()
    {
        return Category::where('parent_id', 0)->get();
    }

    public function create($request)
    {
        try {
            Category::create([
                'name' => (string) $request->input('name'),
                'parent_id' => (int) $request->input('parent'),
                'slug' => Str::slug($request->input('name'), '-'),
                'active' => (int) $request->input('active'),
            ]);

            Session::flash('success', 'Tạo danh mục thành công');
        } catch (\Exception $err) {
            Session::flash('error', $err->getMessage());
            return false;
        }

        return true;
    }

}