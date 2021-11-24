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
            'name' => 'PHP',
            'stage_id' => 3,
        ]);

        Subject::create([
            'name' => 'JAVA',
            'stage_id' => 4,
        ]);
    }
}
