<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\{
    Teacher,
    Task,
    Student,
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
