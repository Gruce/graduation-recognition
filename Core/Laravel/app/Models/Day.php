<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Day extends Model
{
    protected $fillable = ['name'];
    use HasFactory;

    public function lectures(){
        return $this->hasMany(Lecture::class);
    }
}
