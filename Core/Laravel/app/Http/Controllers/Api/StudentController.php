<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Student;

class StudentController extends Controller
{
    public function students(){
        $students = Student::with(
            [
                'user:id,name,email,type',
                'section:id,name',
                'stage:id,name,section_id',
                'unit:id,name,stage_id,section_id'
            ])->get(
            [
                'id',
                'user_id',
                'section_id',
                'stage_id',
                'unit_id',
            ]
        );

        return response()->json(['data' => $students]);
        
    }
}
