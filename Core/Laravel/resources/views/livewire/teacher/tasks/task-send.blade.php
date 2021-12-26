<div>
    <div class="container items-center">
        <form wire:submit.prevent="save" class="flex flex-col w-full mx-auto mb-4 transition duration-500 ease-in-out transform" enctype="multipart/form-data">
            @csrf
            <div class="grid grid-cols-4 gap-4">
                <div class="relative pt-4">
                    <label class="text-base leading-7 text-gray-600">
                        Task Title
                    </label>
                    <input wire:model="title" type="text" placeholder="Task Title" class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
                </div>
                <div class="relative pt-4">
                    <label class="text-base leading-7 text-gray-600">
                        Task Body
                    </label>
                    <textarea  wire:model="body"  placeholder="Task Body" cols="3" rows="3" class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2"></textarea>
                </div>
                <div class="relative pt-4">
                    <label class="text-base leading-7 text-gray-600">
                        Task To
                    </label> 
                    <select wire:model="to" class="w-full px-4 py-2 mt-2 mr-4 text-base text-black transition duration-500 ease-in-out transform rounded-lg bg-gray-100 focus:border-gray-600 focus:bg-white focus:outline-none focus:shadow-outline focus:ring-2 ring-offset-current ring-offset-2">
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
                        @foreach ($units as $index => $item)
                            <div class="col-6">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="true" id="tag" wire:model="ids.{{$item['id']}}">
                                    <label class="form-check-label" for="tag">
                                        {{ $item->name}}
                                    </label>
                                </div>
                            </div>
                        @endforeach
                </div>
                <div class="relative pt-4">
                    <label class="text-base leading-7 text-gray-600">
                        Task File
                    </label> 
                    <input type="file" class="custom-input-file" data-multiple-caption="{count} files selected" multiple wire:model="files" />
                </div>
            </div>
            <div class="flex items-center w-full pt-4 mb-4 mt-4">
                <button  type="submit" class="w-full py-3 text-base text-white transition duration-500 ease-in-out transform bg-blue-600 border-blue-600 rounded-md focus:shadow-outline focus:outline-none focus:ring-2 ring-offset-current ring-offset-2 hover:bg-blue-800 "> Add </button>
            </div>
        </form>
    </div>
</div>
