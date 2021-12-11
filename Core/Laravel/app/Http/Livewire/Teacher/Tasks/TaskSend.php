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
    public $to = 1;
    public $ids = [];
    public $idsData = [];
    public $file;


    public function save(){   
        $data = [
            'title' => $this->title,
            'body' => $this->body,
            'to' => $this->to,
            'ids' => array_keys($this->ids),
            'file' => $this->file ? $this->file[0] : null,
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
    }

    public function render()
    {
        $teacher = auth()->user()->teacher()->first();
        $section = $teacher->section()->get();
        $units = $teacher->units()->with('stage:id,name')->get();
        $stages = $teacher->stages()->get();

        switch ($this->to) {
            case 1: $this->idsData = $units->toArray(); break;
            case 2: $this->idsData = $stages->toArray(); break;
            case 3: $this->idsData = $section->toArray(); break;
            default:
                break;
        }

        return view('livewire.teacher.tasks.task-send');
    }
}
