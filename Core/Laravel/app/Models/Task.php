<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;
    protected $fillable = ['teacher_id' , 'title' , 'body' , 'file_path' , 'to' , 'ids'];

    public function teacher(){
        return $this->belongsTo(Teacher::class);
    }

    public function units(){
        return $this->belongsToMany(Unit::class)->withTimestamps();
    }

    public function stages(){
        return $this->belongsToMany(Stage::class)->withTimestamps();
    }

    public function sections(){
        return $this->belongsToMany(Section::class)->withTimestamps();
    }

    public function students(){
        return $this->belongsToMany(Student::class)->withTimestamps();
    }

}
