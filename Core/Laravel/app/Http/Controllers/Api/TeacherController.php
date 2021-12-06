<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class TeacherController extends Controller
{
    public function my_students(){

        $students = auth()->user()->teacher()->with(
            [
                'units' => function($unit){
                    return $unit->with(['students' => function($student){
                        return $student->with(['user:id,name,email,type' , 'section:id,name']) // students //
                        ->get(['section_id' , 'user_id']);
                    }])->get();
                }
            ])
            ->get();

        return response()->json(['data' => $students]);
    }

    public function info(){
        $info = auth()->user()->teacher()->with(
            [
                'user:id,name,email',
                'section:id,name',
                'stages:id,section_id,name',
                'units' => function($units){
                    return $units->with(['section:id,name' , 'stage:id,name'])->get();
                },
                'subjects' => function($subject){
                    return $subject->with(['section:id,name' , 'stage:id,name'])->get();
                },
            ]
            )->get(['id' , 'user_id' , 'section_id']);

        return response()->json(['data' => $info]);
    }
}
