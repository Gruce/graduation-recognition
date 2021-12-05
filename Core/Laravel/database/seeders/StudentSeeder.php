<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Student;

class StudentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Student::create([
            'user_id' => 2,
            'section_id' => 1,
            'stage_id' => 4,
            'unit_id' => 1,
        ]);

        Student::create([
            'user_id' => 3,
            'section_id' => 2,
            'stage_id' => 8,
            'unit_id' => 3,
        ]);

        Student::create([
            'user_id' => 5,
            'section_id' => 1,
            'stage_id' => 4,
            'unit_id' => 2,
        ]);

    }
}
