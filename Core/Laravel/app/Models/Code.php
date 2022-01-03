<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Code extends Model
{
    use HasFactory;

    protected $fillable = ['unit_id' , 'code'];

    public function unit(){
        return $this->belongsTo(Unit::class);
    }
    
}
