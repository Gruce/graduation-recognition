import 'package:flutter/material.dart';

// Adapted from the data table demo in offical flutter gallery:
// https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/demo/material/data_table_demo.dart
class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _DataTableExampleState createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<Schedule> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: const Text('Absence and Presence'),
        rowsPerPage: _rowsPerPage,
        availableRowsPerPage: const <int>[5, 10, 20],
        onRowsPerPageChanged: (int? value) {
          if (value != null) {
            setState(() => _rowsPerPage = value);
          }
        },
        columns: kTableColumns,
        source: DessertDataSource(),
      ),
    );
  }
}

////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(
    label: Text('Name'),
  ),
  DataColumn(
    label: Text('Stage'),
    tooltip: 'Nothing',
    numeric: true,
  ),
  DataColumn(
    label: Text('Group'),
    numeric: true,
  ),
  DataColumn(
    label: Text('Absence'),
    numeric: true,
  ),
  DataColumn(
    label: Text('Presence'),
    numeric: true,
  ),
  DataColumn(
    label: Text('Total Absence'),
    numeric: true,
  ),
];

////// Data class.
class Dessert {
  Dessert(this.name, this.stage, this.group, this.absence, this.presence,
      this.totalAbsence);
  final String name;
  final int stage;
  final String group;
  final String absence;
  final String presence;
  final int totalAbsence;
  bool selected = false;
}

////// Data source class for obtaining row data for PaginatedDataTable.
class DessertDataSource extends DataTableSource {
  final int _selectedCount = 0;
  final List<Dessert> _desserts = <Dessert>[
    Dessert('Abdulkareem', 4, "A", "True", "False", 5),
    Dessert('Abdulkareem', 4, "A", "True", "False", 5),
    Dessert('Abdulkareem', 4, "A", "True", "False", 5),
    Dessert('Abdulkareem', 4, "A", "True", "False", 5),
    Dessert('Abdulkareem', 4, "A", "True", "False", 5),
    Dessert('Abdulkareem', 4, "A", "True", "False", 5),
    Dessert('Abdulkareem', 4, "A", "True", "False", 5),
    Dessert('Abdulkareem', 4, "A", "True", "False", 5),
    Dessert('Abdulkareem', 4, "A", "True", "False", 5),
    Dessert('Abdulkareem', 4, "A", "True", "False", 5),
  ];

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _desserts.length) return null;
    final Dessert dessert = _desserts[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text(dessert.name)),
      DataCell(Text(dessert.stage.toString())),
      DataCell(Text(dessert.group)),
      DataCell(Text(dessert.absence)),
      DataCell(Text(dessert.presence)),
      DataCell(Text(dessert.totalAbsence.toString())),
    ]);
  }

  @override
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
