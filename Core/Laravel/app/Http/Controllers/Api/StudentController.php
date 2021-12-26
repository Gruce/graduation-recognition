<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\{
    Teacher,
    Student,
    Subject,
    Task,
    Lecture
};

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

    public function subjects(){
        $student = auth()->user()->student()->first();
        $unit_id = $student->unit_id;

        $stage = $student->stage()->first();

        $subjects = $stage->subjects()->with(
            [
                'teachers' => function($teachers) use ($unit_id){
                    return $teachers->whereHas('units', function ($query) use ($unit_id){
                        $query->where('unit_id', $unit_id);
                    })->with(['user:id,name,email'])->get();
                }
            ]
        )->get();

        return response()->json(['data' => $subjects]);
    }

    public function subject_tasks($subject_id , $teacher_id){
        $student = auth()->user()->student()->first();
        $unit_id = $student->unit_id;
        $tasks = Task::where('teacher_id' , $teacher_id)->where('subject_id' , $subject_id)->with('files')->get();

        return response()->json(['data' => $tasks]);
    }

    public function lectures($today = null){
        $today = $today ? date('l') : null;
        $student = auth()->user()->student()->first();
        $lectures = Lecture::whereHas('day' , function($day) use($today){
            return $day->where('name' , 'LIKE' , $today);
        })->where('unit_id' , $student->unit_id)->get();

        return response()->json(['data' => $lectures]);

    }


}
