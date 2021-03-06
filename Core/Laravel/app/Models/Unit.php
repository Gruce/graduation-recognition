<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Unit extends Model
{
    use HasFactory;

    protected $fillable = ['name' , 'section_id' , 'stage_id'];

    public function stage(){
        return $this->belongsTo(Stage::class);
    }

    public function section(){
        return $this->belongsTo(Section::class);
    }

    public function students(){
        return $this->hasMany(Student::class);
    }

    public function teachers(){
        return $this->belongsToMany(Teacher::class)->withPivot(['id' , 'teacher_id' , 'unit_id'])->withTimestamps();
    }

    public function tasks(){
        return $this->belongsToMany(Task::class)->withTimestamps();
    }

    public function schedule(){
        return $this->hasOne(Schedule::class);
    }

    public function lectures(){
        return $this->hasMany(Lecture::class);
    }

    public function code(){
        return $this->hasOne(Code::class);
    }
}
