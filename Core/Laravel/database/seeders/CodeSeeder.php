<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\{
    Code,
    Unit,
};

class CodeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $units = Unit::get();

        foreach($units as $unit)
            $unit->code()->create(['code' => str_random(12)]);
    }
}
