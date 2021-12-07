<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Student;
use App\Models\Unit;
use App\Models\User;
use Str;


class StudentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        Student::create([
            'user_id' => 2,
            'section_id' => 1,
            'stage_id' => 4,
            'unit_id' => 1,
        ]);

        Student::create([
            'user_id' => 3,
            'section_id' => 2,
            'stage_id' => 8,
            'unit_id' => 15,
        ]);

        foreach(Unit::get() as $item){
            for($i = 1 ; $i <= 2 ; $i++){
                $name = str_random(8);
                $user = User::create([
                    'name' => $name,
                    'email' => $name . '@gmail.com',
                    'email_verified_at' => now(),
                    'password' => bcrypt('123456'),
                    'remember_token' => Str::random(10),
                    'type' => 3,
                ]);

                Student::create([
                    'user_id' => $user->id,
                    'section_id' => $item->section_id,
                    'stage_id' => $item->stage_id,
                    'unit_id' => $item->id,
                ]);
            }
        }
    }
}
