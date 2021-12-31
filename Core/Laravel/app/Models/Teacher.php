<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Teacher extends Model
{
    use HasFactory;

    protected $fillable = ['user_id' , 'section_id' , 'person_id'];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function person(){
        return $this->belongsTo(Person::class);
    }

    public function section(){
        return $this->belongsTo(Section::class);
    }

    public function stages(){
        return $this->belongsToMany(Stage::class)->withTimestamps();
    }

    public function subjects(){
        return $this->belongsToMany(Subject::class)->withPivot(['id' , 'subject_id' , 'teacher_id'])->withTimestamps();
    }

    public function units(){
        return $this->belongsToMany(Unit::class)->withPivot(['id' , 'teacher_id' , 'unit_id'])->withTimestamps();
    }

    public function tasks(){
        return $this->hasMany(Task::class);
    }

    public function lectures(){
        return $this->hasMany(Lecture::class);
    }

    public function get_lectures($day = null){
        $lectures = $this->units()->with(
            [
                'lectures' => function($lecture) use ($day){
                    return $lecture->whereHas('day' , function($q) use ($day){
                        return $q->where('name' , 'LIKE' , $day);
                    })->with(
                        [
                            'unit'=> function($unit){
                                return $unit->with(['stage:id,name','section:id,name'])->get();
                            },
                            'classroom' => function($classroom){
                                return $classroom->with('cameras')->get();
                            },
                            'subject:id,name',
                            'day:id,name',
                        ]
                    )->get();
                },
                'section:id,name',
                'stage:id,name',

            ]
        );

        return $lectures;
    }

    public function current_lecture(){
        $time = date('H:i:s');
        $dayID = Day::where('name' , date('l'))->first();

        $dayID = $dayID ? $dayID->id : null;

        $lecture = $this->lectures()->whereHas(
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
                'subject:id,name',
                'day:id,name',
            ]
        )->orderBy('start' , 'DESC')->first();
        // dd($lecture->toArray());

        // $lectures = $this->units()->with(
        //     [
        //         'lectures' => function($lecture) use ($day , $time){
        //             return $lecture->whereHas('day' , function($q) use ($day){
        //                 return $q->where('id' , $day);
        //             })->where('start' , '<=' , $time)->with(
        //                 [
        //                     'unit'=> function($unit){
        //                         return $unit->with(['stage:id,name','section:id,name'])->get();
        //                     },
        //                     'classroom' => function($classroom){
        //                         return $classroom->with('cameras')->get();
        //                     },
        //                     'subject:id,name',
        //                     'day:id,name',
        //                 ]
        //             )->orderBy('start' , 'DESC')->first();
        //         },
        //         'section:id,name',
        //         'stage:id,name',
        //     ]
        // );

        return $lecture;
    }
}
