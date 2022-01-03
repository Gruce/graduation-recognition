<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\{
    Teacher,
    Student,
    Subject,
    Task,
    Lecture,
    Day,
};

class StudentController extends Controller
{

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

    public static function lectures($today = null){
        $today = $today ? date('l') : null;
        $student = auth()->user()->student()->first();

        $lectures = Lecture::whereHas('day' , function($day) use($today){
            return $day->where('name' , 'LIKE' , $today);
        })->where('unit_id' , $student->unit_id)->with(
            [
                'classroom' => function($classroom){
                    return $classroom->with('cameras')->get();
                },
                'teacher' => function($teacher){
                    return $teacher->with('user:id,name,email')->get();
                },
                'subject:id,name',
                'day:id,name',
            ]
        )->get();

        return response()->json(['data' => $lectures]);

    }

    public static function current_lecture(){
        $time = date('H:i:s');
        $dayID = Day::where('name' , date('l'))->first();

        $dayID = $dayID ? $dayID->id : null;

        if(!$dayID)
            return response()->json(['error' => 'No current lecture'] , 400);

        $student = auth()->user()->student()->first();
        $unit = $student->unit()->first();

        $lecture = $unit->lectures()->whereHas(
            'day' , function($day) use ($dayID , $time){
                return $day->where('id' , $dayID);
            }
        )->where('start' , '<=' , $time)->where('end' , '>=' , $time)->with(
            [
                'unit'=> function($unit){
                    return $unit->with(['stage:id,name','section:id,name'])->get();
                },
                'classroom' => function($classroom){
                    return $classroom->with('cameras')->get();
                },
                'teacher' => function($teacher){
                    return $teacher->with('user:id,name,email')->get();
                },
                'subject:id,name',
                'day:id,name',
            ]
        )->orderBy('start' , 'DESC')->first();
                
        return response()->json(['data' => $lecture]);
    }

    public function info()
    {
        $student = auth()->user()->student()->with(
            [
                'user:id,name,email',
                'section:id,name',
                'stage:id,name',
                'unit:id,name',
                'absences' => function ($abs){
                    return $abs->with('subject:id,name')->get();
                }
            ])->first();

        return response()->json(['data' => $student]);
    }

    public static function absences(){
        $student = auth()->user()->student()->first();
        $absences = $student->absences()->with('subject')->get();

        $subjects =[];

        if(count($absences)>0)
            foreach($absences as $item)
                if(in_array($item->subject->name,array_keys($subjects)))
                    $subjects[$item->subject->name]++;
                else
                    $subjects[$item->subject->name] = 1;

        $subjects_name = array_keys($subjects);

        $data = [];
        $count = 0 ;

        foreach($subjects as $subject)
            array_push($data , (object)['name' => $subjects_name[$count++] , 'count' => $subject]);

        return response()->json(['data' => $data]);
    }

}
