<div>
    <div class="container items-center">
        @foreach ($unitsSelected as $unit)
            <span>{{$loop->iteration}} : {{$unit->name}} - {{$unit->stage->name}}</span> <br>
        @endforeach
        <form wire:submit.prevent="add" class="flex flex-col w-full mx-auto mb-4 transition duration-500 ease-in-out transform" enctype="multipart/form-data">
            @csrf
            <div class="grid grid-cols-2 gap-4">
                <div class="relative pt-4">
                    <label class="text-base leading-7 text-gray-600">
                        Stages
                    </label> 
                    <select wire:model="stageID" class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                        <option value="0">Select Stage</option>
                        @foreach ($stages as $index => $stage)
                            <option value="{{$stage->id}}">{{$stage->name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="relative pt-4">
                    <label class="text-base leading-7 text-gray-600">
                        Units
                    </label> 
                    <div class="col-6 pt-4">
                        <div class="form-check">
                            @foreach ($units as $index => $item)
                                <input class="form-check-input" type="checkbox" value="true" id="tag" wire:model="ids.{{$item['id']}}">
                                <label class="form-check-label" for="tag">
                                    {{ $item->name}}
                                </label>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
            <div class="flex items-center w-full pt-4 mb-4 mt-4">
                <button  type="submit" class="w-full py-3 text-base text-white transition duration-500 ease-in-out transform bg-blue-600 border-blue-600 rounded-md focus:shadow-outline focus:outline-none focus:ring-2 ring-offset-current ring-offset-2 hover:bg-blue-800 "> Add </button>
            </div>
        </form>
    </div>
</div>

