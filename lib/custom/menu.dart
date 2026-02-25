import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key, required this.img, required this.Burger_name, required this.Burger_content, required this.Burger_rate});

  final String img;
  final String Burger_name ; 
  final String Burger_content ; 
  final String Burger_rate ; 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
            offset: Offset(1, 1),
            blurRadius: 5,
            spreadRadius: 0.8,
          ),

          BoxShadow(
            color: Colors.white,
            offset: Offset(-1, -1),
            blurRadius: 6,
            spreadRadius: 3,
          ),
        ],
      ),
      width: 170,
      height: 230,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('$img', width: 120, fit: BoxFit.cover)),
            SizedBox(height: 5),
            Text('$Burger_name'),
            Text('$Burger_content'),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Text('$Burger_rate'),
                Spacer(),
                Icon(Icons.favorite_outline_sharp),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
