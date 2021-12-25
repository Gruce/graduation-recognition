<?php

namespace App\Http\Livewire\Admin\Teachers;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\WithPagination;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use App\Http\Controllers\ActionController;

use App\Models\{
    Teacher,
    Person,
    Subject,
    Section,
};

class Teachers extends Component
{
    use LivewireAlert;
    use WithPagination;

    protected $listeners = ['$refresh' , 'search'];

    protected $rules = [
        'teachers.*.user.name' => 'required',
        'teachers.*.user.email' => 'required',
        'teachers.*.speciality' => 'required',
        'teachers.*.section_id' => 'required',
        'teachers.*.subjects.*.id' => 'required',
        'teachers.*.subjects.*.name' => 'required',
    ];

    public $teachers;
    public $search;
    public $subjects;
    public $sections;
    public $subjectID = [];

    public function delete($model , $id){
        $response = ActionController::delete($model,$id);
        $alert = $response->getStatusCode() == 200 ? 'success' : 'warning';
        $this->alert($alert , $response->getData()->data);
        $this->emitTo('teacher.tasks.teacher-tasks', '$refresh');
    }

    public function changeSubject($teacherID , $subjectID){
        $teacher = Teacher::find($teacherID);
    }

    public function save(){

        // dd($this->subjectID[1]);
        $this->validate();

        foreach($this->teachers as $teacher){
            $subjectsIds = array_filter($teacher->subjects->pluck('id')->toArray());
            $teacher->subjects()->sync($subjectsIds);
            $teacher->user->save();
            $teacher->save();
        }
        $this->alert('success', "Success!");
    }

    function search($text){
        $this->search = $text;
        $this->mount();
    }

    public function mount(){
        $search = '%' . $this->search . '%';
        $this->teachers = Teacher::with(
            [
                'user:id,name,email',
                'section:id,name',
                'stages:id,name,section_id',
                'units:id,name,stage_id,section_id',
                'subjects:id,name'
            ]
        )->whereHas('user' , function($q) use ($search){
            $q->where('name' , 'LIKE' , $search)->orWhere('email' , 'LIKE' , $search);
        })
        ->orderBy('id', 'DESC')
        ->get(['id','user_id' , 'section_id' , 'speciality']);

        $this->subjects = Subject::get(['id' , 'section_id' , 'name']);


        foreach($this->teachers as $teacher){


            $ids = [];
            foreach($teacher->subjects as $subject){
                $ids += [$subject->id => true];
            }
            $this->subjectID += [$teacher->id => $ids];
        }

        $this->sections = Section::get(['id' , 'name']);

    }

    public function render()
    {
        return view('livewire.admin.teachers.teachers');
    }
}
