<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use Str;

class UserController extends Controller
{
    public static function users(){
        $users = User::where('is_trained' , true)->get(['id','name','email' , 'type' , 'is_trained']);
        return response()->json(['data' => $users]);
    }

    public function new_user(Request $req){

        $validator = Validator::make($req->all(), [
            'name' => 'required',
            'email' => 'required|unique:users',
            'password' => 'required',
            'type' => 'required|integer|min:0|max:3'
        ]);

        if ($validator->fails()){
            return response()->json(['message' => $validator->errors()], 400);
        }
    
        $data = [
            'name' => $req->name,
            'email' => $req->email,
            'email_verified_at' => now(),
            'password' => bcrypt($req->password),
            'remember_token' => Str::random(10),
            'type' => $req->type,
            'is_trained' => true,
        ];

        $user = User::create($data);

        if($user)
            return response()->json(['id' => $user->id], 200);
        else return response()->json(['message' => 'error'], 400);

    }
}
