import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;


  const MenuItem({Key? key, required this.icon, required this.title, Null Function()? onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
            SizedBox(
              width: 17,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}