<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            People
        </h2>
    </x-slot>
    @livewire('actions' , ['folder' => 'people' , 'file' => 'people-add' , 'search' => 'People name'])
    <div class="mt-3">
        <section class="text-gray-600 body-font">
            <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
                <div class="w-full" wire:loading>
                    <div class="flex justify-center items-center">
                        <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-gray-300"></div>
                    </div>
                </div>
                <div class="flex justify-center">
                    <table class="table text-gray-400 border-separate space-y-6 w-full text-sm">
                        <thead class="bg-gray-200 text-gray-500">
                            <tr>
                                <th class="p-3">#</th>
                                <th class="p-3 text-left">Name</th>
                                <th class="p-3 text-left">Training Id</th>
                                <th class="p-3 text-left">Date Time Added</th>
                                <th class="p-3 text-left">Last Seen</th>
                                <th class="p-3 text-left">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($people as $person)
                                <tr class="bg-gray-50">
                                    <td class="p-3 text-center">
                                        {{ $loop->iteration }}
                                    </td>
                                    <td class="p-3">
                                        <div class="flex align-items-center">
                                            {{-- <img class="rounded-full h-12 w-12  object-cover" src="https://images.unsplash.com/photo-1613588718956-c2e80305bf61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80" alt="unsplash image"> --}}
                                            <div class="ml-3">
                                                <a href="{{ route('trackings', [0, $person->id]) }}"
                                                    class="text-gray-500 transition hover:text-gray-800 font-bold">
                                                    {{ $person->name }}
                                                </a>
                                                <div class="">
                                                    @switch($person->type)
                                                        @case(0)
                                                            Visitor
                                                        @break
                                                        @case(1)
                                                            Student
                                                        @break
                                                        @case(2)
                                                            Emlpoyer
                                                        @break
                                                        @default
                                                            Unkown
                                                    @endswitch
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        {{ $person->training_id }} 
                                    </td>
                                    <td class="p-3">
                                        <span class="flex items-left flex-col">
                                            <div class="flex">
                                                <span class="material-icons-outlined text-base mr-2">today</span>
                                                {{ date('Y-m-d', strtotime($person->created_at)) }}
                                            </div>
                                            <div class="flex">
                                                <span class="material-icons-outlined text-base mr-2">watch_later</span>
                                                {{ date('h:i:s A', strtotime($person->created_at)) }}
                                            </div>
                                        </span>
                                    </td>
                                    <td class="p-3">
                                        @if ($person->trackings->count() > 0)
                                            <span class="flex items-left flex-col">
                                                <div class="flex">
                                                    <span class="material-icons-outlined text-base mr-2">
                                                        videocam
                                                    </span>
                                                    <span>
                                                        {{ $person->trackings->last()->camera->description }}
                                                    </span>
                                                </div>
                                                <div class="flex">
                                                    <span class="material-icons-outlined text-base mr-2">
                                                        schedule
                                                    </span>
                                                    {{ $person->trackings->last()->created_at->diffForHumans() }}
                                                </div>
                                            </span>
                                        @else 
                                            <h1>Not seen</h1>
                                        @endif
                                    </td>
                                    <td class="p-3">
                                        <button wire:click="selectEditPerson({{ $person->id }})"
                                            class="text-gray-400 hover:text-gray-600 mr-2">
                                            <i class="material-icons-outlined text-base">edit</i>
                                        </button>
                                    </td>
                                </tr>
                                @if ($person->id == $editingPerson)
                                    <td colspan="6">
                                        {{-- @livewire('people.people-edit', ['personId' => $editingPerson], key("{{now()}}")) --}}
                                        <livewire:people.people-edit :personId="$editingPerson" key="{{ now() }}" />
                                    </td>
                                @endif
                                @empty
                                    <tr class="bg-red-100">
                                        <td colspan="6" class="p-3 text-center">
                                            No People
                                        </td>
                                    </tr>
                                @endforelse

                            </tbody>
                        </table>
                    </div>
                    {{ $people->links() }}
                </div>
            </section>

        </div>
</div>

<script>
    function setup() {
        return {
        activeTab: -1,
        tabs: [
            '<span class="material-icons-outlined mr-2">add</span>New Person',
            '<span class="material-icons-outlined mr-2">search</span>Search',
        ]
        };
    };
</script>
