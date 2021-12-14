<div>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            My Units
        </h2>
    </x-slot>
    @livewire('actions' , ['folder' => null , 'file' => null , 'search' => 'Unit name'])
    <div class="mt-3">
        <section class="text-gray-600 body-font">
            <div class="container mx-auto">
                <div class="flex flex-wrap text-center">
                    @forelse($units as $unit)
                        <div class="w-1/3 p-1 pl-0" >
                            <a href="{{route('teacher_students' , ['unitID' => $unit->id])}}">
                                <div class="p-6 bg-white rounded-lg transition duration-300 ease-in-out border border-transparent hover:border-gray-300">
                                    <h6 class="title-font font-medium text-3xl text-gray-900">{{$unit->stage->name}}</h6>
                                    <h2 class="title-font font-medium text-3xl text-gray-900">{{$unit->name}}</h2>
                                <p class="leading-relaxed">students count : {{$unit->students_count}}</p>
                                </div>
                            </a>
                        </div>
                    @empty
                        <p>No Units</p>
                    @endforelse
                </div>
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