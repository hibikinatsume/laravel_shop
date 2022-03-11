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

    public function getAll()
    {
        return Category::orderBy('id')->get();
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

    public function destroy($request)
    {
        $id = $request->input('id');
        $category = Category::where('id', $id)->first();

        if ($category) {
            return Category::where('id', $id)->orWhere('parent_id', $id)->delete();
        }

        return false;
    }

    public function update($category, $request)
    {
        if ($request->input('parent') != $category->id) {
            $category->parent_id = (int) $request->input('parent');
        }
        $category->name = (string) $request->input('name');
        $category->slug = Str::slug($request->input('name'), '-');
        $category->active = (int) $request->input('active');
        $category->save();

        Session::flash('success', 'Cập nhật danh mục thành công');
        return true;
    }
}
