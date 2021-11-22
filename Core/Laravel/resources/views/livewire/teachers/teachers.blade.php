<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Teachers
        </h2>
    </x-slot>
    @livewire('teachers.teacher-action')
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
                                <th class="p-3 text-left">Speciality</th>
                                <th class="p-3 text-left">Link Trained Person</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($teachers as $i => $teacher)
                                <tr class="bg-gray-50" wire:key="teacher-field-{{ $teacher->id }}">
                                    <td class="p-3 text-center">
                                        {{ $loop->iteration }}
                                    </td>
                                    <td class="p-3">
                                        <div class="flex align-items-center">
                                            {{-- <img class="rounded-full h-12 w-12  object-cover" src="{{asset('storage/db/' . $teacher->user->id . '/1.jpg')}}" alt="unsplash image"> --}}

                                            <div class="ml-3">
                                                <div x-data="{ show: false }">
                                                    <span x-show="!show" @click="show = !show"
                                                        class="font-bold text-gray-500">
                                                        {{ $teacher->user->name }}
                                                    </span>
                                                    <div x-show="show">
                                                        <div class="text-gray-600 focus-within:text-gray-400">
                                                            <input wire:keydown.enter="save()" wire:model="teachers.{{ $i }}.user.name"
                                                                class="p-0 block w-full text-sm text-gray-400 bg-gray-100 rounded-md focus:outline-none focus:bg-gray-50 focus:text-gray-900"
                                                                placeholder="{{ $teacher->user->name }}"
                                                                autocomplete="off">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div x-data="{ show: false }">
                                                    <span x-show="!show" @click="show = !show" class="text-gray-500">
                                                        {{ $teacher->user->email }}
                                                    </span>
                                                    <div x-show="show">
                                                        <div class="mt-1 text-gray-600 focus-within:text-gray-400">
                                                            <input wire:keydown.enter="save()" type="email"
                                                                wire:model="teachers.{{ $i }}.user.email"
                                                                class="py-3 block w-full text-sm text-gray-400 bg-gray-100 rounded-md px-5 focus:outline-none focus:bg-gray-50 focus:text-gray-900"
                                                                placeholder="{{ $teacher->user->email }}"
                                                                autocomplete="off">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        <div x-data="{ show: false }">
                                            <span x-show="!show" @click="show = !show" class="text-gray-500">
                                                {{ $teacher->speciality }}
                                            </span>
                                            <div x-show="show">
                                                <div class="text-gray-600 focus-within:text-gray-400">
                                                    <input wire:keydown.enter="save()" wire:model="teachers.{{ $i }}.speciality"
                                                        class="py-3 block w-full text-sm text-gray-400 bg-gray-100 rounded-md px-5 focus:outline-none focus:bg-gray-50 focus:text-gray-900"
                                                        placeholder="{{ $teacher->speciality }}" autocomplete="off">
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="p-3">
                                        @if ($teacher->person)
                                            <div class="flex text-blue-600">
                                                <span class="material-icons-outlined mr-3">
                                                    link
                                                </span>
                                                Linked
                                            </div>
                                        @else
                                            <div wire:click="link({{ $teacher->id }})"
                                                class="flex text-red-600 cursor-pointer">
                                                <span class="material-icons-outlined mr-1">
                                                    link
                                                </span>
                                                Not linked
                                            </div>
                                        @endif
                                    </td>
                                </tr>
                            @empty
                                <tr class="bg-red-100">
                                    <td colspan="4" class="p-3 text-center">
                                        No Teachers
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
