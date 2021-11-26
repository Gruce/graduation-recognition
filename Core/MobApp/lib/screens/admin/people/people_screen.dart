import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/screens/admin/people/search_widget.dart';

import 'person_widget.dart';

class AdminPeopleScreen extends GetView {
  const AdminPeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SearchWidget(),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return PersonWidget(
                  name: "Hassan",
                  type: "Student",
                  camera: "Main Camera",
                  time: "3 hours ago");
            },
          ),
        ),
      ],
    ));
  }
}
