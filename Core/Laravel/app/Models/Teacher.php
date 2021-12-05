<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Teacher extends Model
{
    use HasFactory;

    protected $fillable = ['user_id' , 'section_id' , 'person_id'];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function person(){
        return $this->belongsTo(Person::class);
    }

    public function section(){
        return $this->belongsTo(Section::class);
    }

    public function subjects(){
        return $this->belongsToMany(Subject::class)->withTimestamps();
    }

    public function units(){
        return $this->belongsToMany(Unit::class)->withTimestamps();
    }
}
