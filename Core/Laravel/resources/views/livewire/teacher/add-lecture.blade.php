<div>
    <div class="container items-center">
        <form wire:submit.prevent="add" class="flex flex-col w-full mx-auto mb-4 transition duration-500 ease-in-out transform" enctype="multipart/form-data">
            @csrf
            <div class="grid grid-cols-2 gap-4">
                <div class="relative pt-4">
                    <label class="text-base leading-7 text-gray-600">
                        Stage
                    </label>
                    <select wire:model="stageID" class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="0">Select Stage</option>
                        @foreach ($stages as $stage)
                            <option value="{{$stage->id}}">{{$stage->name}}</option>
                        @endforeach
                    </select>
                </div>
                
                <div class="relative pt-4">
                    <label class="text-base leading-7 text-gray-600">
                        Unit
                    </label> 
                    <select wire:model="unitID" class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="0">Select Unit</option>
                        @foreach ($units as $unit)
                            <option value="{{$unit->id}}">{{$unit->name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="relative pt-4">
                    <label class="text-base leading-7 text-gray-600">
                        Subject
                    </label> 
                    <select wire:model="subjectID" class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="0">Select Subject</option>
                        @foreach ($subjects as $subject)
                            <option value="{{$subject->id}}">{{$subject->name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="relative pt-4">
                    <label class="text-base leading-7 text-gray-600">
                        Classroom
                    </label> 
                    <select wire:model="classroomID" class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="0">Select Classroom</option>
                        @foreach ($classrooms as $classroom)
                            <option value="{{$classroom->id}}">{{$classroom->name}}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="grid grid-cols-2 gap-4">
                <div class="relative pt-4">
                    <label class="text-base leading-7 text-gray-600">
                        Day
                    </label> 
                    <select wire:model="dayID" class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="0">Select Day</option>
                        @foreach ($days as $day)
                            <option value="{{$day->id}}">{{$day->name}}</option>
                        @endforeach
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
            </div>
            <div class="flex items-center w-full pt-4 mb-4 mt-4">
                <button  type="submit" class="w-full py-3 text-base text-white transition duration-500 ease-in-out transform bg-blue-600 border-blue-600 rounded-md focus:shadow-outline focus:outline-none focus:ring-2 ring-offset-current ring-offset-2 hover:bg-blue-800 "> Add </button>
            </div>
        </form>
    </div>
</div>
