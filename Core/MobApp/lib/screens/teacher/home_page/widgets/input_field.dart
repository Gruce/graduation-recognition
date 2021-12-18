import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyinputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyinputField({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children:[
      Container(
        alignment: Alignment.topLeft,
      margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 16, color: Colors.black54),
          ),],),),
          Container(
            height: 40,
            margin: const EdgeInsets.only(left:10,right: 10,top: 4,bottom: 10),
            padding: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff6875F5), width: 1),
                borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              Expanded(
                  child: TextField(
                    expands: true,
                    // minLines: 6, // any number you need (It works as the rows for the textarea)
                    // keyboardType: TextInputType.multiline,
                    maxLines: null,
                controller: controller,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black),
                decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey),
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0)),
                    enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0))),
              )),
              widget == null
                  ? Container()
                  : Container(
                      child: widget,
                    )
            ]),
          ),
        ],
    );
  }
}
