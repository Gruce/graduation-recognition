<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    use HasFactory;

    protected $fillable = ['section_id' , 'user_id' , 'stage_id' , 'unit_id'];

    public function section(){
        return $this->belongsTo(Section::class);
    }

    public function stage(){
        return $this->belongsTo(Stage::class);
    }

    public function unit(){
        return $this->belongsTo(Unit::class);
    }

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function tasks(){
        return $this->belongsToMany(Task::class)->withTimestamps();
    }
}
