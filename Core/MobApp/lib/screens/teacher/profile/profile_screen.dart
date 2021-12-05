import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/teacher_profile_controller.dart';
import 'package:graduaiton_app/models/user.dart';

import '../layout.dart';

class TeacherProfileScreen extends GetView {
  TeacherProfileScreen({Key? key}) : super(key: key);

  @override
  TeacherProfileController controller = Get.put(TeacherProfileController());

  @override
  Widget build(BuildContext context) {
    var typeText = "";

    return TeachLayoutScreen(
        title: 'Profile',
        child: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        Container(
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
                                  future: controller.getUser,
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
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),

                                // style: Theme.of(context).textTheme.title,
                              ),
                              const ListTile(
                                contentPadding: EdgeInsets.all(0),
                                title: Text("Administrator"),
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
                                child: FlatButton(
                                    onPressed: () {},
                                    child: const Text("       5\nAbsences"))),
                            Expanded(
                                child: FlatButton(
                                    onPressed: () {},
                                    child:
                                        const Text("        2\nInfractions"))),
                            Expanded(
                                child: FlatButton(
                                    onPressed: () {},
                                    child: const Text("       3\nActivities"))),
                            Expanded(
                                child: FlatButton(
                                    onPressed: () {},
                                    child: const Text("       1\nWarnings"))),
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
                      // image: const DecorationImage(
                      //   image: AssetImage(
                      //     "me.png",
                      //   ),
                      //   fit: BoxFit.cover,
                      // ),
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
    )));
  }
}
