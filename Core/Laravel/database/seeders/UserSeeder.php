<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
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
            'type' => 1
        ]);

        User::create([
            'name' => 'Hussam Haider',
            'email' => 'hussam@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'remember_token' => Str::random(10),
            'type' => 1
        ]);

        User::create([
            'name' => 'Hassan Kadhim',
            'email' => 'hassan@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'remember_token' => Str::random(10),
            'type' => 1
        ]);

        User::create([
            'name' => 'Abdulkareem',
            'email' => 'karm.99zo@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'remember_token' => Str::random(10),
            'type' => 1
        ]);

        User::create([
            'name' => 'Hassan Hazim',
            'email' => 'hazim@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'remember_token' => Str::random(10),
            'type' => 3,
        ]);
    }
}
