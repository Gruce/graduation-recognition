import 'package:flutter/material.dart';

class UnitDropDown extends StatefulWidget {
  const UnitDropDown({Key? key}) : super(key: key);

  @override
  _UnitDropDownState createState() => _UnitDropDownState();
}

class _UnitDropDownState extends State<UnitDropDown> {
  String dropdownvalue = 'Unit';
  var items = ['Unit', 'A', 'B', 'C', 'D'];
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
                      style: const TextStyle(color: Color(0xff6875F5))));
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
