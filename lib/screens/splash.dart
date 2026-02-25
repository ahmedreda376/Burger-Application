import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => Homepage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffFF939B), Color(0xffEF2A39)],
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Foodgo',
                style: GoogleFonts.lobster(color: Colors.white, fontSize: 40),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                'Images/Splash1.png',
                width: 170,
                height: 190,
                fit: BoxFit.fill,
              ),
            ),

            Positioned(
              bottom: 0,
              left: 180 - 35,
              child: Image.asset(
                'Images/Splash2.png',
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
