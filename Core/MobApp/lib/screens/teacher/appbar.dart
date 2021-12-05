import 'package:flutter/material.dart';

class TeacherAppbar extends StatelessWidget {
  const TeacherAppbar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(vertical: 20),
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
            // CircleAvatar(
            //   child: Image.asset('STLogo.png'),
            //   backgroundColor: Colors.white,
            // ),
          ],
        ),
      ),
    ]);
  }
}
