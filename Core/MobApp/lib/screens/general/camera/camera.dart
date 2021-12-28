import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/screens/general/camera/camera_controller.dart';

class CameraWidget extends GetWidget {
  CameraWidget({Key? key}) : super(key: key);

  @override
  CameraWidgetController controller = Get.put(CameraWidgetController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.intialized.value
        ? Chewie(
            controller: controller.chewieController,
          )
        : const Text("Loading"));
  }
}
