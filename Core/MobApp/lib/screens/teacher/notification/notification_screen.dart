import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/notification_controller.dart';
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
      child: Column(
        children: [
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
                                        color: const Color(0xffd4d8ff),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
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

                                                  // Container(
                                                  //   padding: const EdgeInsets.all(5),
                                                  //   margin: const EdgeInsets.only(right: 5),
                                                  //   decoration: BoxDecoration(
                                                  //     borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  //     color: const Color(0xffcccccc),
                                                  //   ),
                                                  //   child: Icon(Icons.arrow_right_alt_rounded),
                                                  // ),
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

      // child: Column(
      //   children: [
      //     FloatingActionButton.extended(
      //       backgroundColor: Color(0xff6875F5),
      //       onPressed: () {
      //         showDialog(
      //             context: context,
      //             builder: (BuildContext context) {
      //               return AlertDialog(
      //                 scrollable: true,
      //                 title: Text('Enter your notification you wnat to send'),
      //                 insetPadding: EdgeInsets.zero,
      //                 content: Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Form(
      //                     child: Column(
      //                       children: <Widget>[
      //                         TextFormField(
      //                           decoration: InputDecoration(
      //                             labelText: 'Title',
      //                             icon: Icon(Icons.account_box),
      //                             border: const OutlineInputBorder(),
      //                           ),
      //                           controller: controller.titleController,
      //                         ),
      //                         SizedBox(
      //                           height: 4,
      //                         ),
      //                         TextField(
      //                           controller: controller.bodyController,
      //                           maxLines: 2,
      //                           textCapitalization:
      //                               TextCapitalization.sentences,
      //                           decoration: InputDecoration(
      //                             labelText: 'Message',
      //                             icon: Icon(Icons.message),
      //                             border: const OutlineInputBorder(),
      //                           ),
      //                         ),
      //                         Column(
      //                           children: <Widget>[
      //                             Obx(() => Column(
      //                                   children: [
      //                                     Text('files count ' +
      //                                         controller.files.length
      //                                             .toString()),
      //                                     GestureDetector(
      //                                       onTap:() => controller.pick_files(),
      //                                       child: Container(

      //                                         width: 200,
      //                                         decoration: BoxDecoration(
      //                                               color: Colors.amber,
      //                                             borderRadius:
      //                                                 BorderRadius.all(
      //                                                     Radius.circular(20))),
      //                                         child: Row(
      //                                           mainAxisAlignment:
      //                                               MainAxisAlignment.center,
      //                                           children: [
      //                                             Text("Upload file"),
      //                                             IconButton(
      //                                               onPressed:(){},
      //                                               icon:
      //                                                   Icon(Icons.upload_file),
      //                                             ),
      //                                           ],
      //                                         ),
      //                                       ),
      //                                     ),
      //                                     controller.files_path.isNotEmpty
      //                                         ? Column(
      //                                             children: List.from(
      //                                                 controller.files
      //                                                     .asMap()
      //                                                     .map(
      //                                                         (key, value) =>
      //                                                             MapEntry(
      //                                                                 key,
      //                                                                 Row(
      //                                                                   children: [
      //                                                                     Text(
      //                                                                       value.name,
      //                                                                     ),
      //                                                                     IconButton(
      //                                                                         onPressed: () => controller.removeIndex(key),
      //                                                                         icon: const Icon(Icons.close_rounded)),
      //                                                                   ],
      //                                                                 )))
      //                                                     .values
      //                                                     .toList()))
      //                                         : Container(),
      //                                   ],
      //                                 )),
      //                             Obx(
      //                               () => Container(
      //                                 width: double.maxFinite,
      //                                 height: double.maxFinite,
      //                                 child: ListView(
      //                                   shrinkWrap: true,
      //                                   children: controller
      //                                       .unitsCheckbox.value.keys
      //                                       .map((dynamic key) {
      //                                     return CheckboxListTile(
      //                                       title: Text(controller
      //                                               .units[key].stage.name +
      //                                           " " +
      //                                           controller.units[key].name),
      //                                       value: controller
      //                                           .unitsCheckbox.value[key],
      //                                       activeColor: Colors.pink,
      //                                       checkColor: Colors.white,
      //                                       onChanged: (bool? value) =>
      //                                           controller.check(key, value),
      //                                     );
      //                                   }).toList(),
      //                                 ),
      //                               ),
      //                             )
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 actions: [
      //                   MyButton(
      //                     label: 'Send',
      //                     onTap: () => controller.send_notification(),
      //                   )
      //                 ],
      //               );
      //             });
      //       },
      //       icon: Icon(Icons.phone_android),
      //       label: Text("Add Notification"),
      //     ),
      //   ],
      // ));
        ]));
        
  }
  void date(){
      DateTime date = controller.notifications[1].created_at.toDate();
      String dateString = DateFormat('dd MMM, yyyy').format(date);

  }
}
