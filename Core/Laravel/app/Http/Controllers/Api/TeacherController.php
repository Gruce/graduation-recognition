<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

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
                'user:id,name,email,type',
                'section:id,name',
                'stages:id,name',
                'units:id,name',
                'subjects:id,name'
            ]
            )->get(
                [
                    'id',
                    'user_id',
                    'section_id',
                    'speciality'
                ]);

        return response()->json(['data' => $info]);
    }

    public function units(){
        $units = auth()->user()->teacher()->with(
            [
                'units' => function($unit){
                    return $unit->with(['section:id,name' , 'stage:id,section_id,name'])->withCount('students')->get();
                },
            ]
        )->get(['id' , 'user_id' , 'section_id' , 'speciality']);

        return response()->json(['data' => $units]);
    }

    public function unit_student($id){
        $students = auth()->user()->teacher()->with(
            [
                'units' => function($unit) use ($id){
                    return $unit->with(
                        [
                            'students' => function($student){
                                return $student->with(
                                    [
                                        'user:id,name,email',
                                        'section:id,name',
                                        'stage:id,name'
                                    ]
                                )->get();
                            }
                        ]
                    )->find($id);
                }
            ]
        )->get(['id' , 'user_id' , 'section_id' , 'speciality']);

        if(empty($students->toArray()[0]['units']))
            return response()->json(['data' => "You Don't have this unit ! "], 400);

        return response()->json(['data' => $students]);
    }

    public static function send_task(Request $req){
      info($req->file);
      $ids=$req->ids;
      if(gettype($req->ids)=='string'){
        $x= str_replace('[','',$req->ids);
        $x= str_replace(']','',$x);
        $ids=array_map('intval', explode(',', $x));

      }
      
        $teacher = auth()->user()->teacher()->first();

        $data = [
            'title' => $req->title,
            'body' => $req->body,
            'to' => $req->to,
            'deadline' => $req->deadline,
            // 'ids' => implode(',' , $req->ids),
            // 'ids' => $req->ids, // post man //
        ];
        $task = $teacher->tasks()->create($data);

        // $file_path = null;
        // $files = $req->toArray()['file'];

        // if(!empty($files)){
        //     $validator = Validator::make($req->all(), [
        //         'file*' => 'file|mimes:jpeg,png,jpg,pdf|max:10000'
        //     ]);

        //     if ($validator->fails())
        //         return response()->json(['data' => 'File Not available or file size is large'], 400);

        //     foreach ($files as $file){
        //         $file_path =  $req->title . '_' . str_random(5) . '_' . time() . '.' . $file->extension();
        //         $file->storeAs('task\\' . $teacher->id, $file_path);
        //         $file_path = 'task\\' . $teacher->id . '\\' . $file_path;
        //         $task->files()->create(['file_path' => $file_path]);
        //     }
        // }

        $rsp = 200 ;
        $msg = 'Done';

        switch ($req->to) {
            case 1: $task->units()->attach($ids); break;
            case 2: $task->stages()->attach($ids); break;
            case 3: $task->sections()->attach($ids); break;
            case 4: $task->students()->attach($ids); break;
            default:{
                $rsp = 400 ;
                $msg = 'error';
            } break;
        }
        //  when use postman

        return response()->json(['data' => $msg], $rsp);
    }

    public function tasks(){
        $teacher = auth()->user()->teacher()->first();
        $tasks = $teacher->tasks()->with('files')->get();
        dd($tasks->toArray());
    }
}
