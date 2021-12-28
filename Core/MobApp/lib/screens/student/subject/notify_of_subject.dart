import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/config.dart';
import 'package:graduaiton_app/controllers/Student/student_subject_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class Notif extends GetView {
  @override
  SubjectsStudentController controller = Get.put(SubjectsStudentController());
  final api = Config.api;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: _appBar(context),
      body: Padding(
        padding: EdgeInsets.all(6),
        child: Column(children: [
          Expanded(
              child: GetBuilder<SubjectsStudentController>(
                  builder: (_) => controller.notification.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.notification.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 10, left: 10, right: 10),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 15),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Text(
                                                                    controller
                                                                        .notification[
                                                                            index]
                                                                        .title,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 2,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 4,
                                                              ),
                                                              Text(
                                                                controller
                                                                    .notification[
                                                                        index]
                                                                    .created_at,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ],
                                                          )),
                                                      Divider(
                                                        thickness: 1,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          controller
                                                                      .notification[
                                                                          index]
                                                                      .files
                                                                      .length >
                                                                  0
                                                              ? ButtonTheme(
                                                                  buttonColor:
                                                                      Color(
                                                                          0xff6976f5),
                                                                  height: 20.0,
                                                                  child:
                                                                      RaisedButton(
                                                                    onPressed: () =>
                                                                        launchURL(
                                                                            index),
                                                                    child: Text(
                                                                      'View',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ))
                                                              : Container()
                                                        ],
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
                                                        controller
                                                            .notification[index]
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
                              ),
                            );
                          })
                      : SizedBox(
                          width: double.infinity,
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: const Text('Not Found',
                                  style: TextStyle(fontSize: 24))))))
        ]),
      ),
    );
  }

  void launchURL(int index) async {
    String x = await api;
    x = x.replaceAll('/api', '');
    x += '/' + controller.notification[index].files[0].file_path;
    print(x);
    if (!await launch(x)) throw 'Could not launch';
  }

  _appBar(BuildContext) {
    return AppBar(
      title: Text(
        'My Notification',
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
