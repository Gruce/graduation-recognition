import 'package:get/get.dart';

import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class CameraWidgetController extends GetxController {
  late ChewieController chewieController;
  RxBool intialized = false.obs;

  @override
  void onInit() async {
    VideoPlayerController videoPlayerController = VideoPlayerController.network(
        'http://stream.shabakaty.com:6001/movies/ch1/ch1_240.m3u8');

    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );

    intialized.value = true;

    super.onInit();
  }
}
