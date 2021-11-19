// ignore_for_file: unnecessary_const
import 'dart:io';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:graduaiton_app/screens/admin/home_page/home_screen.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 200,
            backgroundColor: Color(0xff6875F5),
            iconTheme: IconThemeData(color:Color(0xff6875F5)),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Schedule'),
              centerTitle: true,
              background: Image.asset(
                'bbb.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SliverFillRemaining(
              child: ListView(children: <Widget>[
            DataTable(
              columns: const [
                DataColumn(
                    label: Text('Day',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6875F5)))),
                DataColumn(
                    label: Text('Subject Name',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6875F5)))),
                DataColumn(
                    label: Text('Subject Time',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6875F5)))),
              ],
              rows: const [
                DataRow(cells: const [
                  DataCell(Text('Sunday')),
                  DataCell(Text('Data')),
                  DataCell(Text('Time')),
                ]),
                DataRow(cells: const [
                  DataCell(Text('Monday')),
                  DataCell(Text('Data')),
                  DataCell(Text('Time')),
                ]),
                DataRow(cells: const [
                  DataCell(Text('Tuesday')),
                  DataCell(Text('Data')),
                  DataCell(Text('Time')),
                ]),
                DataRow(cells: const [
                  DataCell(Text('Wednesday')),
                  DataCell(Text('Data')),
                  DataCell(Text('Time')),
                ]),
                DataRow(cells: const [
                  DataCell(Text('Thursday')),
                  DataCell(Text('Data')),
                  DataCell(Text('Time')),
                ]),
                DataRow(cells: const [
                  DataCell(Text('Friday')),
                  DataCell(Text('Data')),
                  DataCell(Text('Time')),
                ]),
                DataRow(cells: const [
                  DataCell(Text('Saturday')),
                  DataCell(Text('Data')),
                  DataCell(Text('Time')),
                ]),
              ],
            ),
          ])),
        ],
      ),
    );
  }
}
