import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/screens/admin/layout.dart';

import 'luctures_controller.dart';

class LucuresWidget extends StatelessWidget {
  LucuresWidget({ Key? key }) : super(key: key);

  LucturesController controller = Get.put(LucturesController());

  @override
  Widget build(BuildContext context) {

    return const AdminLayoutScreen(
        title: 'Luctures',
        child: SingleChildScrollView(
    ));
  }
}