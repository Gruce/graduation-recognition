// ignore_for_file: file_names, unnecessary_new, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/screens/admin/nav_bar/add_new/Teacher_add.dart';
import 'package:graduaiton_app/screens/admin/nav_bar/nav_bar.dart';
import 'package:graduaiton_app/screens/admin/side_bar.dart';
import 'package:graduaiton_app/util/utilities.dart';

import 'app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      // appBar: const PreferredSize(
      //   preferredSize: Size.fromHeight(100),
      //   child: AppBarr(),
      // ),
      drawer: const SideBar(),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: <Widget>[
      //     Expanded(
      //         child: Row(
      //       children: [
      //         // ignore: deprecated_member_use
      //         FlatButton(
      //             color: Colors.deepOrange,
      //             onPressed: () {
      //               Navigator.of(context).push(
      //                   MaterialPageRoute(builder: (context) => CameraAdd()));
      //             },
      //             child: Text(
      //               "Test Button",
      //               style: TextStyle(color: Colors.white, fontSize: 16),
      //             ))
      //       ],
      //     ))
      //   ],
      // ),
      key: _scaffoldKey,
      // bottomNavigationBar: Nav(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
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
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      // foregroundColor: Colors.white,
                      // child: const Text('admin'),
                    )
                  ],
                ),
              ),
              // Center(
              //   child: NavBar(),
              // ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          showSearch(context: context,  delegate :f());
                        }),
                    Text('Search for a person'),
                    IconButton(icon: Icon(Icons.settings), onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

f() {
  Text("data");
}
