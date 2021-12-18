<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Classroom;

class ClassroomSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Classroom::create([
            'name' => 1,
        ]);
        Classroom::create([
            'name' => 2,
        ]);
        Classroom::create([
            'name' => 3,
        ]);
        Classroom::create([
            'name' => 4,
        ]);
        Classroom::create([
            'name' => 5,
        ]);
    }
}
