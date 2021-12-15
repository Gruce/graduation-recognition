// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AnimatedToggle extends StatefulWidget {
//   final List<String> values;
//   final ValueChanged onToggleCallback;
//   final Color backgroundColor;
//   final Color buttonColor;
//   final Color textColor;

//   AnimatedToggle({
//     required this.values,
//     required this.onToggleCallback,
//     this.backgroundColor = const Color(0xFFe7e7e8),
//     this.buttonColor = const Color(0xFFFFFFFF),
//     this.textColor = const Color(0xFF000000),
//   });
//   @override
//   _AnimatedToggleState createState() => _AnimatedToggleState();
// }

// class _AnimatedToggleState extends State<AnimatedToggle> {
//   bool initialPosition = true;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: Get.width * 0.6,
//       height: Get.width * 0.13,
//       margin: const EdgeInsets.all(20),
//       child: Stack(
//         children: <Widget>[
//           GestureDetector(
//             onTap: () {
//               initialPosition = !initialPosition;
//               var index = 0;
//               if (!initialPosition) {
//                 index = 1;
//               }
//               widget.onToggleCallback(index);
//               setState(() {});
//             },
//             child: Container(
//               width: Get.width * 0.6,
//               height: Get.width * 0.13,
//               decoration: ShapeDecoration(
//                 color: widget.backgroundColor,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(Get.width * 0.4),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(
//                   widget.values.length,
//                   (index) => Padding(
//                     padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
//                     child: Text(
//                       widget.values[index],
//                       style: TextStyle(
//                         fontFamily: 'Rubik',
//                         fontSize: Get.width * 0.045,
//                         fontWeight: FontWeight.bold,
//                         color: const Color(0xAA000000),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           AnimatedAlign(
//             duration: const Duration(milliseconds: 250),
//             curve: Curves.decelerate,
//             alignment:
//                 initialPosition ? Alignment.centerLeft : Alignment.centerRight,
//             child: Container(
//               width: Get.width * 0.33,
//               height: Get.width * 0.13,
//               decoration: ShapeDecoration(
//                 color: widget.buttonColor,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(Get.width * 0.1),
//                 ),
//               ),
//               child: Text(
//                 initialPosition ? widget.values[0] : widget.values[1],
//                 style: TextStyle(
//                   fontFamily: 'Rubik',
//                   fontSize: Get.width * 0.045,
//                   color: widget.textColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               alignment: Alignment.center,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedToggle(
//               values: ['English', 'Arabic'],
//               onToggleCallback: (value) {
//                 setState(() {
//                   _toggleValue = value;
//                 });
//               },
//               buttonColor: const Color(0xFF0A3157),
//               backgroundColor: const Color(0xFFB5C1CC),
//               textColor: const Color(0xFFFFFFFF),
//             ),
//             Text('Toggle Value : $_toggleValue'),
//           ],
//         ),
//       ),
//     );