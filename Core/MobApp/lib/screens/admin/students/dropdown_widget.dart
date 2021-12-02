import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookController extends GetxController {

   // It is mandatory initialize with one value from listType
   final selected = "some Stage".obs;

   void setSelected(String value){
     selected.value = value;
   }

}

// ignore: must_be_immutable
class DropDown extends StatelessWidget {
  DropDown({ Key? key }) : super(key: key);
      BookController dropdowncontroller = BookController();
      BookController bookcontroller = BookController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("fuck"),
//     child:Obx( () => DropdownButton(
//                       hint: const Text(
//                         'Stages',
//                       ),
//                       onChanged: (newValue) {
//                         bookcontroller.setSelected(newValue);
//                       },
//                       value: bookcontroller.selected.value,
//                       items: bookcontroller.listType.map((selectedType) {
//                         return DropdownMenuItem(
//                           child: Text(
//                             selectedType,
//                           ),
//                           value: selectedType,
//                         );
//                       }).toList(),
//                     )
// ),
    );
  }
}