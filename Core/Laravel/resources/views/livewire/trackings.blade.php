<div>
  <div class="mt-3">
    <section class="text-gray-600 body-font">
      <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">

        <div class="flex justify-center">
          <table class="table text-gray-400 border-separate space-y-6 w-full text-sm">
            <thead class="bg-gray-200 text-gray-500">
              <tr>
                <th class="p-3">#</th>
                <th class="p-3 text-left">Person Name</th>
                <th class="p-3 text-left">Camera Description</th>
                <th class="p-3 text-left">Date Time</th>
                <th class="p-3 text-left">Action</th>
              </tr>
            </thead>
            <tbody>
              @forelse($trackings as $tracking)
                <tr class="bg-gray-50">
                  <td class="p-3 text-center">
                    {{ $loop->iteration }}
                  </td>
                  <td class="p-3">
                    <div class="flex align-items-center">
                      {{-- <img class="rounded-full h-12 w-12  object-cover" src="https://images.unsplash.com/photo-1613588718956-c2e80305bf61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80" alt="unsplash image"> --}}
                      <div class="ml-3">
                        <a href="{{ route('trackings', [$cameraId ? $cameraId : 0, $tracking->person->id]) }}" class="
                          @if ($personId == $tracking->person->id)
                            text-green-300
                          @else
                            text-gray-500
                            transition
                            hover:text-gray-800
                          @endif font-bold">
                          {{ $tracking->person->name }}
                        </a>
                        <div class="">
                          @switch($tracking->person->type)
                            @case(0)
                              Visitor
                              @break
                            @case(1)
                              Student
                              @break
                            @case(2)
                              Emlpyer
                              @break
                            @default
                            Unkown
                          @endswitch
                        </div>
                      </div>
                    </div>
                  </td>
                  <td class="p-3">
                    {{ $tracking->camera->description }}
                  </td>
                  <td class="p-3">
                    <span class="flex items-center">
                      <span class="material-icons-outlined text-base mr-2">today</span>
                      {{ date('Y-m-d', strtotime($tracking->created_at)) }}

                      <span class="material-icons-outlined text-base mx-2">watch_later</span>
                      {{ date('h:i:s A', strtotime($tracking->created_at)) }}
                    </span>
                  </td>
                  <td class="p-3 ">
                    <button wire:click="showPreview('{{ $tracking->image_path }}')" class="text-gray-400 hover:text-gray-600 mr-2">
                      <i class="material-icons-outlined text-base">visibility</i>
                    </button>
                  </td>
                </tr>
              @empty
                No Trackings
              @endforelse

            </tbody>
          </table>
        </div>
        {{ $trackings->links() }}

      </div>
    </section>









    @if ($imagePath)
        <div class="fixed z-10 inset-0 overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true">
        <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
            <div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" aria-hidden="true"></div>

            <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

            <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-2xl sm:w-full">
            <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                <div class="sm:flex sm:items-start">
                
                <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
                    <h3 class="text-lg leading-6 font-medium text-gray-900" id="modal-title">
                    Image Preview
                    </h3>
                    <div class="mt-2">
                    <p class="text-sm text-gray-500">
                        <img src="{{asset('storage/' . $imagePath)}}" alt="">
                    </p>
                    </div>
                </div>
                </div>
            </div>
            <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                <button wire:click.prevent="showPreview('')" type="button" class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm">
                Cancel
                </button>
            </div>
            </div>
        </div>
        </div>
    @endif












  </div>
</div>

<style>
  .table {
    border-spacing: 0 15px;
  }

  i {
    font-size: 1rem !important;
  }

  .table tr {
    border-radius: 20px;
  }

  tr td:nth-child(n+5),
  tr th:nth-child(n+5) {
    border-radius: 0 .625rem .625rem 0;
  }

  tr td:nth-child(1),
  tr th:nth-child(1) {
    border-radius: .625rem 0 0 .625rem;
  }

</style>
