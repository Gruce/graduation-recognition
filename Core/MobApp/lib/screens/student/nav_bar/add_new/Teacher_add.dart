// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CameraAdd extends StatefulWidget {
  const CameraAdd({Key? key}) : super(key: key);

  @override
  _CameraAddState createState() => _CameraAddState();
}

class _CameraAddState extends State<CameraAdd> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _textEditingController =
              TextEditingController();
          bool isChecked = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(hintText: "Full Name"),
                        style: const TextStyle(color: Color(0xff6875F5)),
                      ),
                      TextFormField(
                          decoration: const InputDecoration(hintText: "Speciality"),
                          style: const TextStyle(color: Color(0xff6875F5))),
                      TextFormField(
                        controller: _textEditingController,
                        validator: (value) {
                          return value!.isNotEmpty ? null : "Invalid Field";
                        },
                        decoration: const InputDecoration(hintText: "Email"),
                        style: const TextStyle(color: Color(0xff6875F5)),
                      ),
                      TextFormField(
                          decoration: const InputDecoration(hintText: "Password"),
                          style: const TextStyle(color: Color(0xff6875F5))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Confirm adding",
                              style: TextStyle(color: Color(0xff6875F5))),
                          Checkbox(
                              value: isChecked,
                              onChanged: (checked) {
                                setState(() {
                                  isChecked = checked!;
                                });
                              })
                        ],
                      )
                    ],
                  )),
              actions: <Widget>[
                TextButton(
                  child: const Text('Add'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher"),
        
      ),
      body: Center(
        // ignore: deprecated_member_use
        child: FlatButton(
            color: Colors.deepOrange,
            onPressed: () async {
              await showInformationDialog(context);
            },
            child: const Text(
              "Add Teacher",
              style: TextStyle(color: Colors.white, fontSize: 16),
            )),
      ),
    );
  }
}
