<div>
    <div class="mt-3">
        <section class="text-gray-600 body-font">
          <div class="container px-5 py-10 mx-auto bg-white rounded-lg max-w-7xl sm:px-6 lg:px-8">
            <div class="flex justify-center">
                <div class="flex-1 mx-3">
                    <h3 class="text-center">Camera</h3>
                    <video class="p-3 border-2 rounded-lg" id="video" autoplay></video>

                    <button wire:click="save" id="btn-save" disabled class="disabled:opacity-50 bg-blue-500 w-full mt-4 block hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                        Save
                    </button>
                </div>
                <div class="flex-1 mx-3">
                    <h3 class="text-center">Detection</h3>
                    <canvas class="p-3 border-2 rounded-lg top-0 left-0" id="canvas" width="200px" height="200px"></canvas>
                </div>
              </div>
          </div>
        </section>
      </div>
      <script>

        let video = document.getElementById("video");
        let model;
        // declare a canvas variable and get its context
        let canvas = document.getElementById("canvas");
        let ctx = canvas.getContext("2d");

        faces = 0;

        const setupCamera = () => {
        navigator.mediaDevices
            .getUserMedia({
            video: { width: 600, height: 400 },
            audio: false,
            })
            .then((stream) => {
                video.srcObject = stream;
            });
        };

        const detectFaces = async () => {
            if (faces > 5){
                document.getElementById("btn-save").classList.remove("disabled:opacity-50");
                document.getElementById("btn-save").removeAttribute("disabled");;
                return;
            } else {
                const prediction = await model.estimateFaces(video, false);
                if (prediction.length > 0) {
                    face = prediction[0];
                    ctx.drawImage(video,
                        // X, Y
                        face.topLeft[0], face.topLeft[1], 
                        // Width, Height
                        face.bottomRight[0] - face.topLeft[0],
                        face.bottomRight[1] - face.topLeft[1],
                        // X, Y, Width, Height
                        0, 0, canvas.width, canvas.height
                    );
                    Livewire.emit('storePhoto', canvas.toDataURL());
                    faces++;
                }
            }
        };

        setupCamera();
        video.addEventListener("loadeddata", async () => {
            model = await blazeface.load();
            // call detect faces every 100 milliseconds or 10 times every second
            setInterval(detectFaces, 1000);
        });
      </script>
</div>
