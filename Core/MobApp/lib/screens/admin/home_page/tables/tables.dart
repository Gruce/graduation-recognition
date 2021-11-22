import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduaiton_app/screens/admin/home_page/Tables/widget/tabbar_widget.dart';
import 'page/people_page.dart';
import 'page/tracking_page.dart';
import 'page/unknown_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class Tables extends StatefulWidget {
  const Tables({Key? key}) : super(key: key);

  @override
  _TablesState createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  @override
  Widget build(BuildContext context) => TabBarWidget(
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
      );
}
