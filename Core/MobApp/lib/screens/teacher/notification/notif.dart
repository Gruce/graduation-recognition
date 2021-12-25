import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/notification_controller.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/button.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/input_field.dart';
import 'package:graduaiton_app/screens/teacher/notification/button.dart';
import 'package:http/http.dart';

class Notif extends GetView {
  @override
  C co = Get.put(C());
  NotificationController controller = Get.put(NotificationController());
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            children: [
              MyinputField(
                title: 'Title',
                hint: 'Enter your title',
                controller: controller.titleController,
              ),
              MyinputField(
                title: 'Note',
                hint: 'Enter your note',
                controller: controller.bodyController,
              ),
              IconButton(
                icon: Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.grey,
                ),
                onPressed: () {
                 co.getDateFromUser();
                },
              ),
              Obx(
                () => ListView(
                  shrinkWrap: true,
                  children:
                      controller.unitsCheckbox.value.keys.map((dynamic key) {
                    return CheckboxListTile(
                      title: Text(controller.units[key].stage.name +
                          " " +
                          controller.units[key].name),
                      value: controller.unitsCheckbox.value[key],
                      activeColor: Colors.blue,
                      checkColor: Colors.white,
                      onChanged: (bool? value) => controller.check(key, value),
                    );
                  }).toList(),
                ),
              ),
              Obx(() => Column(
                    children: [
                      Text('files count ' + controller.files.length.toString()),
                      GestureDetector(
                        onTap: () => controller.pick_files(),
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Upload file",
                                  style: TextStyle(color: Colors.black)),
                              IconButton(
                                onPressed: () => controller.pick_files(),
                                icon: Icon(Icons.upload_file),
                              ),
                            ],
                          ),
                        ),
                      ),
                      controller.files_path.isNotEmpty
                          ? Container(
                              width: 300,
                              height: 150,
                              child: SingleChildScrollView(
                                child: Column(
                                    children: List.from(controller.files
                                        .asMap()
                                        .map((key, value) => MapEntry(
                                            key,
                                            Row(
                                              children: [
                                                Text(
                                                  value.name,
                                                ),
                                                IconButton(
                                                    onPressed: () => controller
                                                        .removeIndex(key),
                                                    icon: const Icon(
                                                        Icons.close_rounded)),
                                              ],
                                            )))
                                        .values
                                        .toList())),
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 20,
                      ),
                      MyButton(
                        label: 'Send',
                        onTap: () => controller.send_notification(),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _appBar(BuildContext) {
    return AppBar(
      title: Text(
        'Add Notification',
        style: TextStyle(color: Colors.black),
      ),
      elevation: 0,
      backgroundColor: Color(0xFAFAFA),
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back,
          size: 20,
          color: Colors.black,
        ),
        onTap: () {
          Get.back();
        },
      ),
    );
  }
}
