import 'package:flutter/material.dart';
import '../layout.dart';
import 'page/people_page.dart';
import 'page/tracking_page.dart';
import 'page/unknown_page.dart';
import 'widget/tabbar_widget.dart';

class AdminTablesScreen extends StatelessWidget {
  const AdminTablesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBarWidget(
          title: 'Tables',
          tabs: const [
            Tab(icon: Icon(Icons.art_track), text: 'Tracking'),
            Tab(icon: Icon(Icons.people), text: 'People'),
            Tab(icon: Icon(Icons.device_unknown), text: 'Unknown'),
          ],
          children: [
            const TrackingTable(),
            const PeopleTable(),
            UnkonwnTable(),
          ],
        )
      ],
    );
  }
}
