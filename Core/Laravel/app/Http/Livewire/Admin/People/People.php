<?php

namespace App\Http\Livewire\Admin\People;

use Livewire\Component;
use App\Models\Person;
use Livewire\WithPagination;
use App\Http\Controllers\ActionController;

class People extends Component
{
    use WithPagination;

    protected $listeners = ['reRenderParent', 'search'];
    
    public $editingPerson = -1;
    public $search;

    function search($text){
        $this->search = $text;
    }

    public function delete($model , $id){
        $response = ActionController::delete($model,$id);
        $alert = $response->getStatusCode() == 200 ? 'success' : 'warning';
        $this->alert($alert , $response->getData()->data);
        $this->emitTo('teacher.tasks.teacher-tasks', '$refresh');
    }

    function selectEditPerson($id){
        $this->editingPerson = $this->editingPerson == $id ? -1 : $id;
    }

    public function reRenderParent(){
        $this->mount();
        $this->render();
        $this->editingPerson = -1;
    }

    public function render()
    {
        $people = Person::where('name', 'LIKE', '%'.$this->search.'%')
            ->where('type', '!=', '-1')
            ->with('trackings')
            ->orderBy('id', 'DESC')
            ->paginate(10);

        return view('livewire.admin.people.people', ['people' => $people]);
    }
}
