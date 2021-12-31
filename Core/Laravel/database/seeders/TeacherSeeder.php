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

        // ID 1
        $data = [
            'user_id' => 6,
            'section_id' => 2,
            'speciality' => 'PHP',
        ];

        $teacher = Teacher::create($data);
        $subjects_id = [5];
        $teacher->subjects()->attach($subjects_id);
        $stages_id = [8];
        $teacher->stages()->attach($stages_id);
        $units_id = [15,16];
        $teacher->units()->attach($units_id);

        // ID : 2
        $data = [
            'user_id' => 5,
            'section_id' => 2,
            'speciality' => 'HTML',
        ];

        $teacher = Teacher::create($data);
        $subjects_id = [4];
        $teacher->subjects()->attach($subjects_id);
        $stages_id = [8];
        $teacher->stages()->attach($stages_id);
        $units_id = [15,16];
        $teacher->units()->attach($units_id);

    }
}
