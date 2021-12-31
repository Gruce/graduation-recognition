import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../admin/layout.dart';
import 'person_profile_controller.dart';

class PersonProfileWidget extends GetView {
  PersonProfileWidget({Key? key}) : super(key: key);

  @override
  PersonProfileController controller = Get.put(PersonProfileController());

  @override
  Widget build(BuildContext context) {
    controller.getUser(Get.arguments);
    return AdminLayoutScreen(
        title: 'Person Profile',
        child: SingleChildScrollView(
          child: GetBuilder<PersonProfileController>(
              builder: (_) => controller.person.name.isNotEmpty ? Column(
                children: <Widget>[
                  Column(
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ListTile(title: Text(controller.person.name)

                                        // style: Theme.of(context).textTheme.title,
                                      ),
                                      ListTile(
                                        contentPadding:
                                        const EdgeInsets.all(0),
                                        title: Text(
                                            controller.person.typeString),
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
                                            child: const Text(
                                                "        5\nAbsences",style: TextStyle(color:Color(0xff6875F5),fontSize:10.5)))),
                                    Expanded(
                                        child: FlatButton(
                                            onPressed: () {},
                                            child: const Text(
                                                "        2\nInfractions",style: TextStyle(color:Color(0xff6875F5),fontSize:9.9)))),
                                    Expanded(
                                        child: FlatButton(
                                            onPressed: () {},
                                            child: const Text(
                                                "        3\nActivities",style: TextStyle(color:Color(0xff6875F5),fontSize:10.5)))),
                                    Expanded(
                                        child: FlatButton(
                                            onPressed: () {},
                                            child: const Text(
                                                "        1\nWarnings",style: TextStyle(color:Color(0xff6875F5),fontSize:10.5)))),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Obx(() => Container(
                            width: 80,
                            height: 80,
                            margin: const EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 0),
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.075),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: controller.imageURL.value.isNotEmpty ?
                                NetworkImage(controller.imageURL.value) :
                                const NetworkImage('http://www.familylore.org/images/2/25/UnknownPerson.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),)
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
                          children: <Widget>[
                              const ListTile(
                              title: Text("Person Information",style: TextStyle(color:Color(0xff6875F5)),),
                            ),
                            const Divider(),
                            ListTile(
                              title: const Text("Email"),
                              subtitle: Text(controller.person.user.email),
                              leading: const Icon(Icons.email,color:Color(0xff6875F5)),
                            ),
                            const ListTile(
                              title: Text("Phone Number"),
                              subtitle: Text("07701111111"),
                              leading: Icon(Icons.phone,color:Color(0xff6875F5)),
                            ),
                            const ListTile(
                              title: Text("About"),
                              subtitle: Text(
                                  "Abdulkareem mgbel farhan al-khalifa.\nbla bla bla bla bla bla bla bla bla bla bla."),
                              leading: Icon(Icons.format_align_center,color:Color(0xff6875F5)),
                            ),
                             ListTile(
                              title: Text("Living Location"),
                              subtitle: Text("AL-Hartha - Basra"),
                              leading: Icon(Icons.location_city,color:Color(0xff6875F5)),
                            ),
                           ListTile(
                              title: Text("Joined Date"),
                              subtitle: Text("11 November 2018"),
                              leading: Icon(Icons.calendar_view_day,color:Color(0xff6875F5)),
                            ),
                             ListTile(
                              title: Text("graduation Date"),
                              subtitle: Text("6 Jul 2022"),
                              leading: Icon(Icons.calendar_view_month,color:Color(0xff6875F5)),
                            ),
                             ListTile(
                              title: Text("Department"),
                              subtitle: Text("Computer Sicnce"),
                              leading: Icon(Icons.computer,color:Color(0xff6875F5)),
                            ),
                            ListTile(
                              title: Text("Study type"),
                              subtitle: Text("Evening"),
                              leading: Icon(Icons.event,color:Color(0xff6875F5)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ) : const Center(
                child: CircularProgressIndicator(),
              )
          ),

        ));
  }
}
