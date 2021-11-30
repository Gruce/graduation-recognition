<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Subject;

class SubjectSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Subject::create([
            'name' => 'C++',
            'section_id' => 1, 
            'stage_id' => 1,
        ]);

        Subject::create([
            'name' => 'JAVA',
            'section_id' => 1,
            'stage_id' => 2,
        ]);

        Subject::create([
            'name' => 'PHP',
            'section_id' => 1, 
            'stage_id' => 3,
        ]);

        Subject::create([
            'name' => 'DATA WHEREHOUSE',
            'section_id' => 2, 
            'stage_id' => 8,
        ]);

    }
}
