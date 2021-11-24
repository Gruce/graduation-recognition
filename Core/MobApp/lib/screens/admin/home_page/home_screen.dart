// ignore_for_file: file_names, unnecessary_new, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graduaiton_app/models/user.dart';
import 'package:graduaiton_app/screens/admin/home_page/data_search.dart';
import 'package:graduaiton_app/screens/admin/nav_bar/add_new/Teacher_add.dart';
import 'package:graduaiton_app/screens/admin/nav_bar/nav_bar.dart';
import 'package:graduaiton_app/screens/admin/nav_bar/profile/profile.dart';
import 'package:graduaiton_app/screens/admin/side_bar.dart';
import 'package:graduaiton_app/util/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config.dart';
import 'app_bar.dart';
import 'package:http/http.dart' as http;

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var listsearch = [];
  final api = Config.api;

  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jwt = prefs.getString('jwt').toString();
    var res = await http
        .get(Uri.parse("$api/people"), headers: {"Authorization": jwt});
    if (res.statusCode == 200) {
      var responsebody = jsonDecode(res.body)['data'];
      for (int i = 0; i < responsebody.length; i++) {
        listsearch.add(responsebody[i]);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  String? _chosenValue;
  @override
  Widget build(BuildContext context) {
    // var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Colors.grey[200],

      drawer: const SideBar(),
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
                      child: Image.asset('STLogo.png'),
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
              ),
              // Center(
              //   child: NavBar(),
              // ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          showSearch(
                              context: context,
                              delegate: DataSearch(list: listsearch));
                        }),
                    Text('Search for a person'),
                    IconButton(icon: Icon(Icons.settings), onPressed: () {}),
                  ],
                ),
              ),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    buildInfo('30', 'Lucturers\nN.O'),
                    Container(width: 1, height: 50, color: Color(0xff6875F5)),
                    buildInfo('1000', 'Students\nN.O'),
                    Container(width: 1, height: 50, color: Color(0xff6875F5)),
                    buildInfo('25', 'Cameras\nN.O'),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.white,
                ),
                child: new Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Text("Send Notification"),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButton<String>(
                          value: _chosenValue,
                          //elevation: 5,
                          style: TextStyle(color: Color(0xff6875F5)),

                          items: <String>[
                            'All',
                            'Abdulkareem',
                            'Hussam',
                            'Hassan',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text(
                            "Please choose a lucturer",
                            style: TextStyle(
                              color: Color(0xff6875F5),
                              fontSize: 16,
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _chosenValue = value!;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          maxLines: 4,
                          decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff6875F5)),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      new BorderSide(color: Color(0xff6875F5))),
                              filled: true,
                              hintStyle: TextStyle(color: Color(0xff6875F5)),
                              hintText: "Type your text",
                              fillColor: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0xff6875F5),
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width / 3,
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: () {},
                            child: Text(
                              "Send",
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.normal,
                                height: 1.5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildInfo(String value, String description) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
          Text(
            value,
            style: TextStyle(
              fontFamily: "Avenir",
              fontWeight: FontWeight.w900,
              fontSize: 28,
              color: Color(0xff6875F5),
            ),
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Avenir",
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xff6875F5),
            ),
          )
        ]));
  }
}

class DataSearch extends SearchDelegate {
  List<dynamic> list;
  DataSearch({required this.list});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  Widget buildSuggestions(BuildContext context) {
    var searchlist = query.isEmpty
        ? list
        : list.where((p) => p['name'].toString().startsWith(query)).toList();
    return ListView.builder(
        itemCount: searchlist.length,
        itemBuilder: (context, i) {
          return ListTile(
              leading: const Icon(Icons.verified_user_sharp),
              title: Text(searchlist[i]['name']),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile(
                          id: searchlist[i]['id'],
                        )));
              });
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}
