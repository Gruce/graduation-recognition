// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionWidget extends GetWidget {
  SectionWidget({
    Key? key,
    required this.id,
    required this.name,
  }) : super(key: key);
  int id;
  String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      // shadowColor: Colors.black12,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6.0),
      child: Container(
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(255, 255, 255, 1)),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          title: Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style:
                      const TextStyle(fontSize: 18, color: Color(0xff6875F5)),
                ),
              ],
            ),
          ),

          // trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0)
        ),
      ),
    );
  }
}
