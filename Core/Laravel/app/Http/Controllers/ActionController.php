<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

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
}
