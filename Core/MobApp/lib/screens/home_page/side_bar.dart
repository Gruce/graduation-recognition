// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({ Key? key }) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        key: _scaffoldKey,
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Welcome User',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Color(0xff6875F5),
              ),
            ),
            ListTile(
              title: Text('My Luctures'),
              onTap: () {
                // scaffoldKey.currentState!.openEndDrawer();
              },
            ),
             ListTile(
              title: Text('Manage Lectures'),
              onTap: () {
                // scaffoldKey.currentState!.openEndDrawer();
              },
            ),
             ListTile(
              title: Text('Show Tracking'),
              onTap: () {
                // scaffoldKey.currentState!.openEndDrawer();
              },
            ),
            ListTile(
              title: Text('Schedule'),
              onTap: () {
                // scaffoldKey.currentState!.openEndDrawer();
              },
            ),
            ListTile(
              title: Text('New Person'),
              onTap: () {
                // scaffoldKey.currentState!.openEndDrawer();
              },
            ),
            ListTile(
              title: Text('New Lucture'),
              onTap: () {
                // scaffoldKey.currentState!.openEndDrawer();
              },
            ),
            ListTile(
              title: Text('New Cameras'),
              onTap: () {
                // scaffoldKey.currentState!.openEndDrawer();
              },
            ),
          ],
        ),
      );
    
  }
}