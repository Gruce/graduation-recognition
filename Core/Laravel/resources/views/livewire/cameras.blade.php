<div class="mt-3" wire:poll.750ms>
  <section class="text-gray-600 body-font">
    <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
      @if ($personId)
      <div class="flex items-center">
        <span class="material-icons-outlined ml-3">
          person
        </span>
        <span class="bg-gray-100 text-gray-600 rounded-lg px-2 py-1">
          {{ $person->name }}
        </span>
        <a href="{{ route('trackings', [0, 0]) }}" class="bg-red-500 hover:bg-red-700 text-white font-bold px-2 rounded-lg ml-1">
            <span class="material-icons-outlined mt-1">
                close
            </span>
        </a>
      </div>
      @endif
      <div class="flex flex-wrap">
        {{-- Camera --}}
        @if ($all)
        <div class="p-4 md:w-1/3">
          <div class="h-full border-2 @if ($selectedId == null) border-green-300 @else border-gray-200 @endif border-opacity-60 rounded-lg overflow-hidden transition duration-300 ease-in-out hover:bg-gray-50">
            {{-- <img class="lg:h-48 md:h-36 w-full object-cover object-center" src="https://dummyimage.com/720x400" alt="blog"> --}}
            <div class="p-6">
              <h2 class="tracking-widest text-xs title-font font-medium text-gray-400 mb-1">
                <br />
              </h2>
              <h1 class="title-font text-lg font-medium text-gray-900 mb-3">
                All Cameras
              </h1>
              <p class="leading-relaxed mb-3">
                {{-- ### --}}
              </p>
              <div class="flex items-center flex-wrap ">
                <a href="{{ route('trackings', [0, $personId]) }}" class="text-indigo-500 inline-flex items-center md:mb-2 lg:mb-0">
                  Trackings
                </a>
              </div>
            </div>
          </div>
        </div>
        @endif

        @forelse($cameras as $camera)
        <div class="p-4 md:w-1/3">
          <div class="h-full border-2 @if ($selectedId == $camera->id) border-green-300 @else border-gray-200 @endif border-opacity-60 rounded-lg overflow-hidden transition duration-300 ease-in-out hover:bg-gray-50">
            {{-- <img class="lg:h-48 md:h-36 w-full object-cover object-center" src="https://dummyimage.com/720x400" alt="blog"> --}}
            <div class="p-6">
              <h2 class="tracking-widest text-xs title-font font-medium text-gray-400 mb-1">
                Camera {{ $camera->id }}
              </h2>
              <h1 class="title-font text-lg font-medium text-gray-900 mb-3">
                {{ $camera->description }}
              </h1>
              <p class="leading-relaxed mb-3">
                {{-- ### --}}
              </p>
              <div class="flex items-center flex-wrap">
                <a href="{{ route('trackings', [$camera->id, $personId] ) }}" class="text-indigo-500 inline-flex items-center md:mb-2 lg:mb-0">
                  Trackings
                </a>
                <span class="text-gray-400 mr-3 inline-flex items-center lg:ml-auto md:ml-0 ml-auto leading-none text-sm py-1 pr-3 border-r-2 border-gray-200">
                  <svg class="w-4 h-4 mr-1" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24">
                    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                    <circle cx="12" cy="12" r="3"></circle>
                  </svg>{{ count($camera->trackings) }}
                </span>
                <span class="text-gray-400 pl-3 mb-1 inline-flex items-center leading-none text-lg">
                  <span wire:click="state({{$camera->id}} , {{$camera->state}})" class="cursor-pointer relative inline-flex rounded-md shadow-sm">
                    @if ($camera->state)
                      <span class="flex absolute h-3 w-3 top-0 right-0 -mt-1 -mr-1">
                        <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-green-300 opacity-75"></span>
                        <span class="relative inline-flex rounded-full h-3 w-3 bg-green-300"></span>
                      </span>
                    @else 
                      <span class="flex absolute h-3 w-3 top-0 right-0 -mt-1 -mr-1">
                        <span class="relative inline-flex rounded-full h-3 w-3 bg-red-500"></span>
                      </span>
                    @endif
                  </span>
                  {{-- @if ($camera->state)
                  <span class="relative inline-flex rounded-md shadow-sm">
                    <span class="flex absolute h-3 w-3 top-0 right-0 -mt-1 -mr-1">
                      <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-green-300 opacity-75"></span>
                      <span class="relative inline-flex rounded-full h-3 w-3 bg-green-300"></span>
                    </span>
                  </span>

                  @else
                  <span wire:click="state" class="cursor-pointer relative inline-flex rounded-md shadow-sm">
                    <span class="flex absolute h-3 w-3 top-0 right-0 -mt-1 -mr-1">
                      <span class="relative inline-flex rounded-full h-3 w-3 bg-red-500"></span>
                    </span>
                  </span>
                  @endif --}}
                </span>
              </div>
            </div>
          </div>
        </div>
        @empty
        No cameras
        @endforelse
      </div>
    </div>
  </section>
</div>
