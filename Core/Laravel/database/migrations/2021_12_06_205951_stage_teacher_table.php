<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class StageTeacherTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stage_teacher', function (Blueprint $table) {
            $table->id();
            $table->foreignId('stage_id')->nullable()->constrained('stages')->onDelete('cascade'); 
            $table->foreignId('teacher_id')->nullable()->constrained('teachers')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('stage_teacher');
    }
}
