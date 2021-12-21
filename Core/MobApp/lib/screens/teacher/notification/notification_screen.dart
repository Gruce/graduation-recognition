import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/notification_controller.dart';
import 'package:graduaiton_app/screens/general/people/attendance.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/button.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/input_field.dart';
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
      child: Column(
        children: [
          IconButton(onPressed: ()=>Get.to(Attendance()), icon: Icon(Icons.ac_unit)),
          GestureDetector(
            onTap: () => Get.to(Notif()),
            child: Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 5, right: 5, top: 4, bottom: 10),
                    decoration: new BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(10.0)),
                      color: Colors.grey[200],
                    ),
                    Icon(
                      Icons.mail,
                      color: Colors.white,
                    )
                  ],
                )),
          ),
          SizedBox(height: 10,),
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
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey[200],
                                      ),
                                      child: Row(
                                        children: [
                                          ListTile(
                                              title: Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(children: [
                                                        Text(controller
                                                            .notifications[index].title
                                                            ),
                                                      ]),
                                                      
                                                      Text(controller.notifications[index].created_at,style: TextStyle(fontSize: 12),),
                                                    ],
                                                  )),
                                              subtitle: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(child: Text(
                                                   controller
                                                            .notifications[index].body
                                                    ,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.6)),
                                                  )),
                                                  Text(
                                                    's',
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.6)),
                                                  ),
                                                ],
                                              )),
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
                                  style: TextStyle(fontSize: 24)
                                  )
                                  )
                                  )
                                  )
                                  )

        ]));
        
  }
  
}
