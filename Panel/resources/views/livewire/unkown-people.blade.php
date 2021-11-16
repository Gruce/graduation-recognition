<div>
    <div class="p-24 flex flex-wrap items-center justify-center">
        @foreach ($people as $index => $person)
        <div wire:key="person-card-{{ $person->id }}" class="flex-shrink-0 m-2 relative overflow-hidden bg-gray-500 rounded-lg max-w-xs shadow-lg">
            <svg class="absolute bottom-0 left-0 mb-8" viewBox="0 0 375 283" fill="none" style="transform: scale(1.5); opacity: 0.1;">
              <rect x="159.52" y="175" width="152" height="152" rx="8" transform="rotate(-45 159.52 175)" fill="white"/>
              <rect y="107.48" width="152" height="152" rx="8" transform="rotate(-45 0 107.48)" fill="white"/>
            </svg>
            <div class="relative pt-10 px-10 flex items-center justify-center">
              <div class="block absolute w-48 h-48 bottom-0 left-0 -mb-24 ml-3" style="background: radial-gradient(black, transparent 60%); transform: rotate3d(0, 0, 1, 20deg) scale3d(1, 0.6, 1); opacity: 0.2;"></div>
              <img class="relative w-40 rounded" src="{{asset('storage/' . $person->trackings->first()->image_path)}}" alt="">
            </div>
            <div class="relative text-white px-6 pb-6 mt-6">
              <span class="block opacity-75 -mb-1">
                {{ $person->created_at->diffForHumans() }}
                
              </span>
              <div class="flex justify-between">
                <span class="block font-semibold text-xl">
                    {{ $person->name }}
                </span>

                <label class="flex justify-start items-start">
                    <div class="bg-white border-2 rounded border-gray-400 w-6 h-6 flex flex-shrink-0 justify-center items-center focus-within:border-blue-500">
                        <input type="checkbox" class="opacity-0 absolute">
                        <svg class="fill-current hidden w-4 h-4 text-green-500 pointer-events-none" viewBox="0 0 20 20"><path d="M0 11l2-2 5 5L18 3l2 2L7 18z"/></svg>
                    </div>
                </label>
                
              </div>
            </div>
          </div>
        @endforeach
    </div>
    {{ $people->links() }}

    <style>
    input:checked + svg {
        display: block;
    }
    </style>
</div>
