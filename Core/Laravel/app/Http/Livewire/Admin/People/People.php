<?php

namespace App\Http\Livewire\Admin\People;

use Livewire\Component;
use App\Models\User;
use Livewire\WithPagination;
use App\Http\Controllers\{
    ActionController,
    Api\UserController,
};

class People extends Component
{
    use WithPagination;

    protected $listeners = ['$refresh', 'search'];
    
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
        $people = User::where('name', 'LIKE', '%'.$this->search.'%')
            ->with(
                [
                    'trackings' => function($tracking){
                        return $tracking->with('camera.classroom')->latest()->take(1);
                    }
                ]
            )->orderBy('id', 'DESC')->paginate(10);

        return view('livewire.admin.people.people', ['people' => $people]);
    }
}
