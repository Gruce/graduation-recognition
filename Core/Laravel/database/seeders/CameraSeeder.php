<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Camera;
class CameraSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Camera::create([
            'description' => 'Main Camera',
            'state' => 1,
            'classroom_id' => 1,
        ]);

        Camera::create([
            'description' => '2',
            'state' => 1,
            'classroom_id' => 2,
        ]);
        Camera::create([
            'description' => '3',
            'state' => 1,
            'classroom_id' => 3,
        ]);
        Camera::create([
            'description' => '4',
            'state' => 1,
            'classroom_id' => 4,
        ]);
        Camera::create([
            'description' => '5',
            'state' => 1,
            'classroom_id' => 5,
        ]);
    }
}
