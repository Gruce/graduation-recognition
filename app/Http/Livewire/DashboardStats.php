<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Camera;
use App\Models\Person;
use App\Models\Tracking;


class DashboardStats extends Component
{
    public function render()
    {
        return view('livewire.dashboard-stats',[
            'cameras' => Camera::get()->count(),
            'people' => Person::get()->count(),
            'trackings' => Tracking::get()->count(),
        ]);
    }
}
