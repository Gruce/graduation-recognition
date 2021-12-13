<?php

namespace App\Http\Livewire\Admin\Sections;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;
use Livewire\WithPagination;
use App\Http\Controllers\ActionController;
use App\Models\{
    Section,
};

class Sections extends Component
{
    use LivewireAlert;
    use WithPagination;

    protected $listeners = ['$refresh' , 'search'];

    protected $rules = [
        'sections.*.name' => 'required|string|min:3',
    ];

    public $search;
    public $section;
    
    public function search($text){
        $this->search = $text;
        $this->mount();
    }

    public function delete($model , $id){
        $response = ActionController::delete($model,$id);
        $alert = $response->getStatusCode() == 200 ? 'success' : 'warning';
        $this->alert($alert , $response->getData()->data);
        $this->emitTo('teacher.tasks.teacher-tasks', '$refresh');
    }

    public function save(){
        $this->validate();

        foreach($this->sections as $section){
            $section->save();
        }
        $this->alert('success', "Success!");
    }

    public function mount(){
        $search = '%' . $this->search . '%';
        $this->sections = Section::where('name' , 'LIKE' , $search)->withCount(
            [
                'stages',
                'units',
                'subjects',
                'teachers',
                'students'
            ]
        )->get(['id' , 'name']);
    }
    public function render()
    {
        return view('livewire.admin.sections.sections');
    }
}
