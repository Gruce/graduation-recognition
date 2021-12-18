<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Camera extends Model
{
    use HasFactory;
    public $timestamps = true;

    protected $fillable = ['state', 'description' , 'classroom_id'];

    public function trackings(){
        return $this->hasMany(Tracking::class);
    }

    public function classroom(){
        return $this->belongsTo(Classroom::class);
    }
}
