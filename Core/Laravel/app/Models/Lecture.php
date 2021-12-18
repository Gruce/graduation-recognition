<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Lecture extends Model
{
    protected $fillable = ['subject_id' , 'start' , 'classroom_id' , 'day_id' , 'unit_id'];
    use HasFactory;

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
}
