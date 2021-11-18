// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';

import 'menu_item.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        key: _scaffoldKey,
        child: new ListView(padding: EdgeInsets.zero, children: <Widget>[
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(10),
                color: const Color(0xff6875F5),
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  ListTile(
                    title: Text(
                      "Abdulkareem",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w800),
                    ),
                    onTap: () {},
                    subtitle: Text(
                      "Lucturer",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    leading: CircleAvatar(
                      child: Image.asset('STLogo.png'),
                      backgroundColor: Colors.white,
                      // child: Icon(
                      //   Icons.perm_identity,
                      //   color: Colors.white,
                      // ),
                      radius: 17,
                    ),
                  ),
                  Divider(
                    height: 50,
                    thickness: 0.6,
                    color: Colors.white.withOpacity(0.6),
                    indent: 22,
                    endIndent: 32,
                  ),
                  ListTile(
                    title: Text(
                      "Schedule",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    leading: const Icon(
                      Icons.schedule,
                      color: Colors.white,
                    ),
                    selected: true,
                    onTap: () {
                      // scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                  ListTile(
                    title: Text(
                      "Show Tracking",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    leading: const Icon(
                      Icons.track_changes,
                      color: Colors.white,
                    ),
                    selected: true,
                    onTap: () {
                      // scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                  ListTile(
                    title: Text(
                      "New Person",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    leading: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    selected: true,
                    onTap: () {
                      // scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                  ListTile(
                    title: Text(
                      "New Lucture",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    leading: const Icon(
                      Icons.person_add,
                      color: Colors.white,
                    ),
                    selected: true,
                    onTap: () {
                      // scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                  ListTile(
                    title: Text(
                      "New Camera",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    leading: const Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                    selected: true,
                    onTap: () {
                      // scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                ])),
          ),
          SizedBox(height: 300,),
          ListTile(
                    title: Text(
                      "My Account",
                      style: TextStyle(
                        color: Color(0xff6875F5),
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    leading: const Icon(
                      Icons.camera,
                      color: Color(0xff6875F5),
                    ),
                    selected: true,
                    onTap: () {
                      // scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                   ListTile(
                    title: Text(
                      "Setting",
                      style: TextStyle(
                        color: Color(0xff6875F5),
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    leading: const Icon(
                      Icons.camera,
                      color: Color(0xff6875F5),
                    ),
                    selected: true,
                    onTap: () {
                      // scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
        ]));
    //       DrawerHeader(
    //         child: Text(
    //           'Welcome User',
    //           style: TextStyle(fontSize: 20.0, color: Colors.white),
    //         ),
    //         decoration: BoxDecoration(
    //           color: Color(0xff6875F5),
    //         ),
    //       ),
    //       ListTile(
    //         title: Text('My Luctures'),
    //         onTap: () {
    //           // scaffoldKey.currentState!.openEndDrawer();
    //         },
    //       ),
    //        ListTile(
    //         title: Text('Manage Lectures'),
    //         onTap: () {
    //           // scaffoldKey.currentState!.openEndDrawer();
    //         },
    //       ),
    //        ListTile(
    //         title: Text('Show Tracking'),
    //         onTap: () {
    //           // scaffoldKey.currentState!.openEndDrawer();
    //         },
    //       ),
    //       ListTile(
    //         title: Text('Schedule'),
    //         onTap: () {
    //           // scaffoldKey.currentState!.openEndDrawer();
    //         },
    //       ),
    //       ListTile(
    //         title: Text('New Person'),
    //         onTap: () {
    //           // scaffoldKey.currentState!.openEndDrawer();
    //         },
    //       ),
    //       ListTile(
    //         title: Text('New Lucture'),
    //         onTap: () {
    //           // scaffoldKey.currentState!.openEndDrawer();
    //         },
    //       ),
    //       ListTile(
    //         title: Text('New Cameras'),
    //         onTap: () {
    //           // scaffoldKey.currentState!.openEndDrawer();
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
