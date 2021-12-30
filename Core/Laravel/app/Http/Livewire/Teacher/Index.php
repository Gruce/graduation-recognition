<?php

namespace App\Http\Livewire\Teacher;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use App\Http\Controllers\{
    ActionController,
};
use App\Models\{
    Lecture,
    Unit,
    Student,
    Absence
};

class Index extends Component
{
    use LivewireAlert;
    protected $listeners = ['$refresh', 'search'];
    public $absence = false;

    // public $lecture;



    public function start($lectureID){
        $lecture = Lecture::find($lectureID);
        $start_time = date('Y-m-d') . ' ' . $lecture->start;

        $unit = Unit::find($lecture->unit_id);
        
        $students_tracking = Student::whereHas('user.trackings' , function($track) use($start_time){
            return $track->where('seen' ,'>' , $start_time);
        })->where('unit_id' , $unit->id)->get();

        $students = Student::where('unit_id' , $unit->id)->get();

        foreach($students as $student)
            if(!in_array($student->toArray() , $students_tracking->toArray()))
                Absence::create(
                    [
                        'lecture_id' => $lecture->id,
                        'subject_id' => $lecture->subject_id, 
                        'student_id'=> $student->toArray()['id']
                    ]
                );
                
        $this->absence = !$this->absence;
        $this->alert('success' , 'Done');
        $this->emitTo('livewire.teacher.index', '$refresh');
    }

    public function delete($model , $id){
        $response = ActionController::delete($model,$id);
        $alert = $response->getStatusCode() == 200 ? 'success' : 'warning';
        $this->alert($alert , $response->getData()->data);
        $this->emitTo('livewire.teacher.index', '$refresh');
    }
    
    public function render()
    {
        $teacher = auth()->user()->teacher()->first();

        $units_lectures = $teacher->get_lectures()->get();

        $current_lecture = $teacher->current_lecture();

        $this->lecture = $current_lecture;

        return view('livewire.teacher.index' , 
            [
                'units_lectures' => $units_lectures,
                'current_lecture' => $current_lecture,
            ]
        );
    }
}
