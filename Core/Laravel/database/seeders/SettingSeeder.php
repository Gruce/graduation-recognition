<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Setting;

class SettingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Setting::create([
            'title' => 'Stages Count',
            'key'   => 'stages',
            'value' => '4'
        ]); 

        Setting::create([
            'title' => 'App Restart',
            'key'   => 'app_restart',
            'value' => '0'
        ]); 
    }
}
