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
          SizedBox(height: 30,),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: WormEffect(),
          ),

          const SizedBox(height: 125),

          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xffEF2A39),
                ),
                child: IconButton(
                  onPressed: () {
                    controller.nextPage(
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 25,
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
