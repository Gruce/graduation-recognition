<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Unit;
use App\Models\Stage;

class UnitSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        foreach(Stage::get() as $item){
            Unit::create([
                'name' => 'A',
                'section_id' => $item->section_id,
                'stage_id' => $item->id,
            ]);
            Unit::create([
                'name' => 'B',
                'section_id' => $item->section_id,
                'stage_id' => $item->id,
            ]);
        }
    }
}
