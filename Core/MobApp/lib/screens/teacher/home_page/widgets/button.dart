import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), 
            color: const Color(0xff6875F5)),
            alignment: Alignment.center,
            child: Text(
              
              label,
              style: const TextStyle(
                
                color: Colors.white,
              ),
            ),
      ),
    );
  }
}
