<?php

namespace App\Http\Services\Product;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Session;

class UploadService
{
    public function store($request)
    {
        if ($request->hasFile('file')) {
            try {
                $name = $request->file('file')->getClientOriginalName();
                $patchFull = 'uploads/' . date("Y/m/d");

                $request->file('file')->storeAs('public/'. $patchFull, $name);

                return '/storage/' . $patchFull . '/' . $name;
            } catch (\Exception $error) {
                return false;
            }
        }
    }
}
