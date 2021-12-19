<?php

namespace App\Http\Livewire\Admin\Schedule;

use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\Component;
use App\Models\{
    Day,
    Section,
    Stage,
    Unit,
    Classroom,
    Lecture,
    Subject,
    Teacher,
};

class ScheduleAdd extends Component
{
    use LivewireAlert;

    public $section;
    public $stage;
    public $unit;
    public $day;
    public $subject;
    public $teacher;
    public $time;
    public $classroom;

    public function save()
    {
        $lecture = Lecture::create(
            [
                'unit_id' => $this->unit,
                'teacher_id' => $this->teacher,
                'subject_id' => $this->subject,
                'start' => $this->time,
                'classroom_id' => $this->classroom,
                'day_id' => $this->day,
            ]
        );

        $this->alert('success', "Success!");
        $this->emitTo('livewire.admin.schedule.schedules', '$refresh');
    }

    public function render()
    {
        $sections = Section::get(['id' , 'name']);

        $stages = Stage::where('section_id' , $this->section)->get(['id' , 'name' , 'section_id']);

        $units = Unit::where('stage_id' , $this->stage)->get(['id' , 'name' , 'section_id' , 'stage_id']);

        $days = Day::get(['id' , 'name']);

        $subjects = Subject::where('stage_id' , $this->stage)->get();

        $classrooms = Classroom::get();

        $subject = $this->subject;
        $teachers = null;

        if($subject)
            $teachers = Subject::with('teachers.user')->find($subject);

        return view('livewire.admin.schedule.schedule-add' ,
            [
                'sections' => $sections,
                'stages' => $stages,
                'units' => $units,
                'days' => $days,
                'subjects' => $subjects,
                'teachers' => $teachers,
                'classrooms' => $classrooms,
            ]
        );
    }
}
