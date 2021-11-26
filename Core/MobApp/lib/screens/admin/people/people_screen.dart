import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            Container(
              // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                  const Text('Search for a person'),
                  IconButton(
                      icon: const Icon(Icons.settings), onPressed: () {}),
                ],
              ),
            ),
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
