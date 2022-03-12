<?php

namespace App\Http\Services\Slide;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Session;
use App\Models\Slide;

class SlideService
{
    public function insert($request)
    {
        try {
            Slide::create([
                'name' => (string) $request->input('name'),
                'url' => (string) $request->input('url'),
                'thumb' => (string) $request->input('file'),
                'sort_by' => (int) $request->input('sort_by'),
                'active' => (int) $request->input('active'),
            ]);

            Session::flash('success', 'Tạo slide thành công');
        } catch (\Exception $err) {
            Session::flash('error', $err->getMessage());
            return false;
        }

        return true;
    }

    public function get()
    {
        return Slide::orderByDesc('id')->get();
    }

    public function update($request, $slide)
    {
        $slide->name = (string) $request->input('name');
        $slide->url = (string) $request->input('url');
        $slide->thumb = (string) $request->input('file');
        $slide->sort_by = (int) $request->input('sort_by');
        $slide->active = (int) $request->input('active');
        $slide->save();

        Session::flash('success', 'Cập nhật thành công');
        return true;
    }

    public function destroy($request)
    {
        $id = $request->input('id');
        $slide = Slide::where('id', $id)->first();

        if ($slide) {
            $slide->delete();
            return true;
        }

        return false;
    }
}
