import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_notification_controller.dart';
import 'package:graduaiton_app/controllers/Admin/structure/admin_sections_controller.dart';
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
                    margin: const EdgeInsets.only(
                        left: 5, right: 5, top: 4, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.grey[200],
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
                        hintStyle: TextStyle(color: Colors.black38),
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
                      color: Colors.grey[200],
                    ),
                    child: TextField(
                      minLines: 3,
                      // any number you need (It works as the rows for the textarea)
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        labelText: 'Text',
                        labelStyle: TextStyle(color: Colors.black54),
                        hintText: 'enter the Text',
                        hintStyle: TextStyle(color: Colors.black38),
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
                  Column(children: [
                        GestureDetector(
                            onTap: () => controller.pick_files(),
                            child: Container(
                                margin:
                                    const EdgeInsets.only(left: 5, right: 5),
                                padding: const EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15))),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.grey[200],
                                          ),
                                          // child: Row(
                                          //   children: [
                                              // CheckboxListTile(
                                              //   title: const Text(
                                              //     "All Teachers",
                                              //     style: TextStyle(
                                              //         fontSize: 15),
                                              //   ),
                                              //   value: controller
                                              //       .lucturerCheckbox
                                              //       .value[key],
                                              //   activeColor:
                                              //       const Color(0xff6875F5),
                                              //   checkColor: Colors.white,
                                              //   onChanged: (bool? value) =>
                                              //       controller.check(
                                              //           key, value),
                                              // ),
                                              // CheckboxListTile(
                                              //   title: const Text(
                                              //     "All Student",
                                              //     style: TextStyle(
                                              //         fontSize: 15),
                                              //   ),
                                              //   value: controller
                                              //       .lucturerCheckbox
                                              //       .value[key],
                                              //   activeColor:
                                              //       const Color(0xff6875F5),
                                              //   checkColor: Colors.white,
                                              //   onChanged: (bool? value) =>
                                              //       controller.check(
                                              //           key, value),
                                              // ),
                                              //  CheckboxListTile(
                                              //   title: const Text(
                                              //     "All Section",
                                              //     style: TextStyle(
                                              //         fontSize: 15),
                                              //   ),
                                              //   value: controller
                                              //       .lucturerCheckbox
                                              //       .value[key],
                                              //   activeColor:
                                              //       const Color(0xff6875F5),
                                              //   checkColor: Colors.white,
                                              //   onChanged: (bool? value) =>
                                              //       controller.check(
                                              //           key, value),
                                              // ),
                                          //   ],
                                          // )
                                          ),
                                    ])))
                      ]),
    //                    Obx(
    //   () => Container(
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(15),
    //           color: const Color.fromRGBO(255, 255, 255, .3)),
    //       child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
                
    //             //select section
    //             controller.sections.isNotEmpty
    //                 ? Container(
    //                     child: DropdownButton(
    //                     underline: Container(),
    //                     // Initial Value
    //                     value: controller.sectionSelectedIndex.value,
    //                     // Down Arrow Icon
    //                     icon: const Icon(Icons.keyboard_arrow_down),
    //                     // Array list of items
    //                     items:
    //                         controller.sections.asMap().keys.map((int index) {
    //                       return DropdownMenuItem(
    //                         value: index,
    //                         child: Text(controller.sections[index].name,
    //                             style: const TextStyle(
    //                                 color: Color(0xff6875F5), fontSize: 12.3)),
    //                       );
    //                     }).toList(),
    //                     onChanged: (Object? index) => {
    //                       controller
    //                           .filterBySection(int.parse(index.toString()))
    //                     },
    //                   ))
    //                 : const Text("Loading"),
    //             // const Text("Stage "),

    //             //select teacher
    //             controllerr.stages.isNotEmpty
    //                 ? DropdownButton(
    //                     underline: Container(),
    //                     // Initial Value
    //                     value: controllerr.stageSelectedIndex.value,
    //                     // Down Arrow Icon
    //                     icon: const Icon(Icons.keyboard_arrow_down),
    //                     // Array list of items
    //                     items: controllerr.filteredStages
    //                         .asMap()
    //                         .keys
    //                         .map((int index) {
    //                       return DropdownMenuItem(
    //                         value: index,
    //                         child: Text(controllerr.filteredStages[index].name,
    //                             style: const TextStyle(
    //                                 color: Color(0xff6875F5), fontSize: 12.3)),
    //                       );
    //                     }).toList(),
    //                     onChanged: (Object? index) => {
    //                       controllerr.filterByStage(
    //                         int.parse(index.toString()),
    //                       )
    //                     },
    //                   )
    //                 : const Text("Loading"),

    //                 //select student
    //             controlleerr.units.isNotEmpty
    //                 ? DropdownButton(
    //                     underline: Container(),
    //                     // Initial Value
    //                     value: controlleerr.unitSelectedIndex.value,
    //                     // Down Arrow Icon
    //                     icon: const Icon(Icons.keyboard_arrow_down),
    //                     // Array list of items
    //                     items: controlleerr.filteredUnits
    //                         .asMap()
    //                         .keys
    //                         .map((int index) {
    //                       return DropdownMenuItem(
    //                         value: index,
    //                         child: Text(controlleerr.filteredUnits[index].name,
    //                             style: const TextStyle(
    //                                 color: Color(0xff6875F5), fontSize: 12.3)),
    //                       );
    //                     }).toList(),
    //                     onChanged: (Object? index) => {
    //                       controlleerr.filterByUnit(int.parse(index.toString()))
    //                     },
    //                   )
    //                 : const Text("Loading"),
    //           ])),
    // ),
                  // Obx(
                  //   () => Container(
                  //     margin: const EdgeInsets.only(left: 5, right: 5),
                  //     padding: const EdgeInsets.only(left: 5),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       color: Colors.grey[200],
                  //     ),
                  //     child: ListView(
                  //       shrinkWrap: true,
                  //       children: controller.lucturerCheckbox.keys
                  //           .map((dynamic key) {
                  //         return CheckboxListTile(
                  //           title: Text(
                  //             controller.lectures[key].teacher.user.name,
                  //             style: TextStyle(fontSize: 15),
                  //           ),
                  //           value: controller.lucturerCheckbox.value[key],
                  //           activeColor: const Color(0xff6875F5),
                  //           checkColor: Colors.white,
                  //           onChanged: (bool? value) =>
                  //               controller.check(key, value),
                  //         );
                  //       }).toList(),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(() => Column(
                        children: [
                          GestureDetector(
                            onTap: () => controller.pick_files(),
                            child: Container(
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              padding: const EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey[200],
                                      ),
                                      child: Row(
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
                                      )),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey[200],
                                    ),
                                    child: Text(
                                        controller.files.length.toString() +
                                            ' File selected'),
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
                            height: 15,
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
          'Notification Details',
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
