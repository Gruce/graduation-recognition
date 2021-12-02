import 'package:flutter/material.dart';


class DilogForm extends StatefulWidget {
  const DilogForm({Key? key}) : super(key: key);

  @override
  _DilogFormState createState() => _DilogFormState();
}

class _DilogFormState extends State<DilogForm> {
late final FormFieldValidator<String>? dropdownvalue;
  var items;
  List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> Items = [
    DropdownMenuItem(child: Text("USA"),value: "USA"),
    DropdownMenuItem(child: Text("Canada"),value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
    DropdownMenuItem(child: Text("England"),value: "England"),
  ];
  return Items;
}
  @override
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Container(
        width: double.infinity,
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    primary: Colors.green // fromHeight use double.infinity as width and 40 is the height
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add),
                    Text("add pepole"),
                  ],
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: const Text(
                            ' add user',
                            textAlign: TextAlign.center,
                          ),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Name',
                                      icon: Icon(Icons.account_box),
                                    ),
                                  ),
                                  DropdownButton(
                                    value: dropdownvalue,
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    items: items.map((String items) {
                                      return DropdownMenuItem(
                                          value: items, child: Text(items));
                                    }).toList(),
                                    // onChanged: (String newValue) {
                                    //   setState(() {
                                    //     _dropdownvalue = newValue;
                                    //   });
                                    // },
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Message',
                                      icon: Icon(Icons.message),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                child: const Text("Submit"),
                                onPressed: () {
                                  // your code
                                })
                          ],
                        );
                      });
                },
              ),
            ]),
      ));
}
