import 'package:flutter/material.dart';
import 'package:graduaiton_app/data/users.dart';
import 'package:graduaiton_app/models/myuser.dart';
import 'package:graduaiton_app/screens/admin/home_page/tables/widget/scrollable_widget.dart';
import 'package:graduaiton_app/screens/admin/home_page/tables/widget/text_dialog_widget.dart';
import 'package:graduaiton_app/util/utils.dart';

class TrackingTable extends StatefulWidget {
  const TrackingTable({Key? key}) : super(key: key);

  @override
  _TrackingTableState createState() => _TrackingTableState();
}

class _TrackingTableState extends State<TrackingTable> {
  late List<User> users;

  @override
  void initState() {
    super.initState();

    users = List.of(allUser);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['Person Name', 'Camera', 'Date Time', 'Action'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isAge = column == columns[2];

      return DataColumn(
        label: Text(column),
        numeric: isAge,
      );
    }).toList();
  }

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [user.firstName, user.lastName, user.age, user.action];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 0;

            return DataCell(
              Text(
                '$cell',
                textAlign: TextAlign.start,
              ),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 0:
                    editFirstName(user);
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editFirstName(User editUser) async {
    final firstName = await showTextDialog(
      context,
      title: 'Change First Name',
      value: editUser.firstName,
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(firstName: firstName) : user;
        }).toList());
  }
}
