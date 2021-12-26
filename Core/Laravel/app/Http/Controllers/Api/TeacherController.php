<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\{
    Stage,
    Unit,
    Subject
};
use File;

class TeacherController extends Controller
{

    public static function add_file($task , $file , $teacher_id){
        $filename = uniqid().'.'.File::extension($file->getClientOriginalName());
        $file->storeAs('public/tasks/' . $teacher_id, $filename);
        $path = 'storage/tasks/' . $teacher_id . '/'. $filename ;
        $task->files()->create(['file_path' => $path]);
    }
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
        $file_paths = [];

        $validator = Validator::make($req->all(), [
            'files*' => 'file|mimes:jpeg,png,jpg,pdf,docx,doc,rar,zip|max:10000',
            'ids' => 'required',
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

        $stage_id = Unit::find($ids[0])->stage_id;
        $teacher = auth()->user()->teacher()->first();
        $stage = $teacher->stages()->wherePivot('stage_id' , $stage_id)->first();
        $subject = Subject::where('stage_id' , $stage->id)->first();

        $data = [
            'subject_id' => $subject->id,
            'title' => $req->title,
            'body' => $req->body,
            'to' => $req->to,
        ];

        $task = $teacher->tasks()->create($data);
        if($req->livewire)
            foreach ($req->toArray()['files'] as $key => $file)
                self::add_file($task , $file , $teacher->id);

        elseif ($req->hasFile('files'))
            foreach($req->file('files') as $i => $file)
                self::add_file($task , $file , $teacher->id);

        $rsp = 200;
        $msg = 'Done';

        switch ($req->to) {
            case 1: $task->units()->attach($ids); break;
            // case 2: $task->stages()->attach($ids); break;
            // case 3: $task->sections()->attach($ids); break;
            // case 4: $task->students()->attach($ids); break;
            default:{
                $rsp = 400 ;
                $msg = 'error';
            } break;
        }

        return response()->json(['data' => $msg], $rsp);
    }

    public function tasks(){
        $teacher = auth()->user()->teacher()->first();
        $tasks = $teacher->tasks()->with(['files','units'=>function($unit){
            return $unit->with('stage')->get();
        }])->get();

        return response()->json(['data' => $tasks], 200);
    }

    public function lectures($day = null){
        $teacher = auth()->user()->teacher()->first();
        
        $units_lectures = $teacher->get_lectures($day)->get();

        return response()->json(['data' => $units_lectures], 200);
    }
}
