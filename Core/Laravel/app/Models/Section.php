<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Section extends Model
{
    use HasFactory;

    protected $fillable = ['name' , 'type'];

    public function subjects(){
        return $this->hasMany(Subject::class);
    }

    public function stages(){
        return $this->hasMany(Stage::class);
    }

    public function units(){
        return $this->hasMany(Stage::class);
    }

    public function students(){
        return $this->hasMany(Student::class);
    }

    public function teachers(){
        return $this->hasMany(Teacher::class);
    }
}
