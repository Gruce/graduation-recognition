<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lecture extends Model
{
    use HasFactory;
    
    protected $fillable = ['subject_id' , 'start' , 'end' , 'classroom_id' , 'day_id' , 'unit_id' , 'teacher_id'];
    
    public function subject(){
        return $this->belongsTo(Subject::class);
    }

    public function classroom(){
        return $this->belongsTo(Classroom::class);
    }

    public function day(){
        return $this->belongsTo(Day::class);
    }

    public function unit(){
        return $this->belongsTo(Unit::class);
    }

    public function teacher(){
        return $this->belongsTo(Teacher::class);
    }

    public function absences(){
        return $this->hasMany(Absence::class);
    }
}
