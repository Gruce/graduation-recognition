<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Tracking;
use App\Models\Person;
use App\Models\Camera;
use Livewire\WithPagination;

class Trackings extends Component
{
    use WithPagination;

    public $cameraId;
    public $personId;

    public $imagePath = null;

    protected $listeners = ['$refresh'];

    public function showPreview($image){
        $this->imagePath = $image;
    }

    public function render()
    {
        $trackings = null;
        if ($this->cameraId){
            $trackings = Tracking::where('camera_id', $this->cameraId);
            if ($this->personId)
                $trackings = $trackings->where('user_id', $this->personId);
            $trackings = $trackings->with('camera', 'user');
        } else
            $trackings = Tracking::with('camera', 'user');

        return view('livewire.trackings', ['trackings' => $trackings->orderBy('id', 'DESC')->paginate(10)]);
    }
}
