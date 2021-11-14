<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Camera extends Model
{
    use HasFactory;
    public $timestamps = true;

    protected $fillable = ['state', 'description'];

    public function trackings()
    {
        return $this->hasMany(Tracking::class);
    }
}
