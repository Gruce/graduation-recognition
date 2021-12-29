// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';

// class CameraWidget extends GetWidget {
//   CameraWidget({
//     Key? key,
//     required this.description,
//     required this.state,
//     required this.source,
//   }) : super(key: key);

//   String description;
//   int state;
//   String source;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       color: Colors.transparent,
//       margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 6.0),
//       child: Container(
//         padding: const EdgeInsets.all(14.0),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: const Color.fromRGBO(255, 255, 255, 1)),
//         child: ListTile(
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
//           title: Container(
//             margin: const EdgeInsets.only(bottom: 10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   description,
//                   style: const TextStyle(fontSize: 18),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(5.0),
//                   decoration: BoxDecoration(
//                     color: state == 1 ? Colors.green : Colors.red,
//                     borderRadius: const BorderRadius.all(Radius.circular(
//                             5.0) //                 <--- border radius here
//                         ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           // trailing: const Icon(Icons.keyboard_arrow_right, size: 30.0)
//         ),
//       ),
//     );
//   }
// }
