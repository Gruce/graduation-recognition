import 'package:flutter/material.dart';
import 'package:graduaiton_app/models/user.dart';

import 'package:graduaiton_app/util/utilities.dart';

class Profile extends StatefulWidget {
  Profile({Key? key, this.id, name}) : super(key: key);

  var id;

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState
    // print(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              const SizedBox(
                height: 250,
                width: double.infinity,
                child: Image(
                  image: AssetImage(
                    "STLogo.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 200, 15, 15),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(left: 95),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    ListTile(
                                      title: FutureBuilder(
                                        future: Utilities.getUser,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            UserModel user =
                                                snapshot.data as UserModel;
                                            return Text(
                                              user.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5,
                                            );
                                          } else {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                        },
                                      ),

                                      // style: Theme.of(context).textTheme.title,
                                    ),
                                    const ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      title: Text("Student"),
                                      //You can add Subtitle here
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: const <Widget>[
                                        Text("5"),
                                        Text("Absences"),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: const <Widget>[
                                        Text("2"),
                                        Text("Infractions"),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: const <Widget>[
                                        Text("3"),
                                        Text("Activities"),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: const <Widget>[
                                        Text("1"),
                                        Text("Warnings"),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          margin: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0),
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.15),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage(
                                "me.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: const <Widget>[
                          ListTile(
                            title: Text("Person Information"),
                          ),
                          Divider(),
                          ListTile(
                            title: Text("Email"),
                            subtitle: Text("karm.99zo@gmail.com"),
                            leading: Icon(Icons.email),
                          ),
                          ListTile(
                            title: Text("Phone Number"),
                            subtitle: Text("07701111111"),
                            leading: Icon(Icons.phone),
                          ),
                          ListTile(
                            title: Text("About"),
                            subtitle: Text(
                                "Abdulkareem mgbel farhan al-khalifa.\nbla bla bla bla bla bla bla bla bla bla bla."),
                            leading: Icon(Icons.format_align_center),
                          ),
                          ListTile(
                            title: Text("Living Location"),
                            subtitle: Text("AL-Hartha - Basra"),
                            leading: Icon(Icons.location_city),
                          ),
                          ListTile(
                            title: Text("Joined Date"),
                            subtitle: Text("11 November 2018"),
                            leading: Icon(Icons.calendar_view_day),
                          ),
                          ListTile(
                            title: Text("graduation Date"),
                            subtitle: Text("6 Jul 2022"),
                            leading: Icon(Icons.calendar_view_month),
                          ),
                          ListTile(
                            title: Text("Department"),
                            subtitle: Text("Computer Sicnce"),
                            leading: Icon(Icons.computer),
                          ),
                          ListTile(
                            title: Text("Study type"),
                            subtitle: Text("Evening"),
                            leading: Icon(Icons.event),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
