import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/notification_controller.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/button.dart';
import 'package:graduaiton_app/screens/teacher/layout.dart';
import 'package:file_picker/file_picker.dart';

class TeacherNotification extends GetView {
  TeacherNotification({Key? key}) : super(key: key);

  NotificationController controller = Get.put(NotificationController());

  Widget build(BuildContext context) {
    return TeacherLayoutScreen(
        title: 'Notification',
        child: Column(
          children: [
            FloatingActionButton.extended(
              backgroundColor: Color(0xff6875F5),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        scrollable: true,
                        title: Text('Enter your notification you wnat to send'),
                        insetPadding: EdgeInsets.zero,
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Title',
                                    icon: Icon(Icons.account_box),
                                    border: const OutlineInputBorder(),
                                  ),
                                  controller: controller.titleController,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                TextField(
                                  maxLines: 2,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  decoration: InputDecoration(
                                    labelText: 'Message',
                                    icon: Icon(Icons.message),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Obx(() => Column(
                                          children: [
                                            Text('files conut ' +
                                                controller.files.length
                                                    .toString()),
                                            ElevatedButton(
                                              onPressed: () =>
                                                  controller.pick_files(),
                                              child: const Text(
                                                  "Open file picker"),
                                            ),
                                            controller.files_path.isNotEmpty
                                                ? Column(
                                                    children: List.from(
                                                        controller.files
                                                            .asMap()
                                                            .map(
                                                                (key, value) =>
                                                                    MapEntry(
                                                                        key,
                                                                        Row(
                                                                          children: [
                                                                            Text(value.name),
                                                                            IconButton(
                                                                                onPressed: () => controller.removeIndex(key),
                                                                                icon: const Icon(Icons.close_rounded)),
                                                                          ],
                                                                        )))
                                                            .values
                                                            .toList()))
                                                : Container(),
                                          ],
                                        )),
                                    Obx(() => Container(
                                        width: double.maxFinite,
                                        height: double.maxFinite,
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: controller
                                              .unitsCheckbox.keys
                                              .map((int key) {
                                            return CheckboxListTile(
                                              title: Text(controller
                                                      .units[key].stage.name +
                                                  " " +
                                                  controller.units[key].name),
                                              value:
                                                  controller.unitsCheckbox[key],
                                              activeColor: Colors.pink,
                                              checkColor: Colors.white,
                                              onChanged: (bool? value) {
                                                controller.unitsCheckbox[key] =
                                                    value!;
                                                print(controller.unitsCheckbox);
                                              },
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          MyButton(
                            label: 'Send',
                            onTap: () => controller.send_notification(),
                          )
                        ],
                      );
                    });
              },
              icon: Icon(Icons.phone_android),
              label: Text("Add Notification"),
            ),
          ],
        ));
  }
}
