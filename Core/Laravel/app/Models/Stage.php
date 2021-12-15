<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Stage extends Model
{
    use HasFactory;

    protected $fillable = ['name' , 'section_id'];

    public function section(){
        return $this->belongsTo(Section::class);
    }

    public function units(){
        return $this->hasMany(Unit::class);
    }

    public function subjects(){
        return $this->hasMany(Subject::class);
    }

    public function students(){
        return $this->hasMany(Student::class);
    }

    public function teachers(){
        return $this->belongsToMany(Teacher::class)->withTimestamps();
    }

    public function tasks(){
        return $this->belongsToMany(Task::class)->withTimestamps();
    }
}
