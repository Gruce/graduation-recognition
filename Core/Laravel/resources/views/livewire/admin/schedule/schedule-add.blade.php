<div>
    <div class="container items-center">
        <div> 
            <select wire:model="section" class="px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                <option value="0">Select Section</option>
                @foreach ($sections as $section)
                    <option value="{{$section->id}}">{{$section->name}}</option>
                @endforeach
            </select>
            <select wire:model="stage" class="px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                <option value="0">Select stage</option>
                @foreach ($stages as $stage)
                    <option value="{{$stage->id}}">{{$stage->name}}</option>
                @endforeach
            </select>
            <select wire:model="unit" class="px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                <option value="0">Select unit</option>
                @foreach ($units as $unit)
                    <option value="{{$unit->id}}">{{$unit->name}}</option>
                @endforeach
            </select>
            <select wire:model="day" class="px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                <option value="0">Select day</option>
                @foreach ($days as $day)
                    <option value="{{$day->id}}">{{$day->name}}</option>
                @endforeach
            </select>
        </div>
        <form wire:submit.prevent="save"
            class="flex flex-col w-full mx-auto mb-4 transition duration-500 ease-in-out transform">
            <div class="grid grid-cols-2 gap-4">
                <div class="relative pt-4">
                    <label for="name" class="text-base leading-7 text-gray-600">
                        Subject Name
                    </label>
                    <select wire:model="subject"
                        class="w-full px-4 py-2 mt-2 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="0" selected>Select Subject</option>
                        @foreach ($subjects as $subject)
                            <option value="{{$subject->id}}">{{$subject->name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="relative pt-4">
                    <label for="name" class="text-base leading-7 text-gray-600">
                        Teacher Name
                    </label>
                    
                    <select  wire:model="teacher"  
                        class="w-full px-4 py-2 mt-2 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="0" selected>Select Teacher</option>
                        @if($teachers)
                            @foreach ($teachers->teachers as $teacher)
                                <option value="{{$teacher->id}}">{{$teacher->user->name}}</option>
                            @endforeach
                        @endif
                    </select>
                </div>
                <div class="relative pt-4">
                    <label for="name" class="text-base leading-7 text-gray-600">
                        Start
                    </label>
                    <input wire:model="start" type="time" class="w-full px-4 py-2 mt-2 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                </div>
                <div class="relative pt-4">
                    <label for="name" class="text-base leading-7 text-gray-600">
                        End
                    </label>
                    <input wire:model="end" type="time" class="w-full px-4 py-2 mt-2 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                </div>
                <div class="relative pt-4">
                    <label for="name" class="text-base leading-7 text-gray-600">
                        Classroom
                    </label>
                    
                    <select  wire:model="classroom" 
                        class="w-full px-4 py-2 mt-2 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="0" selected>Select Classroom</option>
                        @if($classrooms)
                            @foreach ($classrooms as $classroom)
                                <option value="{{$classroom->id}}">{{$classroom->name}}</option>
                            @endforeach
                        @endif
                    </select>
                </div>
            </div>

            <div class="flex items-center w-full pt-4 mb-4 mt-4">
                <button type="submit"
                    class="w-full py-3 text-base text-white transition duration-500 ease-in-out transform bg-blue-600 border-blue-600 rounded-md focus:shadow-outline focus:outline-none focus:ring-2 ring-offset-current ring-offset-2 hover:bg-blue-800 ">
                    Add </button>
            </div>
        </form>
    </div>
</div>
