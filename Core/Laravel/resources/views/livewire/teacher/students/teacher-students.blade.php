<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            My Students
        </h2>
    </x-slot>
    @livewire('actions' , ['folder' => null , 'file' => null , 'search' => 'Student name or email'])
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
                                <th class="p-3 text-left">Section</th>
                                <th class="p-3 text-left">Stage</th>
                                <th class="p-3 text-left">Unit</th>
                                <th class="p-3 text-left">Actions </th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($units as $x => $unit )
                                @forelse($unit->students as $i => $student)
                                    <tr class="bg-gray-50" wire:key="student-field-{{ $student->id }}">
                                        <td class="p-3 text-center">
                                            {{ $loop->iteration }}
                                        </td>
                                        <td class="p-3">
                                            <div class="flex align-items-center">
                                                {{-- <img class="rounded-full h-12 w-12  object-cover" src="{{asset('storage/db/' . $teacher->user->id . '/1.jpg')}}" alt="unsplash image"> --}}
                                                <div class="ml-3">
                                                    <div>
                                                        <span class="font-bold text-gray-500">
                                                            {{ $student->user->name }}
                                                        </span>
                                                    </div>
                                                    <div>
                                                        <span  class="text-gray-500">
                                                            {{ $student->user->email }}
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>

                                        <td class="p-3">
                                            <div>
                                                <span class="text-gray-500">
                                                    {{ $student->section->name }}
                                                </span>
                                            </div>
                                        </td>
                                        <td class="p-3">
                                            <div>
                                                <span class="text-gray-500">
                                                    {{ $student->stage->name }}
                                                </span>
                                            </div>
                                        </td>
                                        <td class="p-3">
                                            <div >
                                                <span class="text-gray-500">
                                                    {{ $student->unit->name }}
                                                </span>
                                            </div>
                                        </td>
                                        <td>
                                            something
                                        </td>
                                    </tr>
                                @empty
                                    <tr class="bg-red-100">
                                        <td colspan="6" class="p-3 text-center">
                                            No Students
                                        </td>
                                    </tr>
                                @endforelse
                            @empty
                                <tr class="bg-red-100">
                                    <td colspan="6" class="p-3 text-center">
                                        No Units
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
                @if(!$unitID)
                    {{ $units->links() }}
                @endif
            </div>
        </section>

    </div>
</div>

<script>
    function setup() {
        return {
        activeTab: -1,
        tabs: [
            // '<span class="material-icons-outlined mr-2">add</span>New Student',
            '<span class="material-icons-outlined mr-2">search</span>Search',
        ]
        };
    };

</script>