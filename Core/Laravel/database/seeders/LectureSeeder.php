<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Lecture;

class LectureSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Lecture::create(
            [
                'unit_id' => 15,
                'teacher_id' => 2,
                'subject_id' => 4,
                'start' => '8:00 AM',
                'classroom_id' => 5,
                'day_id' => 2,
            ]
        );

        Lecture::create(
            [
                'unit_id' => 15,
                'teacher_id' => 2,
                'subject_id' => 4,
                'start' => '10:00 AM',
                'classroom_id' => 5,
                'day_id' => 2,
            ]
        );

        Lecture::create(
            [
                'unit_id' => 16,
                'teacher_id' => 2,
                'subject_id' => 4,
                'start' => '12:00 AM',
                'classroom_id' => 5,
                'day_id' => 2,
            ]
        );
    }
}
