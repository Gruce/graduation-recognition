import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              const Text('Search for a person'),
              IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
         
      ],

    );
  }
}
