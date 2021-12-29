import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/screens/admin/layout.dart';

import 'lecture_widget.dart';
import 'luctures_controller.dart';

class LucturesWidget extends StatelessWidget {
  LucturesWidget({Key? key, this.lectures, required this.today}) : super(key: key);

  final lectures;
  final bool today;
  LucturesController controller = Get.put(LucturesController());

  @override
  Widget build(BuildContext context) {
    controller.filteredLectures.assignAll(lectures);
    controller.lectures.assignAll(lectures);
    controller.oneTime();

    return Column(children: [
      today ? Container() :
      GetBuilder<LucturesController>(
        builder: (_) => Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.from(controller.properties
                    .map(
                      (Property e) => IconButton(
                          icon: e.icon,
                          onPressed: () => controller.toggleProperty(e),
                          color: e.value
                              ? const Color(0xff6875F5)
                              : Colors.black54),
                    )
                    .toList())),
            Column(
                children: List.from(controller.properties
                    .map(
                      (Property e) => e.value
                          ? Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 4),
                              child: e.widget)
                          : Container(),
                    )
                    .toList())),
          ],
        ),
      ),
       GetBuilder<LucturesController>(
        builder: (_) => controller.filteredLectures.isNotEmpty
          ? Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(255, 255, 255, .5)),
                  child: ListView.builder(
                    itemCount: controller.filteredLectures.length,
                    itemBuilder: (BuildContext context, int index) {
                      return LuctureWidget(
                        luctureName:
                            controller.filteredLectures[index].subject.name,
                        classroom:
                            controller.filteredLectures[index].classroom.name,
                        startAt: controller.filteredLectures[index].start,
                        endAt: '',
                        lucturerName: controller
                            .filteredLectures[index].teacher.user.name,
                        section: controller
                            .filteredLectures[index].unit.section.name,
                        stage:
                            controller.filteredLectures[index].unit.stage.name,
                        unit: controller.filteredLectures[index].unit.name,
                      );
                    },
                  )),
            )
          : SizedBox(
              width: double.infinity,
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child:
                      const Text('Not Found', style: TextStyle(fontSize: 24)))))
    ]);
  }
}
