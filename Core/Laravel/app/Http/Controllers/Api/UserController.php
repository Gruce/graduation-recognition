<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\{
    User,
    Teacher,
    Student
};
use Str;

class UserController extends Controller
{
    public static function users(){
        $users = User::where('is_trained' , true)->with(
            [
                'trackings' => function($tracking){
                    return $tracking->with('camera:id,description,source,state')->select('id' , 'user_id' , 'camera_id' , 'seen')->latest()->take(1);
                }
            ]
        )->get(
            [
                'id',
                'name',
                'email',
                'type',
                'is_trained'
            ]
        );
        return response()->json(['data' => $users]);
    }

    public static function new_user(Request $req){

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
            'is_trained' => $req->livewire ? false : true,
        ];

        $user = User::create($data);

        switch ($req->type){
            case 2: Teacher::create(['user_id' => $user->id]); break;
            case 3: Student::create(['user_id' => $user->id]); break;
        }
        

        if($user)
            return response()->json(['id' => $user->id], 200);
        else return response()->json(['message' => 'error'], 400);

    }
}
