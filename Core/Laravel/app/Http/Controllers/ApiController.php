<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

use App\Models\User;
use App\Models\Person;
use App\Models\Camera;
use App\Models\Tracking;
use App\Models\Setting;

class ApiController extends Controller
{
    public function person(Request $req){
        return response()->json([
            'data' => Person::find($req->id, ['id', 'name', 'training_id', 'type'])
        ], 200);
    }

    public function not_trained_people(){
        return response()->json([
            'data' => Person::where('training_id', 0)->get(['id', 'name', 'training_id', 'type'])
        ], 200);
    }

    public function new_person(Request $req){
        $user = new Person;

        $user->name = $req->name;
        $user->training_id = 1;
        $user->type = $req->type;

        $user->save();

        return response()->json(['id' => $user->id], 200);
    }

    public function app_restart(Request $req){
        $key = $req->key == 'app_restart' ? 'app_restart' : false ;
        $data = 'Key Not Active';
        $rsp = 401;
        if($key){
            $x = Setting::where('key' , $key)->first();
            $value = $x->value == '0' ? '1' : '0';
            $x->update(['value' => $value]);
            $data = 'Success';
            $rsp = 200;
        } 

        return response()->json(['data' => $data], $rsp);

    }
}
