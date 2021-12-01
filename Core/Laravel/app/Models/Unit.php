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
}
