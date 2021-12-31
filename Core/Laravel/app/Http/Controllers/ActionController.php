<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\{
    Section,
    JoinRequest
};

class ActionController extends Controller
{
    public static function delete($model , $id){
        $delete = null;
        $msg = 'Error';
        $rsp = 400;
        $model = 'App\Models'. '\\' . $model;

        try {
            $model = app($model);
        } catch (\Throwable) {
            $model = null;
        }

        if($model)
            $delete = $model::findOrFail($id)->delete();

        if($delete){
            $msg = 'Done';
            $rsp = 200;
        }

        return response()->json(['data' => $msg], $rsp);

    }

    public function join_req(){
        $sections = Section::get(['id' , 'name']);
        return view("join", ['sections'=>$sections]);
    }

    public function join(Request $req){
        $validator = Validator::make($req->all(), [
            'name' => 'required',
            'email' => 'required|unique:users|unique:join_requests',
            'password' => 'required',
            'section_id' => 'required',
        ]);

        if ($validator->fails()) 
            return back()->with('error', $validator->errors());

        $data = [
            'name' => $req->name,
            'email' => $req->email,
            'password' => $req->password,
            'section_id' => $req->section_id,
        ];

        $insert = JoinRequest::create($data);

        if($insert) return back()->with('success','Done , Wait for approval');
        else return back()->with('error', 'Something is wrong');
    }
}
