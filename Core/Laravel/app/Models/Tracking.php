<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tracking extends Model
{
    use HasFactory;
    use \Staudenmeir\EloquentEagerLimit\HasEagerLimit;
    protected $fillable = ['person_id' , 'camera_id' , 'last_seen' , 'image_path'];

    public $timestamps = true;

    public function person()
    {
        return $this->belongsTo(Person::class);
    }

    public function camera()
    {
        return $this->belongsTo(Camera::class);
    }
}
