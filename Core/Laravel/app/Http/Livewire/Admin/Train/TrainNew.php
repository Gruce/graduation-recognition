<?php

namespace App\Http\Livewire\Admin\Train;

use Livewire\Component;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use App\Models\Person;

class TrainNew extends Component
{
    protected $listeners = ['storePhoto'];

    public $photos = [];

    public function storePhoto($imageBlob) {
        $imageBlob = str_replace('data:image/png;base64,', '', $imageBlob);
        $imageBlob = str_replace(' ', '+', $imageBlob);
        $imageName = 'photo_' . (count($this->photos)+1) . '.png';

        array_push($this->photos, [
            'name' => $imageName,
            'blob' => $imageBlob
        ]);

        
    }

    public function save(){
        $person = new Person();
        $person->name = 'Hassan Alkhalidi';
        $person->training_id = 1;
        $person->type = 2;
        $person->save();

        foreach($this->photos as $photo){
            Storage::disk('public')->put('db/' . $person->id . '/' . $photo['name'], base64_decode($photo['blob']));
        }

        $this->photos = [];
    }

    public function mount() {
        // Photo::truncate();
    }

    public function render()
    {
        return view('livewire.admin.train.train-new');
    }
}
