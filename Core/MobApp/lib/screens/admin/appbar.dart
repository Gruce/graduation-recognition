import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/routes/routes.dart';
import 'package:graduaiton_app/screens/teacher/profile/profile_screen.dart';

class AdminAppbar extends StatelessWidget {
  const AdminAppbar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: const Color(0xFFdddddd),
          //   style: BorderStyle.solid,
          //   width: 1.0,
          // ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
