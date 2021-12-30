<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subject extends Model
{
    use HasFactory;

    protected $fillable = ['name' , 'section_id' , 'stage_id'];

    public function stage(){
        return $this->belongsTo(Stage::class);
    }

    public function section(){
        return $this->belongsTo(Section::class);
    }

    public function teachers(){
        return $this->belongsToMany(Teacher::class)->withPivot(['id' , 'subject_id' , 'teacher_id'])->withTimestamps();
    }

    public function lectures(){
        return $this->hasMany(Lecture::class);
    }

    public function tasks(){
        return $this->hasMany(Task::class);
    }

    public function absences(){
        return $this->hasMany(Absence::class);
    }
}
