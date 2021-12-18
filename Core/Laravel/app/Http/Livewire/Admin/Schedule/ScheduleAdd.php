<?php

namespace App\Http\Livewire\Admin\Schedule;

use Livewire\Component;
use App\Models\{
    Day,
    Section,
    Stage,
    Unit,
    Classroom,
    Lecture,
};

class ScheduleAdd extends Component
{
    public function render()
    {
        return view('livewire.admin.schedule.schedule-add');
    }
}
