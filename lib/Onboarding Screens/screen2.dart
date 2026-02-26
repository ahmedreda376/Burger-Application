import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Screen2 extends StatelessWidget {
  final PageController controller;
  const Screen2({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
              SizedBox(height: 110),
          Center(child: Image.asset('Images/delivery1.png' , height: 280, )),
          Text(
            'Order Healthy Food',
            style: GoogleFonts.lobster(
              fontWeight: FontWeight.w500,
                  fontSize: 30,
              color: Colors.black,
            ),
          ),
          Text('Choose ingredients, sizes, and special sauces easily.'),
            SizedBox(height: 30),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: WormEffect(),
          ),

          SizedBox(height: 87),
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
                    controller.nextPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
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
