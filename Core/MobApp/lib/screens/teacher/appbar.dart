import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:graduaiton_app/routes/routes.dart';

class TeacherAppbar extends StatelessWidget {
  const TeacherAppbar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xff6875F5),
                ),
                onPressed: () => {Scaffold.of(context).openDrawer()}),
            Column(
              children: [
                Row(
                  children: [
                    Text(title, style: const TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.teachProfile),
              child: CircleAvatar(
                child: Image.asset('assets/STLogo.png'),
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
