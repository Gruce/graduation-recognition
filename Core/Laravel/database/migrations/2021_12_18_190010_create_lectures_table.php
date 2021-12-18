<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateLecturesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lectures', function (Blueprint $table) {
            $table->id();
            $table->foreignId('subject_id')->nullable()->constrained('subjects')->onDelete('cascade'); 
            $table->foreignId('unit_id')->nullable()->constrained('units')->onDelete('cascade'); 
            $table->foreignId('classroom_id')->nullable()->constrained('classrooms')->onDelete('cascade'); 
            $table->foreignId('day_id')->nullable()->constrained('days')->onDelete('cascade'); 
            $table->time('start');
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
        Schema::dropIfExists('lectures');
    }
}
