import 'package:flutter/material.dart';

class AdminAppbar extends StatelessWidget {
  const AdminAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: const Icon(Icons.menu,color: Color(0xff6875F5),),
                onPressed: () => {Scaffold.of(context).openDrawer()}),
            Column(
              children: [
                Row(
                  children: const [
                    Text('Location'),
                    Icon(
                      Icons.location_on,
                      color: Color(0xff6875F5),
                    ),
                    Text('CsIT'),
                   
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
