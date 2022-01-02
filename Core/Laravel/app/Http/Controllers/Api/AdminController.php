<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\{
    Teacher,
    Task,
    Student,
};
use App\Models\{
    Subject,
    Lecture,
    Day,
};

use Validator;

class AdminController extends Controller
{
    public function teachers()
    {
        $teachers = Teacher::with(
            [
                'section',
                'user:id,name,email',
                'units' => function($unit){
                    return $unit->with(
                        [
                            'section:id,name',
                            'stage:id,name'
                        ]
                    )->select();
                },
                'subjects:id,name',
                'get_lectures',
            ]
        )->get();


        return response()->json(['data' => $teachers], 200);

    }

    public function students(){
        $students = Student::with(
            [
                'user' => function ($user){
                    return $user->with(['trackings' => function ($trackings) {
                        return $trackings->with('camera')->latest()->take(1);
                    }])->get();
                },
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

    
    public function get_student($student_id){
        $student = Student::with(
            [
                'user' => function ($user){
                    return $user->with(['trackings' => function ($trackings) {
                        return $trackings->with('camera')->latest()->take(1);
                    }])->get();
                },
                'section:id,name',
                'stage:id,name,section_id',
                'unit:id,name,stage_id,section_id',
                'absences.lecture.subject'
            ])->get(
            [
                'id',
                'user_id',
                'section_id',
                'stage_id',
                'unit_id',
            ]
        )->find($student_id);

        return response()->json(['data' => $student]);

    }

    public function get_absences($student_id)
    {
        $student = Student::with(
            [   
                'absences'=> function ($abs){
                    return $abs->with('subject:id,name')->get();
                },
                'section:id,name',
                'stage:id,name',
                'unit:id,name'
            ]
        )->find($student_id);

        $subjects =[];
        if(count($student->absences)>0){
            foreach($student->absences as $item){
                if(in_array($item['subject']['name'],array_keys($subjects))){
                    $subjects[$item['subject']['name']]++;
                }
                else{
                    $subjects[$item['subject']['name']]=1;
                }
            }
        }
        return response()->json(['data' => $student , 'subjects'=> $subjects]);
    }

    public static function send_task(Request $req){
        $file_paths = [];

        $validator = Validator::make($req->all(), [
            'files*' => 'file|mimes:jpeg,png,jpg,pdf,docx,doc,rar,zip|max:10000',
            'title' => 'required',
        ]);

        if ($validator->fails())
            return response()->json(['data' => 'File extension Not available or file size is large Or title or stage unit not existing'], 400);

        $ids=$req->ids;
        if(gettype($req->ids)=='string'){
            $x= str_replace('[','',$req->ids);
            $x= str_replace(']','',$x);
            $ids=array_map('intval', explode(',', $x));
        }


        $data = [
            'title' => $req->title,
            'body' => $req->body,
        ];

        $task = Task::create($data);
        if($req->livewire)
            foreach ($req->toArray()['files'] as $key => $file)
                self::add_file($task , $file , $teacher->id);

        elseif ($req->hasFile('files'))
            foreach($req->file('files') as $i => $file)
                self::add_file($task , $file , $teacher->id);

        $rsp = 200;
        $msg = 'Done';

        
        // if ($req->teachers)
            // $task->stga

        if ($req->students)
            $task->students()->attach(Student::get()->pluck('id'));

        $stages = json_decode($req->stages);
        if (is_array($stages) && count($stages) > 0){
            $task->stages()->attach($stages);
        }


        return response()->json(['data' => $msg], $rsp);
    }
}
