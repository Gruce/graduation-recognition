<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Person;
use Livewire\WithPagination;

class People extends Component
{
    use WithPagination;

    public $editingPerson = -1;

    public $search;

    protected $listeners = ['reRenderParent', 'search'];
    
    function search($text){
        $this->search = $text;
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
        $people = Person::where('name', 'like', '%'.$this->search.'%')->with('trackings')->orderBy('id', 'DESC')->paginate(10);

        return view('livewire.people', ['people' => $people]);
    }
}
