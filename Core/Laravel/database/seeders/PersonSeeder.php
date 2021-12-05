<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Person;

class PersonSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Person::create([
            'name' => 'Hassan Alkhalidi',
            'user_id' => 1,
            'training_id' => 1,
            'type' => 2,
        ]);

        Person::create([
            'name' => 'AbdulKareem Mgbl',
            'user_id' => 2,
            'training_id' => 1,
            'type' => 2,
        ]);

        Person::create([
            'name' => 'Hussam Haider',
            'user_id' => 3,
            'training_id' => 1,
            'type' => 1,
        ]);

        Person::create([
            'name' => 'Hassan Kadhim',
            'user_id' => 4,
            'training_id' => 1,
            'type' => 1,
        ]);

        Person::create([
            'name' => 'Stev',
            'user_id' => 4,
            'training_id' => 1,
            'type' => 2,
        ]);
    }
}