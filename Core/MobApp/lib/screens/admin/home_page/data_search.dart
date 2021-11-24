import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graduaiton_app/screens/admin/home_page/tables/tables.dart';
import 'package:graduaiton_app/screens/admin/nav_bar/Profile/profile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var listsearch = [];
  final api = dotenv.env['API'];

  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jwt = prefs.getString('jwt').toString();
    var res = await http
        .get(Uri.parse("$api/people"), headers: {"Authorization": jwt});
    if (res.statusCode == 200) {
      var responsebody = jsonDecode(res.body)['data'];
      for (int i = 0; i < responsebody.length; i++) {
        listsearch.add(responsebody[i]);
      }
    }

    // print(listsearch);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context, delegate: DataSearch(list: listsearch));
              }),
          const Text('Search for a person'),
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
    ));
  }
}

class DataSearch extends SearchDelegate {
  List<dynamic> list;
  DataSearch({required this.list});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return GestureDetector(
        // onTap: () => print(this),
        // child: Text(query),
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchlist = query.isEmpty
        ? list
        : list.where((p) => p['name'].toString().startsWith(query)).toList();
    return ListView.builder(
        itemCount: searchlist.length,
        itemBuilder: (context, i) {
          return ListTile(
              leading: const Icon(Icons.verified_user_sharp),
              title: Text(searchlist[i]['name']),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile(
                          id: searchlist[i]['id'],
                        )));
              });
        });
  }
}
