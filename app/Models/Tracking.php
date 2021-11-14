<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tracking extends Model
{
    use HasFactory;
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
