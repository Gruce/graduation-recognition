<?php

namespace App\Http\Livewire\Teacher\Tasks;

use Livewire\Component;
use Illuminate\Http\Request;
use App\Http\Controllers\Api\TeacherController;
use Livewire\WithFileUploads;
use Jantinnerezo\LivewireAlert\LivewireAlert;


class TaskSend extends Component
{
    use WithFileUploads;
    use LivewireAlert;

    public $title;
    public $body;
    public $to = 0;
    public $ids = [];
    public $idsData = [];
    public $files ;


    public function save(){   
        $data = [
            'livewire' => true,
            'title' => $this->title,
            'body' => $this->body,
            'to' => 1,
            'ids' => array_keys($this->ids),
            'files' => $this->files ? $this->files : null,
        ];

        $response = TeacherController::send_task(new Request($data));
        $status = $response->getStatusCode() ;
        $rspData = $response->getData();

        $alert = 'success';
        $msg = 'Done';
        if($status != 200){
            $alert = 'warning';
            $msg = $rspData->data;
        }

        $this->alert($alert , $msg);
        $this->emitTo('teacher.tasks.teacher-tasks', '$refresh');
    }

    public function render()
    {
        $teacher = auth()->user()->teacher()->first();
        $section = $teacher->section()->get();
        $stages = $teacher->stages()->get();
        $units = $teacher->units()->where('stage_id' , $this->to)->get();

        // switch ($this->to) {
        //     case 1: $this->idsData = $units->toArray(); break;
        //     case 2: $this->idsData = $stages->toArray(); break;
        //     case 3: $this->idsData = $section->toArray(); break;
        //     default:
        //         break;
        // }

        return view('livewire.teacher.tasks.task-send',
            [
                'stages' => $stages,
                'units' => $units,
            ]
        );
    }
}
