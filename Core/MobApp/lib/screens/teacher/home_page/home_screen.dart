import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduaiton_app/config.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_home_controller.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/screens/teacher/home_page/today_lucture_widget.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/button.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/circular_progress.dart';
import 'package:graduaiton_app/screens/teacher/profile/profile_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../layout.dart';

class TeacherHomeScreen extends GetView<TeacherHomeController> {
  TeacherHomeScreen({Key? key}) : super(key: key);
 
  @override
  TeacherHomeController controller = Get.put(TeacherHomeController());
    
   
  @override
  Widget build(BuildContext context) {
    return TeacherLayoutScreen(
      title: 'Home',
      child: Obx(
        () => SlidingUpPanel(
          backdropEnabled: true,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          margin: const EdgeInsets.only(left: 7.5, right: 7.5),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 0.0,
            )
          ],
          minHeight: 75,
          onPanelOpened: () => controller.showns.value = true,
          onPanelClosed: () => controller.showns.value = false,
          panel: Column(
            children: [
              const SizedBox(height: 5),
              Icon(
                controller.showns.value
                    ? Icons.expand_more
                    : Icons.expand_less,
                size: 30,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: const Color.fromRGBO(0, 0, 0, 0.05),
                  ),
                  child: const Text(
                    "Lectures of the week",
                    style: TextStyle(color: Color(0xff6875F5), fontSize: 18),
                    textAlign: TextAlign.center,
                  )),
                  SizedBox(height: 20,),
              Expanded(
                  child: Container(
                // padding:
                // const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(255, 255, 255, .5),
                ),
                child: ListView.builder(
                            itemCount: controller.lectures.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
        elevation: 0,
        // shadowColor: Colors.black12,
        color: Colors.transparent,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 24.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.93,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(controller.lectures[index].day.name.toString()),
                  Text(controller.lectures[index].subject.name.toString()),
                  Text(controller.lectures[index].start.toString())
                ],
              ),
            ),
            ListTile(
                title: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text(controller.lectures[index].unit.stage.name.toString()),
                        ]),
                        Text(controller.lectures[index].unit.name.toString()),
                      ],
                    )),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      controller.lectures[index].unit.section.name.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    )),
                    
                    Text(
                      'Hall: '+ controller.lectures[index].classroom.name.toString(),
                      
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ],
                )),
            Divider(
              thickness: 0.3,
            )
          ],
        ));
                            },
                          )
                                    
              )
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height ,
                width: MediaQuery.of(context).size.width ,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),
                Expanded(
                          child: GetBuilder<TeacherHomeController>(
                              builder: (_) => controller
                                      .lectures.isNotEmpty
                                  ? ListView.builder(
                                      itemCount:
                                          controller.lectures.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Card(
                                            elevation: 0,
                                            // shadowColor: Colors.black12,
                                            color: Colors.transparent,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 23.0),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.05,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.93,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20)),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(controller
                                                          .lectures[index]
                                                          .day
                                                          .name
                                                          .toString()),
                                                      Text(controller
                                                          .lectures[index]
                                                          .subject
                                                          .name
                                                          .toString()),
                                                     Text(
                                                DateFormat.jm().format(
                                                        DateFormat("hh:mm:ss")
                                                            .parse(controller
                                                                .lectures[
                                                                    0]
                                                                .start)) +
                                                    ' - ' +
                                                    DateFormat.jm().format(
                                                        DateFormat("hh:mm:ss")
                                                            .parse(controller
                                                                .lectures[
                                                                    0]
                                                                .end)),
                                              )
                                                    ],
                                                  ),
                                                ),
                                                ListTile(
                                                    title: Container(
                                                        margin: const EdgeInsets
                                                            .only(bottom: 15),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(children: [
                                                              Text(controller
                                                                  .lectures[
                                                                      index]
                                                                  .unit.stage
                                                                  
                                                                  .name
                                                                  .toString()+'- '+controller
                                                                  .lectures[
                                                                      index]
                                                                  .unit
                                                                  
                                                                  .name
                                                                  .toString()),
                                                            ]),
                                                          ],
                                                        )),
                                                    subtitle: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'classroom: ' +
                                                              controller
                                                                  .lectures[
                                                                      index]
                                                                  .classroom
                                                                  .name
                                                                  .toString(),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.6)),
                                                        ),
                                                      ],
                                                    )),
                                                Divider(
                                                  thickness: 0.3,
                                                ),
                                              ],
                                            ));
                                      },
                                    )
                                  : SizedBox(
                                      width: double.infinity,
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 5.0),
                                          child: const Text('Not Found',
                                              style: TextStyle(
                                                  fontSize: 24))
                                                  )
                                                  ))
                                                  )
              ],
            ),
            body: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xffF7F7F7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        controller.currentLecture.isNotEmpty
                            ? Card(
                                elevation: 0,
                                clipBehavior: Clip.antiAlias,
                                child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffF7F7F7),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      
                                      children: [
                                        SizedBox(
                                            
                                            child: DefaultTextStyle(
                                              style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff6875F5),
                                              ),
                                              child: AnimatedTextKit(
                                                animatedTexts: [
                                                  FadeAnimatedText('Next Lecture!'),
                                                  FadeAnimatedText(controller.currentLecture[0]
                                                  .subject.name),
                                                ],
                                                isRepeatingAnimation: true,
                                              ),
                                            ),
                                        ),
                                        SizedBox(height: 30,),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.93,
                                          decoration: BoxDecoration(
                                            color: const Color(0xffC1C1C1),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(controller.currentLecture[0]
                                                  .subject.name),
                                              Text(
                                                DateFormat.jm().format(
                                                        DateFormat("hh:mm:ss")
                                                            .parse(controller
                                                                .currentLecture[
                                                                    0]
                                                                .start)) +
                                                    ' To ' +
                                                    DateFormat.jm().format(
                                                        DateFormat("hh:mm:ss")
                                                            .parse(controller
                                                                .currentLecture[
                                                                    0]
                                                                .end)),
                                              )
                                            ],
                                          ),
                                        ),
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
                                                          .currentLecture[0]
                                                          .unit
                                                          .stage
                                                          .name),
                                                    ]),
                                                    Text(controller
                                                        .currentLecture[0]
                                                        .unit
                                                        .name),
                                                  ],
                                                )),
                                            subtitle: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                  controller.currentLecture[0]
                                                      .day.name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.6)),
                                                )),
                                                Text(
                                                  'classroom : ' +
                                                      controller
                                                          .currentLecture[0]
                                                          .classroom
                                                          .name,
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.6)),
                                                ),
                                              ],
                                            )),
                                      ],
                                    )))
                            : Container(),
                        SizedBox(
                          height: 30,
                        ),
                        controller.currentLecture.isNotEmpty?
                        MyButton(
                            label: "Take Attendance",
                            onTap: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Take Attendance'),
                                    content: const Text(
                                      'are you sure?',
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Get.off(
                                            TeacherAttendanceScreen()),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                ).then((returnVal) {
                                  if (returnVal != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text('You clicked: $returnVal'),
                                        action: SnackBarAction(
                                            label: 'OK', onPressed: () {}),
                                      ),
                                    );
                                  }
                                })):Text('There is no current lecture yet !')
                      ],
                    )
                    )
                    ),
                    SizedBox(height: 30,),
             Text("Not started"),
            MyButton(label: "Start Lecture", onTap: controller.startLecture),
           
          ],
        )
              ),
            ],
          ),
        ),

        
      ));
      
  }
  
}

