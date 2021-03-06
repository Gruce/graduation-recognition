<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Classroom extends Model
{
    use HasFactory;
    protected $fillable = ['name'];

    public function cameras(){
        return $this->hasMany(Camera::class);
    }

    public function lectures(){
        return $this->hasMany(Lecture::class);
    }
}
