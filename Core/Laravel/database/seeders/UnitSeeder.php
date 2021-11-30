<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Unit;

class UnitSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Unit::create([
            'name' => 'A',
            'stage_id' => 4,
        ]);

        Unit::create([
            'name' => 'B',
            'stage_id' => 4,
        ]);

        Unit::create([
            'name' => 'A',
            'stage_id' => 8,
        ]);

        Unit::create([
            'name' => 'B',
            'stage_id' => 8,
        ]);

        Unit::create([
            'name' => 'A',
            'stage_id' => 3,
        ]);

        Unit::create([
            'name' => 'B',
            'stage_id' => 3,
        ]);
    }
}
