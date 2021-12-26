import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduaiton_app/controllers/student/student_home_controller.dart';
import 'package:graduaiton_app/screens/student/layout.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class StudentHomeScreen extends GetView<StudentHomeController> {
  StudentHomeScreen({Key? key}) : super(key: key);

  @override
  StudentHomeController controller = Get.put(StudentHomeController());

  @override
  Widget build(BuildContext context) {
    return StudentLayoutScreen(
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
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
        elevation: 0,
        // shadowColor: Colors.black12,
        color: Colors.transparent,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 24.0),
        child: Column(
          children: [
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.05,
            //   width: MediaQuery.of(context).size.width * 0.93,
            //   decoration: BoxDecoration(
            //     color: Colors.grey.shade200,
            //     borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(20),
            //         topRight: Radius.circular(20)),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Text(controller.lectures[index].day.name.toString()),
            //       Text(controller.lectures[index].subject.name.toString()),
            //       Text(controller.lectures[index].start.toString())
            //     ],
            //   ),
            // ),
            // ListTile(
            //     title: Container(
            //         margin: const EdgeInsets.only(bottom: 15),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Row(children: [
            //               Text(controller.lectures[index].unit.stage.name.toString()),
            //             ]),
            //             Text(controller.lectures[index].unit.name.toString()),
            //           ],
            //         )),
            //     subtitle: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Expanded(
            //             child: Text(
            //           controller.lectures[index].unit.section.name.toString(),
            //           overflow: TextOverflow.ellipsis,
            //           maxLines: 1,
            //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         )),
                    
            //         Text(
            //           'Hall: '+ controller.lectures[index].classroom.name.toString(),
                      
            //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         ),
            //       ],
            //     )),
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
                child: Column(
          children: [
            Card(
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
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 1.93,
                          decoration: BoxDecoration(
                            color: const Color(0xffC1C1C1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Next Lucter'),
                              Text('PHP'),
                              Text('Time : 10 AM')
                            ],
                          ),
                        ),
                        ListTile(
                            title: Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Text('Stage : Forth '),
                                    ]),
                                    Text('Unit: A'),
                                  ],
                                )),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(
                                  's',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                )),
                                Text(
                                  'd',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ],
                            )),
                      ],
                    )
                    )
                    ),
                  
           
          ],
        )
              ),
            ],
          ),
        ),

        
      ));
  }
}
