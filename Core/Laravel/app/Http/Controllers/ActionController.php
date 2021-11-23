<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Jantinnerezo\LivewireAlert\LivewireAlert;

class ActionController extends Controller
{
    use LivewireAlert;

    public function delete($model , $id){
        $model = 'App\Models'. '\\' . $model;
        $model = app($model);
        $delete = $model::findOrFail($id)->delete();

        return redirect()->back();
    }
}
