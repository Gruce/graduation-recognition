<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Str;
use App\Models\User;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\Camera::create([
            'description' => 'Main Camera',
            'state' => 1,
        ]);
                  
        $this->call([

            UserSeeder::class,
            PersonSeeder::class,
            SectionSeeder::class,
            StageSeeder::class,
            UnitSeeder::class,
            SubjectSeeder::class,
            StudentSeeder::class,
            SettingSeeder::class,
            TeacherSeeder::class,
        ]);
    }
}
