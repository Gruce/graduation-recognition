<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            My Students
        </h2>
    </x-slot>
    @livewire('actions' , ['folder' => 'teacher.subjects' , 'file' => 'subject-add' , 'search' => 'Subject name'])
    <div class="mt-3">
        <section class="text-gray-600 body-font">
            <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">

                <div class="flex justify-center">
                    <table class="table text-gray-400 border-separate space-y-6 w-full text-sm">
                        <thead class="bg-gray-200 text-gray-500">
                            <tr>
                                <th class="p-3">#</th>
                                <th class="p-3 text-left">Name</th>
                                <th class="p-3 text-left">Stage</th>
                                <th class="p-3 text-left">Actions </th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($subjects as $i => $subject)
                                <tr class="bg-gray-50" wire:key="student-field-{{ $subject->id }}">
                                    <td class="p-3 text-center">
                                        {{ $loop->iteration }}
                                    </td>
                                    <td class="p-3">
                                        <div class="flex align-items-center">
                                            <div class="ml-3">
                                                <div>
                                                    <span class="font-bold text-gray-500">
                                                        {{ $subject->name }}
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        <div>
                                            <span class="text-gray-500">
                                                {{ $subject->stage->name }}
                                            </span>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        <button wire:click="delete({{ $subject->id}})" class="text-red-500"> 
                                            <i class="material-icons text-base">delete</i>
                                        </button>
                                    </td>
                                </tr>
                            @empty
                                <tr class="bg-red-100">
                                    <td colspan="6" class="p-3 text-center">
                                        No Subjects
                                    </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
                {{-- @if(!$unitID)
                    {{ $units->links() }}
                @endif --}}
            </div>
        </section>

    </div>
</div>

<script>
    function setup() {
        return {
        activeTab: -1,
        tabs: [
            '<span class="material-icons-outlined mr-2">add</span>New Subject',
            '<span class="material-icons-outlined mr-2">search</span>Search',
        ]
        };
    };

</script>