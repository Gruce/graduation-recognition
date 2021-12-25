<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Day;

class LectureController extends Controller
{
    public static function lectures($day = null , $section = null , $stage = null , $unit = null , $search = null) // section and staeg and unit is id and day is name //
    {
        $lectures = Lecture::whereHas('day' , function ($q) use ($day){
            return $q->where('name' , 'LIKE' , $day);
        })->whereHas('unit.section' , function ($q) use ($section){
            return $q->where('id' , 'LIKE' , $section);
        })->whereHas('unit.stage' , function($q) use ($stage){
            return $q->where('id' , 'LIKE' , $stage);
        })->whereHas('unit' , function($q) use ($unit){
            return $q->where('id' , 'LIKE' , $unit);
        })->whereHas('teacher.user' , function($q) use ($search){
            return $q->where('name' , 'LIKE' , '%' . $search . '%');
        })->with(
            [
                'unit' => function($unit){
                    return $unit->with(['section:id,name','stage:id,name']);
                },
                'subject:id,name',
                'classroom' => function($classroom){
                    return $classroom->with('cameras')->get();
                },
                'day:id,name',
                'teacher.user:id,name'
            ]
        )->get();

        return response()->json(['data' => $lectures], 200);
        
    }

    public function days(){
        $days = Day::with(
            [
                'lectures' => function($lecture){
                    return $lecture->with(
                        [
                            'subject:id,name',
                            'teacher' => function($teacher){
                                return $teacher->with('user:id,name')->select('id' , 'user_id');
                            },
                            'unit' => function ($unit){
                                return $unit->with(
                                    [
                                        'section:id,name',
                                        'stage:id,name'
                                    ]
                                )->select('id' , 'name' , 'section_id' , 'stage_id');
                            },
                            'classroom' => function($classroom){
                                return $classroom->with('cameras')->get();
                            }
                        ]
                    )->get();
                }
            ]
        )->get();

        return response()->json(['data' => $days], 200);
    }
}
