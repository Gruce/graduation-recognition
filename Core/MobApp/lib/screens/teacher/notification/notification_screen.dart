import 'package:flutter/material.dart';
import 'package:graduaiton_app/screens/teacher/home_page/widgets/button.dart';
import 'package:graduaiton_app/screens/teacher/layout.dart';

class TeacherNotification extends StatefulWidget {
  const TeacherNotification({Key? key}) : super(key: key);

  @override
  _TeacherNotificationState createState() => _TeacherNotificationState();
}

class _TeacherNotificationState extends State<TeacherNotification> {
  @override
  static const menuItems = <String>[
    'One',
    'Two',
    'Three',
    'Four',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();
  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) => PopupMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String _btn1SelectedVal = 'One';
  String? _btn2SelectedVal;
  late String _btn3SelectedVal;
  @override
  Widget build(BuildContext context) {
    return TeacherLayoutScreen(
        title: 'Notification',
        child: Column(
          children: [
            FloatingActionButton.extended(
              backgroundColor: Color(0xff6875F5),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        scrollable: true,
                        title: Text('Enter your notification you wnat to send'),
                        insetPadding: EdgeInsets.zero,
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Title',
                                    icon: Icon(Icons.account_box),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                TextField(
                                  maxLines: 2,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  decoration: InputDecoration(
                                    labelText: 'Message',
                                    icon: Icon(Icons.message),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    ListTile(
                                      title: const Text(
                                          'Stage:'),
                                      trailing: DropdownButton<String>(
                                        // Must be one of items.value.
                                        value: _btn1SelectedVal,
                                        onChanged: (String? newValue) {
                                          if (newValue != null) {
                                            // setState(() => _btn1SelectedVal = newValue);
                                          }
                                        },
                                        items: this._dropDownMenuItems,
                                      ),
                                    ),
                                    ListTile(
                                        // for Left
                                      title: const Text('Section:'),
                                      trailing: DropdownButton(
                                        value: _btn2SelectedVal,
                                        hint: const Text('Choose'),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            _btn2SelectedVal = newValue;
                                          });
                                        },
                                        items: _dropDownMenuItems,
                                      ),
                                    ),
                                   ListTile(
                                        // for Left
                                      title: const Text('Section:'),
                                      trailing: DropdownButton(
                                        value: _btn2SelectedVal,
                                        hint: const Text('Choose'),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            _btn2SelectedVal = newValue;
                                          });
                                        },
                                        items: _dropDownMenuItems,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          MyButton(label: 'Send', onTap: (){})
                        ],
                      );
                    });
              },
              icon: Icon(Icons.phone_android),
              label: Text("Add Notification"),
            ),
          ],
        ));
  }
}
