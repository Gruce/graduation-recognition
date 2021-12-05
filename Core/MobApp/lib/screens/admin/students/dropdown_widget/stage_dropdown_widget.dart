import 'package:flutter/material.dart';
class StageDropDown extends StatefulWidget {
  const StageDropDown({Key? key}) : super(key: key);

  @override
  _StageDropDownState createState() => _StageDropDownState();
}

class _StageDropDownState extends State<StageDropDown> {
  String dropdownvalue = 'Stage';
  var items = [
    'Stage',
    '1',
    '2',
    '3',
    '4',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            // Initial Value
            value: dropdownvalue,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items,
                    style: const TextStyle(color: Color(0xff6875F5))),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}
