import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Screen1 extends StatelessWidget {
  final PageController controller;

  const Screen1({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 120),
          Center(child: Image.asset('Images/delivery2.png', fit: BoxFit.fill)),
          Text(
            'Welcome To foodgo',
            style: GoogleFonts.lobster(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          const Text('Discover fresh and tasty burgers made with love.'),
         

          const SizedBox(height: 125),

          
        ],
      ),
    );
  }
}
