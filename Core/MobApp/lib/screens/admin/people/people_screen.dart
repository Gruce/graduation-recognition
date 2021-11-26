import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/screens/admin/home_page/data_search.dart';
import 'package:graduaiton_app/screens/admin/people/search_widget.dart';

import 'person_widget.dart';

class AdminPeopleScreen extends GetView {
  const AdminPeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          children: [
            // Search Container
            SearchWidget(),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
                return PersonWidget(
                    name: "Hassan",
                    type: "Student",
                    camera: "Main Camera",
                    time: "3 hours ago");
              },
            ),
          ],
        ));
  }
}
