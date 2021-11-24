// // ignore_for_file: unnecessary_const
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:graduaiton_app/screens/admin/home_page/app_bar.dart';

// class ShowTracking extends StatelessWidget {
//   const ShowTracking({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(100),
//         child: AppBarr(),
//       ),
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverFillRemaining(
//               child: ListView(children: <Widget>[
//             DataTable(
//               columns: const [
//                 DataColumn(
//                     label: Text('Person Name',
//                         style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xff6875F5)))),
//                 DataColumn(
//                     label: Text('Camera Description',
//                         style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xff6875F5)))),
//                 DataColumn(
//                     label: Text('Date Time',
//                         style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xff6875F5)))),
//                 DataColumn(
//                     label: Text('Action',
//                         style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xff6875F5)))),
//               ],
//               rows: const [
//                 DataRow(cells: const [
//                   DataCell(Text('Data')),
//                   DataCell(Text('Data')),
//                   DataCell(Text('Data')),
//                   DataCell(Text('Time')),
//                 ]),
//                 DataRow(cells: const [
//                   DataCell(Text('Data')),
//                   DataCell(Text('Data')),
//                   DataCell(Text('Data')),
//                   DataCell(Text('Time')),
//                 ]),
//                 DataRow(cells: const [
//                   DataCell(Text('Data')),
//                   DataCell(Text('Data')),
//                   DataCell(Text('Data')),
//                   DataCell(Text('Time')),
//                 ]),
//                 DataRow(cells: const [
//                   DataCell(Text('Data')),
//                   DataCell(Text('Data')),
//                   DataCell(Text('Data')),
//                   DataCell(Text('Time')),
//                 ]),
//                 DataRow(cells: const [
//                   DataCell(Text('Data')),
//                   DataCell(Text('Data')),
//                   DataCell(Text('Data')),
//                   DataCell(Text('Time')),
//                 ]),
//                 DataRow(cells: const [
//                   DataCell(Text('Data')),
//                   DataCell(Text('Data')),
//                   DataCell(Text('Data')),
//                   DataCell(Text('Time')),
//                 ]),
//                 DataRow(cells: const [
//                   DataCell(Text('Data')),
//                   DataCell(Text('Data')),
//                   DataCell(Text('Data')),
//                   DataCell(Text('Time')),
//                 ]),
//               ],
//             ),
//           ])),
//         ],
//       ),
//     );
//   }
// }
