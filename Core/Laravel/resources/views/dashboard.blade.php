<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            @switch(auth()->user()->type)
                @case(1) {{-- for admin --}}
                    @livewire('dashboard-stats')
                    @livewire('cameras')
                    @break
                @case(2) {{-- for teacher --}}
                    @livewire('teacher.index')
                    @break
                @default
            @endswitch
            
        </div>
    </div>
</x-app-layout>
