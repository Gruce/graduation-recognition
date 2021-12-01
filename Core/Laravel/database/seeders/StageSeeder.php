<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Stage;

class StageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Stage::create([
            'name' => 'First Stage',
            'section_id' => 1,
        ]);

        Stage::create([
            'name' => 'Second Stage',
            'section_id' => 1,
        ]);

        Stage::create([
            'name' => 'Third Stage',
            'section_id' => 1,
        ]);

        Stage::create([
            'name' => 'Forth Stage',
            'section_id' => 1,
        ]);

        Stage::create([
            'name' => 'First Stage',
            'section_id' => 2,
        ]);

        Stage::create([
            'name' => 'Second Stage',
            'section_id' => 2,
        ]);

        Stage::create([
            'name' => 'Third Stage',
            'section_id' => 2,
        ]);

        Stage::create([
            'name' => 'Forth Stage',
            'section_id' => 2,
        ]);
    }
}
