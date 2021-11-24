import 'package:flutter/material.dart';
import 'package:graduaiton_app/data/users.dart';
import 'package:graduaiton_app/models/myuser.dart';
import 'package:graduaiton_app/screens/admin/tables_page/widget/scrollable_widget.dart';
import 'package:graduaiton_app/screens/admin/tables_page/widget/text_dialog_widget.dart';
import 'package:graduaiton_app/util/utils.dart';

class PeopleTable extends StatefulWidget {
  const PeopleTable({Key? key}) : super(key: key);

  @override
  _PeopleTableState createState() => _PeopleTableState();
}

class _PeopleTableState extends State<PeopleTable> {
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
    final columns = ['Name', 'Last Seen', 'Data Time', 'Action'];

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
              Text('$cell'),
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
