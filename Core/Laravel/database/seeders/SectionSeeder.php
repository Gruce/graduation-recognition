<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Section;

class SectionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Section::create(
            ['name' => 'Computer Science']
        );
        
        Section::create(
            ['name' => 'Information Systems']
        );
    }
}
