<?php

namespace App\Http\Livewire\Teacher\Students;

use Livewire\Component;
use Livewire\WithPagination;
use Jantinnerezo\LivewireAlert\LivewireAlert;


class TeacherStudents extends Component
{
    use WithPagination;
    use LivewireAlert;
    protected $listeners = ['$refresh', 'search'];

    public $search;
    public $unitID;
    public function search($text){
        $this->search = $text;
    }

    public function mount($unitID = null){
        $this->unitID = $unitID;
    }

    public function render()
    {
        $unitID = $this->unitID;
        $search = '%' . $this->search . '%';
        $teacher = auth()->user()->teacher()->first();
        $units = [] ;

        if($unitID){
            if(in_array($unitID , $teacher->units()->get()->pluck('id')->toArray())){
                $units = $teacher->units()->with(['students' => function($student) use ($search){
                    return $student->with(
                        [
                            'user:id,email,name',
                            'section:id,name',
                            'stage:id,name'
                        ]
                    )->whereHas('user' , function($user) use ($search){
                        return $user->where('name' , 'LIKE' , $search)->orWhere('email' , 'LIKE' , $search);
                    })->get();
                }])->find($unitID);
                $units = [0 => $units];
            } else {
                $this->alert('warning', "You don't have this unit!");
            }
            
        } else {
            $units = $teacher->units()->with(['students' => function($student) use ($search){
                return $student->with(
                    [
                        'user:id,email,name',
                        'section:id,name',
                        'stage:id,name'
                    ]
                )->whereHas('user' , function($user) use ($search){
                    return $user->where('name' , 'LIKE' , $search)->orWhere('email' , 'LIKE' , $search);
                })->get();
            }])->paginate(1);
        }

        return view('livewire.teacher.students.teacher-students' , ['units' => $units]);
    }
}
