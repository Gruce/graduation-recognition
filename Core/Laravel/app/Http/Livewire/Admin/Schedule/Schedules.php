<?php

namespace App\Http\Livewire\Admin\Schedule;

use Livewire\Component;
use App\Http\Controllers\ApiController;
use App\Models\{
    Day,
    Section,
    Stage,
    Unit,
};


class Schedules extends Component
{
    protected $listeners = ['$refresh'];

    public $section;
    public $stage;
    public $unit;
    public $dayName;

    public function render()
    {
        $response = ApiController::lectures($this->dayName , $this->section , $this->stage , $this->unit);
        $lectures = $response->getData()->data;

        $days = Day::get(['id' , 'name']);

        $sections = Section::get(['id' , 'name']);

        $stages = Stage::where('section_id' , $this->section)->get(['id' , 'name' , 'section_id']);

        $units = Unit::where('stage_id' , $this->stage)->get(['id' , 'name' , 'section_id' , 'stage_id']);
        // dd($lectures);
        return view('livewire.admin.schedule.schedules' , [
            'lectures' => $lectures,
            'days' => $days,
            'sections' => $sections,
            'stages' => $stages,
            'units' => $units,
        ]);
    }
}
