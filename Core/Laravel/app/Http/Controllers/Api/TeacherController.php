<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class TeacherController extends Controller
{
    public function my_students(){

        $students = auth()->user()->teacher()->with(
            [
                'units' => function($q){
                    return $q->with(['students' => function($q){
                        return $q->with(['user:id,name,email,type' , 'section:id,name']) // students //
                        ->get(['section_id' , 'user_id']);
                    }])->get();
                }
            ])
            ->get();

        return response()->json(['data' => $students]);
    }
}
