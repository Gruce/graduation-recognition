<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Str;
class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\User::create([
            'name' => 'Hassan Alkhalidi',
            'email' => 'gruceing@gmail.com',
            'email_verified_at' => now(),
            'password' => bcrypt('123456'),
            'remember_token' => Str::random(10),
        ]);

        \App\Models\Camera::create([
            'description' => 'Main Camera',
            'state' => 0,
           ]);

        \App\Models\Person::create([
            'name' => 'Hassan Alkhalidi',
            'training_id' => 1,
            'type' => 1,
        ]);
    }
}
