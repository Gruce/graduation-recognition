<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Sections
        </h2>
    </x-slot>
    @livewire('actions' , ['folder' => 'sections' , 'file' => 'section-add' , 'search' => 'Section name'])
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
                                <th class="p-3 text-left">Stage Count</th>
                                <th class="p-3 text-left">Unit Count</th>
                                <th class="p-3 text-left">Subject Count</th>
                                <th class="p-3 text-left">Teacher Count</th>
                                <th class="p-3 text-left">Student Count </th>
                                <th class="p-3 text-left">Actions </th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($sections as $i => $section)
                                <tr class="bg-gray-50" wire:key="section-field-{{ $section->id }}">
                                    <td class="p-3 text-center">
                                        {{ $loop->iteration }}
                                    </td>
                                    <td class="p-3">
                                        <div class="flex align-items-center">
                                            <div class="ml-3">
                                                <div x-data="{ show: false }">
                                                    <span x-show="!show" @click="show = !show"
                                                        class="font-bold text-gray-500">
                                                        {{ $section->name }}
                                                    </span>
                                                    <div x-show="show">
                                                        <div class="text-gray-600 focus-within:text-gray-400">
                                                            <input wire:keydown.enter="save()" wire:model="sections.{{ $i }}.name"
                                                                class="p-0 block w-full text-sm text-gray-400 bg-gray-100 rounded-md focus:outline-none focus:bg-gray-50 focus:text-gray-900"
                                                                placeholder="{{ $section->name }}"
                                                                autocomplete="off">
                                                        </div>
                                                    </div>
                                                </div>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        <div>
                                            <span class="text-gray-500">
                                                {{ $section->stages_count }}
                                            </span>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        <div>
                                            <span class="text-gray-500">
                                                {{ $section->units_count }}
                                            </span>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        <div>
                                            <span class="text-gray-500">
                                                {{ $section->subjects_count }}
                                            </span>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        <div>
                                            <span class="text-gray-500">
                                                {{ $section->teachers_count }}
                                            </span>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        <div>
                                            <span class="text-gray-500">
                                                {{ $section->students_count }}
                                            </span>
                                        </div>
                                    </td>
                                    <td>
                                        <a href="{{route('delete' , [ 'Section' , $section->id])}}" class="text-red-500"><i class="material-icons text-base">delete</i></a>
                                    </td>
                                </tr>
                            @empty
                                <tr class="bg-red-100">
                                    <td colspan="8" class="p-3 text-center">
                                        No Sections
                                    </td>
                                </tr>
                            @endforelse

                        </tbody>
                    </table>
                </div>
                {{-- {{ $sections->links() }} --}}
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
            '<span class="material-icons-outlined mr-2">add</span>New Section',
            '<span class="material-icons-outlined mr-2">search</span>Search',
        ]
        };
    };
</script>
