import 'package:flutter/material.dart';
import 'package:graduaiton_app/screens/teacher/home_page/componts_of_cards_home_screen.dart';
import 'package:graduaiton_app/screens/teacher/profile/profile_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../layout.dart';


class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TeachLayoutScreen(
      child: ComponentHomeScreen(),
    );
  }
}
