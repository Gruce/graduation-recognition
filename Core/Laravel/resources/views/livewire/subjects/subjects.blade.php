<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Subjects
        </h2>
    </x-slot>
    @livewire('subjects.subject-action')
    <div class="mt-3">
        <section class="text-gray-600 body-font">
            <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">

                {{-- <div class="w-full" wire:loading>
                    <div class="flex justify-center items-center">
                        <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-gray-300"></div>
                    </div>
                </div> --}}

                <div class="flex justify-center">
                    <table class="table text-gray-400 border-separate space-y-6 w-full text-sm">
                        <thead class="bg-gray-200 text-gray-500">
                            <tr>
                                <th class="p-3">#</th>
                                <th class="p-3 text-left">Name</th>
                                <th class="p-3 text-left">Teachers Count</th>
                                <th class="p-3 text-left">Section</th>
                                <th class="p-3 text-left">Stage</th>
                                <th class="p-3 text-left">Actions </th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($subjects as $i => $subject)
                                <tr class="bg-gray-50" wire:key="subject-field-{{ $subject->id }}">
                                    <td class="p-3 text-center">
                                        {{ $loop->iteration }}
                                    </td>
                                    <td class="p-3">
                                        <div class="flex align-items-center">
                                            <div class="ml-3">
                                                <div x-data="{ show: false }">
                                                    <span x-show="!show" @click="show = !show"
                                                        class="font-bold text-gray-500">
                                                        {{ $subject->name }}
                                                    </span>
                                                    <div x-show="show">
                                                        <div class="text-gray-600 focus-within:text-gray-400">
                                                            <input wire:keydown.enter="save()" wire:model="subjects.{{ $i }}.name"
                                                                class="p-0 block w-full text-sm text-gray-400 bg-gray-100 rounded-md focus:outline-none focus:bg-gray-50 focus:text-gray-900"
                                                                placeholder="{{ $subject->name }}"
                                                                autocomplete="off">
                                                        </div>
                                                    </div>
                                                </div>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        <div>
                                            <span class="text-gray-500">
                                                {{ $subject->teachers_count }}
                                            </span>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        <div x-data="{ show: false }">
                                            <span x-show="!show" @click="show = !show" class="text-gray-500">
                                                {{ $subject->section->name }}
                                            </span>
                                            <div x-show="show">
                                                <div class="text-gray-600 focus-within:text-gray-400">
                                                    <select wire:keydown.enter="save()" wire:model="subjects.{{ $i }}.section_id" class="py-3 block w-full text-sm text-gray-400 bg-gray-100 rounded-md px-5 focus:outline-none focus:bg-gray-50 focus:text-gray-900">
                                                        <option value="">Please select</option>
                                                        @foreach ($sections as $section)
                                                            <option value="{{$section->id}}">{{$section->name}}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        <div x-data="{ show: false }">
                                            <span x-show="!show" @click="show = !show" class="text-gray-500">
                                                @if($subject->section_id == $subject->stage->section_id)
                                                    {{ $subject->stage->name }}
                                                @else 
                                                    <span class="text-red-500">Please select!</span> 
                                                    {{-- <input type="hidden" value="{{false}}" wire:model="isStage"> --}}
                                                @endif
                                            </span>
                                            <div x-show="show">
                                                <div class="text-gray-600 focus-within:text-gray-400">
                                                    <select wire:keydown.enter="save()" wire:model="subjects.{{ $i }}.stage_id" class="py-3 block w-full text-sm text-gray-400 bg-gray-100 rounded-md px-5 focus:outline-none focus:bg-gray-50 focus:text-gray-900">
                                                        <option value="">Please select</option>
                                                        @foreach ($stages as $stage)
                                                                @if($stage->section_id == $subject->section_id)
                                                                    <option value="{{$stage->id}}">{{$stage->name}}</option>
                                                                @endif
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <button>ADD TEACHER</button>
                                        <a href="{{route('delete' , [ 'Subject' , $subject->id])}}" >Delete</a>
                                    </td>
                                </tr>
                            @empty
                                <tr class="bg-red-100">
                                    <td colspan="4" class="p-3 text-center">
                                        No Subjects
                                    </td>
                                </tr>
                            @endforelse

                        </tbody>
                    </table>
                </div>
                {{-- {{ $teachers->links() }} --}}
            </div>
        </section>

    </div>

    <div class="absolute bottom-0 left-0 m-3">
        <button wire:click="save"
            class="flex items-center text-white px-4 w-auto h-12 bg-blue-600 rounded hover:bg-blue-800 active:shadow-lg mouse shadow transition ease-in duration-200 focus:outline-none">
            <span class="material-icons-outlined mr-3">
                save
            </span>
            <span>Save</span>
        </button>
    </div>
</div>

<script>
    function setup() {
        return {
        activeTab: -1,
        tabs: [
            '<span class="material-icons-outlined mr-2">add</span>New Teacher',
            '<span class="material-icons-outlined mr-2">search</span>Search',
        ]
        };
    };
</script>
