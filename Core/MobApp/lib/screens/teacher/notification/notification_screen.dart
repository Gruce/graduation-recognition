import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/notification_controller.dart';
import 'package:graduaiton_app/models/student_models/unit.dart';
import 'package:graduaiton_app/screens/general/people/attendance.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/button.dart';
import 'package:graduaiton_app/screens/teacher/layout.dart';
import 'package:file_picker/file_picker.dart';
import 'package:graduaiton_app/screens/teacher/notification/notif.dart';
import 'package:intl/intl.dart';

class TeacherNotification extends GetView {
  TeacherNotification({Key? key}) : super(key: key);

  @override
  NotificationController controller = Get.put(NotificationController());

  Widget build(BuildContext context) {
    return TeacherLayoutScreen(
        title: 'Notification',
        child: Column(children: [
          IconButton(
              onPressed: () => Get.to(Attendance()), icon: Icon(Icons.ac_unit)),
          GestureDetector(
            onTap: () => Get.to(Notif()),
            child: Container(
                width: 170,
                height: 50,
                padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Color(0xff6875F5),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Send Notification",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.mail,
                      color: Colors.white,
                    )
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: GetBuilder<NotificationController>(
                  builder: (_) => controller.notifications.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.notifications.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              // onTap: () => Get.to(() => StudentsProfileWidget(),
                              // arguments: controller.students[index].id),
                              child: Card(
                                  elevation: 0,
                                  clipBehavior: Clip.antiAlias,
                                  child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffd4d8ff),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        children: [
                                          const Text("Select file",
                                              style: TextStyle(
                                                  color: Color(0xff6875F5))),
                                          IconButton(
                                            onPressed: () =>
                                                controller.pick_files(),
                                            icon: const Icon(
                                              Icons.upload_file,
                                              color: Color(0xff6875F5),
                                            ),
                                          ),
                                        ],
                                      ))),
                            );
                          })
                      : SizedBox(
                          width: double.infinity,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: const Text('Not Found',
                                  style: TextStyle(fontSize: 24))))))
        ]));
  }
}
