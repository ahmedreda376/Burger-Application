import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_application_1/Main%20screens/myhome.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:flutter_application_1/screens/splash.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
            SizedBox(height: 30),
          SmoothPageIndicator(

            controller: controller,
            count: 3,
            effect: WormEffect(),
          ),

          SizedBox(height: 105),
          Align(
            alignment: AlignmentGeometry.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xffEF2A39),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => Homepage()),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
