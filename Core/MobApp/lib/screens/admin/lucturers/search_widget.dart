import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_users_controller.dart';

// ignore: must_be_immutable
class SearchWidget extends GetView {
  SearchWidget({Key? key}) : super(key: key);

  @override
  AdminUsersController controller = Get.put(AdminUsersController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(1),
        border: Border.all(
          color: Colors.white.withOpacity(1),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: (value) => controller.search(value),
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search by Name",
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                isDense: true,
              ),
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
