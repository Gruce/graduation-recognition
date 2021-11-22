import 'package:flutter/material.dart';
import '../side_bar.dart';

class AppBarr extends StatefulWidget {
  const AppBarr({Key? key}) : super(key: key);

  @override
  _AppBarrState createState() => _AppBarrState();
}

class _AppBarrState extends State<AppBarr> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideBar(),
        key: _scaffoldKey,
        body: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () =>
                            _scaffoldKey.currentState!.openDrawer(),
                      ),
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
                      CircleAvatar(
                        child: Image.asset('STLogo.png'),
                        backgroundColor: Colors.white,
                        // foregroundColor: Colors.white,
                        // child: const Text('admin'),
                      ),
                    ],
                  ),
                ),
                //         // Center(
                //         //   child: Nav(),
                //         // ),
                //         // Container(
                //         //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                //         //   margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                //         //   decoration: BoxDecoration(
                //         //       color: Colors.white,
                //         //       borderRadius: BorderRadius.circular(20)),
                //         //   child: Row(
                //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         //     children: [
                //         //       IconButton(icon: Icon(Icons.search), onPressed: () {}),
                //         //       Text('Search for a person'),
                //         //       IconButton(icon: Icon(Icons.settings), onPressed: () {}),
                //         //     ],
                //         //   ),
                //         // ),
                        const SizedBox(
                          height: 20,
                        ),
                //       ],
                //     ),
                //   ),
                // ),
              ]),
            )));
  }
}
