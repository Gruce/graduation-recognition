import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LuctureWidget extends GetWidget {
  LuctureWidget({
    Key? key,
 
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        // shadowColor: Colors.black12,
        color: Colors.transparent,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 24.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.93,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Next Lucter'),
                  Text(' = controller.'),
                  Text('Time : 10 AM')
                ],
              ),
            ),
            ListTile(
                title: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Text('Stage : Forth'),
                        ]),
                        Text('Unit: A'),
                      ],
                    )),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      's',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    )),
                    Text(
                      'd',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                    Expanded(
                        child: Text(
                      's',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    )),
                    Text(
                      'd',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ],
                )),
            Divider(
              thickness: 0.3,
            )
          ],
        ));
  }
}
