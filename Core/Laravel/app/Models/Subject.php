<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subject extends Model
{
    use HasFactory;

    protected $fillable = ['name' , 'stage_id'];

    public function stage(){
        return $this->belongsTo(Stage::class);
    }
}
