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
        User::create([
            'name' => 'Hassan Alkhalidi',
            'email' => 'gruceing@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'remember_token' => Str::random(10),
            'type' => 'admin'
        ]);

        User::create([
            'name' => 'Hussam Haider',
            'email' => 'hussam@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'remember_token' => Str::random(10),
            'type' => 'admin'
        ]);

        User::create([
            'name' => 'Hassan Kadhim',
            'email' => 'hassan@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'remember_token' => Str::random(10),
            'type' => 'admin'
        ]);

        User::create([
            'name' => 'Abdulkareem',
            'email' => 'karm.99zo@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'remember_token' => Str::random(10),
            'type' => 'admin'
        ]);

        \App\Models\Camera::create([
            'description' => 'Main Camera',
            'state' => 0,
        ]);

        \App\Models\Person::create([
            'name' => 'Hassan Alkhalidi',
            'user_id' => 1,
            'training_id' => 1,
            'type' => 2,
        ]);

        \App\Models\Person::create([
            'name' => 'AbdulKareem Mgbl',
            'user_id' => 2,
            'training_id' => 1,
            'type' => 2,
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
