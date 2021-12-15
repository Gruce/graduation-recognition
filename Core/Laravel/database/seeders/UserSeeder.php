<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Str;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // id = 1 
        User::create([
            'name' => 'Hassan Alkhalidi',
            'email' => 'gruceing@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'remember_token' => Str::random(10),
            'type' => 1
        ]);

        // id = 2
        User::create([
            'name' => 'Hussam Haider',
            'email' => 'hussam@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'remember_token' => Str::random(10),
            'type' => 3
        ]);

        // id = 3
        User::create([
            'name' => 'Hassan Kadhim',
            'email' => 'hassan@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'remember_token' => Str::random(10),
            'type' => 3
        ]);

        // id = 4
        User::create([
            'name' => 'Abdulkareem',
            'email' => 'krm@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'remember_token' => Str::random(10),
            'type' => 1
        ]);

        // id = 5
        User::create([
            'name' => 'Hassan Hazim',
            'email' => 'hazim@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'remember_token' => Str::random(10),
            'type' => 2,
        ]);

        // id = 6
        User::create([
            'name' => 'stev',
            'email' => 'stev@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'remember_token' => Str::random(10),
            'type' => 2,
        ]);
    }
}
