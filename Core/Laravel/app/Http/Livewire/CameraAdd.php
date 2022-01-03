<?php

namespace App\Http\Livewire;

use Livewire\Component;
use Jantinnerezo\LivewireAlert\LivewireAlert;

use App\Models\{
    Classroom,
    Camera,
};

class CameraAdd extends Component
{
    use LivewireAlert;
    protected $listeners = ['$refresh'];

    public $description;
    public $classroomID;
    public $source;

    public function add(){

        Camera::create(
            [
                'description' => $this->description,
                'classroom_id' => $this->classroomID,
                'state' => true,
                'source' => $this->source,
            ]
        );

        $this->alert('success' , 'Done');
        $this->emitTo('cameras', '$refresh');
    }
    public function render()
    {
        $classrooms = Classroom::get();
        return view('livewire.camera-add' , ['classrooms' => $classrooms]);
    }
}
