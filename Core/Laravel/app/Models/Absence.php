<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Absence extends Model
{
    use HasFactory;
    protected $fillable = ['lecture_id', 'student_id' , 'subject_id'];

    public function student(){
        return $this->belongsTo(Student::class);
    }

    public function lecture(){
        return $this->belongsTo(Lecture::class);
    }

    public function subject(){
        return $this->belongsTo(Subject::class);
    }
}
