<?php

namespace App\Http\Livewire\Admin;

use Livewire\Component;
use App\Models\Setting;
use Jantinnerezo\LivewireAlert\LivewireAlert;

class Settings extends Component
{
    use LivewireAlert;

    public $settings;
    protected $rules = [
        'settings.*.value' => 'required',
    ];
    public function save(){
        $this->validate();
        $this->settings->each->save();
        $this->alert('success', "Success!");
    }
    public function mount(){
        $this->settings = Setting::all();
    }
    public function render(){
        return view('livewire.admin.settings')->extends('settings-menu')->layout('layouts.app');
        
    }
}

