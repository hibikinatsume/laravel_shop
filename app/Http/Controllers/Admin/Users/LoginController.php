<?php

namespace App\Http\Controllers\Admin\Users;

use App\Http\Controllers\Controller;
use App\Models\c;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function index()
    {
        return view('admin/users/login', ['title' => 'Login']);
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        /* Validation email and password */
        $validated = $request->validate([
            'mail' => 'required|email',
            'pass' => 'required',
        ]);

        if(Auth::attempt([
            'email' => $request->input('mail'), 
            'password' => $request->input('pass'),
        ])) {
            return redirect()->route('admin');
        }

        $request->session()->flash('error', 'Email or password incorrect.');
        return redirect()->back();

    }

    public function show(c $c)
    {
        //
    }

    public function edit(c $c)
    {
        //
    }

    public function update(Request $request, c $c)
    {
        //
    }

    public function destroy(c $c)
    {
        //
    }
}
