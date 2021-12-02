import 'package:flutter/cupertino.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_schedule_controller.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/add_task_bar.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/button.dart';
import 'package:intl/intl.dart';
import '../layout.dart';

class TeacherScheduleScreen extends StatefulWidget {
  const TeacherScheduleScreen({Key? key}) : super(key: key);

  @override
  _TeacherScheduleScreenState createState() => _TeacherScheduleScreenState();
}

class _TeacherScheduleScreenState extends State<TeacherScheduleScreen> {
  @override
  DateTime _selectedDate = DateTime.now();
  void initSate() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return TeachLayoutScreen(
      child: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.indigo.shade700,
        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        dayTextStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
        monthTextStyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        onDateChange: (data) {
          _selectedDate = data;
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400]),
                ),
                Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          MyButton(label: "+ Add Schdule", onTap: () => Get.to(AddTaskPage())),
        ],
      ),
    );
  }
}
