<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Day;

class DaySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Day::create(['name' => 'Saturday']);
        Day::create(['name' => 'Sunday']);
        Day::create(['name' => 'Monday']);
        Day::create(['name' => 'Tuesday']);
        Day::create(['name' => 'Wednesday']);
        Day::create(['name' => 'Thursday']);
        // Day::create(['name' => 'Friday']);

    }
}
