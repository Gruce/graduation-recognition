<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Teacher;

class TeacherSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Teachers

        $data = [
            'user_id' => 1,
            'person_id' => 1,
            'section_id' => 1,
            'speciality' => 'PHP',
        ];

        $teacher = Teacher::create($data);
        $subjects_id = [1,3];
        $teacher->subjects()->attach($subjects_id);

    }
}
