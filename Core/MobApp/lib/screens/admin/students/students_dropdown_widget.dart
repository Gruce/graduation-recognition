import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Admin/admin_dropdown_controller.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DropdownController>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(children: [
          const Text('Select Language: '),
          const SizedBox(height: 10.0),
          DropdownButton<String>(
              hint: const Text('Language'),
              value: controller.selectedValue,
              onChanged: (newValue) {
                controller.onSelected("arabic");
              },
              elevation: 10,
              items: const [
                DropdownMenuItem(
                  child: Text("English"),
                  value: 'English',
                ),
                DropdownMenuItem(
                  child: Text("ESpanol"),
                  value: 'Espanol',
                ),
              ]),
        ]),
      );
    });
  }
}
