import 'package:flutter/material.dart';

class Lists extends StatelessWidget {
  const Lists({super.key, required this.Burger_Name});

  final String Burger_Name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 50,
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: Text(
        '$Burger_Name',
        style: TextStyle(
          color: Color(0xff6A6A6A),
          fontSize: 12,
        ),
      ),
    );
  }
}
