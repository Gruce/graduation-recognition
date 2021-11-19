// ignore_for_file: deprecated_member_use, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:graduaiton_app/screens/admin/home_page/home_screen.dart';
import 'package:graduaiton_app/screens/admin/nav_bar/add_new/add_new.dart';
import 'package:graduaiton_app/screens/admin/sidebar_taps/schedule_page.dart';
import 'package:graduaiton_app/screens/admin/sidebar_taps/show_tracking.dart';

import '../side_bar.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const ShowTracking(),
    const Schedule(),
    const AddNew(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideBar(),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xff6875F5),
            ),
            // ignore: deprecated_member_use
            title: Text(
              'Home',style: TextStyle(color: Color(0xff6875F5)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.art_track,
              color: Color(0xff6875F5),
            ),
            title: Text(
              'Tracking',style: TextStyle(color: Color(0xff6875F5)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.schedule,
              color: Color(0xff6875F5),
            ),
            title: Text(
              'Schedule',style: TextStyle(color: Color(0xff6875F5)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Color(0xff6875F5),
            ),
            title: Text(
              'Add New',style: TextStyle(color: Color(0xff6875F5)),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}
