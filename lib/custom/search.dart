import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              offset: Offset(1, 1),
              blurRadius: 10,
              spreadRadius: 0.8,
            ),

            BoxShadow(
              color: Colors.white,
              offset: Offset(-1, -1),
              blurRadius: 10,
              spreadRadius: 3,
            ),
          ],
        ),
        width: 315,
        height: 60,
        child: Row(
          children: [Icon(Icons.search), SizedBox(width: 10), Text('Search')],
        ),
      ),
    );
  }
}