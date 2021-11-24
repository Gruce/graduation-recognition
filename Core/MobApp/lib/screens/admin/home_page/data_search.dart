import 'package:graduaiton_app/screens/admin/home_page/tables/tables.dart';
import 'package:graduaiton_app/screens/admin/profile%20.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var listsearch = [];

  Future getData() async {
    var url = "http://127.0.0.1:8000/api/people";
    
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    for (int i = 0; i < responsebody.length; i++) {
      listsearch.add(responsebody[i]);
    }

    print(listsearch);
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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context, delegate: DataSearch(list: listsearch));
              }),
          Text('Search for a person'),
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
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return GestureDetector(
        // onTap: () => print(this),
        // child: Text(query),
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    var searchlist = query.isEmpty
        ? list
        : list.where((p) => p['name'].toString().startsWith(query)).toList();
    return ListView.builder(
        itemCount: searchlist.length,
        itemBuilder: (context, i) {
          return ListTile(
              leading: Icon(Icons.verified_user_sharp),
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
