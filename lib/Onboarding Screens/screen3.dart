import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen3 extends StatelessWidget {
  final PageController controller;
  const Screen3({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 140),
          Center(
            child: Image.asset('Images/delivery3.png', fit: BoxFit.contain),
          ),
          Text(
            'Fast Delivery',
            style: GoogleFonts.lobster(
              fontWeight: FontWeight.w500,
              fontSize: 30,
              color: Colors.black,
            ),
          ),
          Text('Fast delivery, great taste, and happy moments!'),

          SizedBox(height: 105),
         
        ],
      ),
    );
  }
}
