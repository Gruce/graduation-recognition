import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:graduaiton_app/controllers/Teacher/notification_controller.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/button.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/input_field.dart';

class Notif extends GetView {
  @override
  NotificationController controller = Get.put(NotificationController());

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                children: [
              Container(
                margin: const EdgeInsets.only(left:5,right: 5,top: 4,bottom: 10),
                decoration: new BoxDecoration (
                    borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                  color: Colors.grey[200],
                ),
              child:TextField(
                minLines: 1, // any number you need (It works as the rows for the textarea)
                keyboardType: TextInputType.multiline,
                maxLines: null,
                    decoration: const InputDecoration(
                      labelText: 'Subject',
                      hintText: 'enter the subject',
                      border:OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff6875F5),
                        ),),
                    ),
                    controller: controller.titleController,
                  ),
              ),
                  Container(
                    margin: const EdgeInsets.only(left:5,right: 5,top: 4,bottom: 10),
                    decoration: new BoxDecoration (
                        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                      color: Colors.grey[200],
                    ),
                    child:TextField(
                      minLines: 3, // any number you need (It works as the rows for the textarea)
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        labelText: 'Text',
                        hintText: 'enter the Text',
                        border:OutlineInputBorder(
                      borderSide: BorderSide(
                      color: Color(0xff6875F5),
                      ),
                    ),
                      ),
                      controller: controller.bodyController,
                    ),
                  ),])))));}}