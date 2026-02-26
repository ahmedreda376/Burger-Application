import 'package:flutter/material.dart';
import 'package:flutter_application_1/Onboarding%20Screens/screen1.dart';
import 'package:flutter_application_1/Onboarding%20Screens/screen2.dart';
import 'package:flutter_application_1/Onboarding%20Screens/screen3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
  
}



class _MainscreenState extends State<Mainscreen> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                children: [
                  Screen1(controller: _controller),
                  Screen2(controller: _controller),
                  Screen3(controller: _controller),
                ],
              ),
            ),
          
        
      
          
          ],
        ),
        ],
      
      ),
    );
  }
}
