// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Student/student_change_stage_controller.dart';
import 'package:graduaiton_app/screens/student/changeStage/change_Stage_layout.dart';
import 'package:graduaiton_app/screens/student/home_page/home_screen.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ChangeStageScreen extends GetView {
  ChangeStageScreen({Key? key}) : super(key: key);
  @override
  ChangeStageController controller = Get.put(ChangeStageController());
  @override
  Widget build(BuildContext context) {
    return ChangeStageLayoutScreen(
      title: '',
      child: Card(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Text(
                      'If you have the code to skip the stage enter it below',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Container(
                      color: Colors.white,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            const Text(
                              "Enter your code",
                            ),
                            SizedBox(
                              width: 150,
                              child: TextField(
                                controller: controller.codeController,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xff6875F5)),
                                ),
                                onPressed: () => {controller.changeUnit(),Get.off(
                                            StudentHomeScreen()),},
                                child: const Text('Change'))
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
