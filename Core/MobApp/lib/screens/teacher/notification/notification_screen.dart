import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/notification_controller.dart';
import 'package:graduaiton_app/screens/general/attendance/attendance.dart';
import 'package:graduaiton_app/screens/teacher/layout.dart';
import 'package:graduaiton_app/screens/teacher/notification/notif.dart';


class TeacherNotification extends GetView {
  TeacherNotification({Key? key}) : super(key: key);

  @override
  NotificationController controller = Get.put(NotificationController());

  Widget build(BuildContext context) {
    return TeacherLayoutScreen(
        title: 'Notification',
        child: Column(children: [
          IconButton(
              onPressed: () => Get.to(Attendance()), icon: Icon(Icons.one_x_mobiledata)),
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
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                              child: Card(
                                  elevation: 0,
                                  clipBehavior: Clip.antiAlias,
                                  child: Flexible(
                                    child: Container(
                                        padding: const EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: const Color(0xfffffff),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            ListTile(
                                                title: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        margin: const EdgeInsets
                                                            .only(bottom: 15),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text('To :'),
                                                            Column(
                                                              children: List.from(
                                                                  controller
                                                                      .notifications[
                                                                          index]
                                                                      .units
                                                                      .map((unit) =>
                                                                          Text(
                                                                            unit.stage.name +
                                                                                ' - ' +
                                                                                unit.name,
                                                                            style:
                                                                                TextStyle(fontSize: 12),
                                                                          ))),
                                                            ),
                                                            Text(
                                                              controller
                                                                  .notifications[
                                                                      index]
                                                                  .created_at,
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                          ],
                                                        )),
                                                    Divider(
                                                      thickness: 1,
                                                    ),
                                                    Text(
                                                      'Title : ' +
                                                          controller
                                                              .notifications[
                                                                  index]
                                                              .title,
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                  ],
                                                ),
                                                subtitle: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                      'Note : ' +
                                                          controller
                                                              .notifications[
                                                                  index]
                                                              .body,
                                                      style: TextStyle(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.6)),
                                                    )),
                                                  ],
                                                )),
                                          ],
                                        )),
                                  )),
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
