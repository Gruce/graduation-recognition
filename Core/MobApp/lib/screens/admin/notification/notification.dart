import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_notification_controller.dart';
import 'package:graduaiton_app/controllers/Admin/structure/admin_sections_controller.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/button.dart';

class AdminNotification extends GetView {
  AdminNotification({Key? key}) : super(key: key);

  @override
  AdminNotificationController controller =
      Get.put(AdminNotificationController());
  //      @override
  // AdminSectionsController controlleer =
  //     Get.put(AdminSectionsController());

  Widget build(BuildContext context) {
    UserModel user = UserModel();
    if (Get.arguments != null) {
      user = Get.arguments;
      controller.userId = user.id;
    }
    return Scaffold(
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                      height: 30,
                      margin: const EdgeInsets.only(
                          left: 5, right: 5, top: 4, bottom: 10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:const Color(0xff6875F5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Fill The Notification Details",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 5, right: 5, top: 4, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.grey[100],
                    ),
                    child: TextField(
                      minLines: 1,
                      // any number you need (It works as the rows for the textarea)
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        labelText: 'Subject',
                        labelStyle: TextStyle(color: Colors.black54),
                        hintText: 'enter the subject',
                        hintStyle: TextStyle(color: Colors.black54),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Color(0xff6875F5), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff6875F5))),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff6875F5),
                          ),
                        ),
                      ),
                      controller: controller.titleController,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 5, right: 5, top: 4, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.grey[100],
                    ),
                    child: TextField(
                      minLines: 3,
                      // any number you need (It works as the rows for the textarea)
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        labelText: 'Text',
                        labelStyle: TextStyle(color: Colors.black54),
                        hintText: 'enter the text',
                        hintStyle: TextStyle(color: Colors.black54),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Color(0xff6875F5), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff6875F5))),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      controller: controller.bodyController,
                    ),
                  ),
                  const SizedBox(height: 5),
                  user.name.isEmpty?
                   GetBuilder<AdminNotificationController>(
                          builder: (_) => Column(children: [
                                CheckboxListTile(
                                  title: const Text(
                                    "All Teachers",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  value: controller.allTeachersCheckbox.value,
                                  activeColor: const Color(0xff6875F5),
                                  checkColor: Colors.white,
                                  onChanged: (bool? value) => {
                                    controller.allTeachersCheckbox.value =
                                        value!,
                                    controller.update()
                                  },
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                    "All Students",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  value: controller.allStudentsCheckbox.value,
                                  activeColor: const Color(0xff6875F5),
                                  checkColor: Colors.white,
                                  onChanged: (bool? value) => {
                                    controller.allStudentsCheckbox.value =
                                        value!,
                                    controller.update()
                                  },
                                ),
                                controller.allStudentsCheckbox.value
                                    ? Container()
                                    : Column(
                                        children: List.from(controller.sections)
                                            .map((section) {
                                          return Card(
                                            clipBehavior: Clip.antiAlias,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: ListTile(
                                              title: GestureDetector(
                                                  onTap: () => controller
                                                      .changeSectionVisibility(
                                                          section),
                                                  child: Text(
                                                    "${section.name}",
                                                    style: const TextStyle(
                                                        fontSize: 15),
                                                  )),
                                              subtitle: section.visibility
                                                  ? GridView.count(
                                                      childAspectRatio: 3,
                                                      shrinkWrap: true,
                                                      crossAxisCount: 2,
                                                      children: List.from(
                                                              section.stages)
                                                          .map((stage) =>
                                                              CheckboxListTile(
                                                                contentPadding:
                                                                    const EdgeInsets
                                                                        .all(0),
                                                                title: Text(
                                                                  "${stage.name}",
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          12.5),
                                                                ),
                                                                value: controller.stagesCheckBoxes.indexWhere((id) =>
                                                                            id ==
                                                                            stage.id) ==
                                                                        -1
                                                                    ? false
                                                                    : true,
                                                                activeColor:
                                                                    const Color(
                                                                        0xff6875F5),
                                                                checkColor:
                                                                    Colors
                                                                        .white,
                                                                onChanged: (bool?
                                                                        value) =>
                                                                    controller
                                                                        .stagesCheckBoxeToggle(
                                                                            stage),
                                                              ))
                                                          .toList())
                                                  : Text('Click to select'),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                              ]))
                      : Text("Sending to " + user.name),
                  const SizedBox(
                    height: 5,
                  ),
                  Obx(() => Column(
                        children: [
                          GestureDetector(
                            onTap: () => controller.pick_files(),
                            child: Container(
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              padding: const EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
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
                                  ),
                                  Text(controller.files.length.toString() +
                                      ' File selected'),
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
                                                        onPressed: () =>
                                                            controller
                                                                .removeIndex(
                                                                    key),
                                                        icon: const Icon(Icons
                                                            .close_rounded)),
                                                  ],
                                                )))
                                            .values
                                            .toList())),
                                  ),
                                )
                              : Container(),
                          const SizedBox(
                            height: 10,
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
        ));
  }

  _appBar(BuildContext) {
    return AppBar(
        centerTitle: true,
        title: const Text(
          'Notification',
          style: TextStyle(color: Colors.black54),
        ),
        elevation: 0,
        backgroundColor: Color(0xFAFAFA),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black54,
          ),
          onTap: () {
            Get.back();
          },
        ));
  }
}
