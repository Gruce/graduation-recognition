import 'package:flutter/material.dart';
import 'package:graduaiton_app/data/users.dart';
import 'package:graduaiton_app/models/myuser.dart';
import 'package:graduaiton_app/screens/admin/home_page/tables/widget/scrollable_widget.dart';
import 'package:graduaiton_app/util/utils.dart';
import 'package:graduaiton_app/screens/admin/home_page/tables/widget/text_dialog_widget.dart';

class UnkonwnTable extends StatefulWidget {
  @override
  _UnkonwnTableState createState() => _UnkonwnTableState();
}

class _UnkonwnTableState extends State<UnkonwnTable> {
  late List<User> users;

  @override
  void initState() {
    super.initState();

    this.users = List.of(allUser);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['Id', 'Last Seen', 'Action'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isAction = column == columns[1];

      return DataColumn(
        label: Text(
          column,
          textAlign: TextAlign.start,
        ),
        numeric: isAction,
      );
    }).toList();
  }

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [user.firstName, user.lastName, user.action];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            return DataCell(
              Text(
                '$cell',
                textAlign: TextAlign.start,
              ),
            );
          }),
        );
      }).toList();
}
