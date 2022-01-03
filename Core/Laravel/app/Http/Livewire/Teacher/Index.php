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
    protected $listeners = ['$refresh'];
    public $absence = false;

    public $students;
    public $studentID = [];
    public $studentsAbsenceId = [] ;

    public function save($lectureID){
        $studentID = \array_diff($this->studentID, [false]);
        $studentID = array_keys($studentID);
        $lecture = Lecture::find($lectureID);


        foreach($studentID as $id)
            Absence::create(
                [
                    'lecture_id' => $lecture->id,
                    'subject_id' => $lecture->subject_id, 
                    'student_id'=> $id
                ]
            );
        
        $this->absence = !$this->absence;

        $this->alert('success' , 'Done');
        $this->emitTo('livewire.teacher.index', '$refresh');
    }

    public function start($lectureID){
        $lecture = Lecture::find($lectureID);
        $start_time = date('Y-m-d') . ' ' . $lecture->start;

        $camera_ids = $lecture->classroom->cameras->pluck('id')->toArray();

        $unit = Unit::find($lecture->unit_id);
        
        $students_tracking = Student::whereHas('user.trackings' , function($track) use($start_time , $camera_ids){
            return $track->where('created_at' ,'>' , $start_time)->whereIn('camera_id' , $camera_ids);
        })->where('unit_id' , $unit->id)->get();

        $students = Student::where('unit_id' , $unit->id)->get();

        $students_absence = [] ;

        foreach($students as $student)
            if(!in_array($student->toArray() , $students_tracking->toArray())){
                $this->studentID[$student['id']] = true;
                array_push($students_absence , $student->id);
            }

        $this->studentsAbsenceId = $students_absence;
        $this->students = Student::where('unit_id' , $unit->id)->with('user:id,name,email')->get();
                
        $this->absence = !$this->absence;
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

        // dd($units_lectures->toArray());

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
