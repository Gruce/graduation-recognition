<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Trackings
        </h2>
    </x-slot>

    <div class="py-12">
        {{-- <livewire:cameras :selectedId="$id" :personId="$person_id" :all="true" /> --}}
        @livewire('cameras', ['selectedId' => $id , 'personId' => $person_id , 'all' => true])
        
        <livewire:trackings wire:poll.5000ms :cameraId="$id" :personId="$person_id" />

        {{-- b:@livewire('component', ['user' => $user], wire($user->id)) --}}
    </div>
</x-app-layout>
