import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Student/student_subject_controller.dart';

class Notif extends GetView {
  @override
 
  SubjectsStudentController controller = Get.put(SubjectsStudentController());
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: _appBar(context),
      body:  Padding(
          padding: EdgeInsets.all(6),
          child: Column(
            children: [
              Expanded(
              child: GetBuilder<SubjectsStudentController>(
                  builder: (_) => controller.notification.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.notification.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                              child: GestureDetector(
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
                                                              // Column(
                                                              //   children: List.from(
                                                              //       controller
                                                              //           .notifications[
                                                              //               index]
                                                              //           .units
                                                              //           .map((unit) =>
                                                              //               Text(
                                                              //                 unit.stage.name +
                                                              //                     ' - ' +
                                                              //                     unit.name,
                                                              //                 style:
                                                              //                     TextStyle(fontSize: 12),
                                                              //               ))),
                                                              // ),
                                                              Text(
                                                                'o'
                                                              ),
                                                            ],
                                                          )),
                                                      Divider(
                                                        thickness: 1,
                                                      ),
                                                      Text(
                                                        'Title : ',
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
                                                        'Note : ',
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
                              ),
                            );
                          })
                      : SizedBox(
                          width: double.infinity,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: const Text('Not Found',
                                  style: TextStyle(fontSize: 24))
                                  )
                                  )
                                  )
                                  )
            ]),
        ),
      
    );
  }

  _appBar(BuildContext) {
    return AppBar(
      title: Text(
        'My notification',
        style: TextStyle(color: Colors.black),
      ),
      elevation: 0,
      backgroundColor: Color(0xFAFAFA),
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back,
          size: 25,
          color: Colors.black,
        ),
        onTap: () {
          Get.back();
        },
      ),
    );
  }
}
