import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            width: 100,
            height: 100,
            color: Colors.teal,
            child: Text(
              'Widget 1',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 100,
            height: 100,
            color: Colors.indigo,
            child: Text(
              'Widget 2',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 100,
            height: 100,
            color: Colors.deepOrange,
            child: Text(
              'Widget 3',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ]));
  }
}
