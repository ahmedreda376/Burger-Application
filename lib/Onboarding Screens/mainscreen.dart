import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login%20&%20Sginup%20/signup.dart';
import 'package:flutter_application_1/Login%20&%20Sginup%20/welcome.dart';
import 'package:flutter_application_1/Onboarding%20Screens/screen1.dart';
import 'package:flutter_application_1/Onboarding%20Screens/screen2.dart';
import 'package:flutter_application_1/Onboarding%20Screens/screen3.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  final PageController _controller = PageController();
  bool onLastpage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                if(index == 2){
                  onLastpage = !onLastpage ; 
                };
              });
            },
            controller: _controller,
            children: [
              Screen1(controller: _controller),
              Screen2(controller: _controller),
              Screen3(controller: _controller),
            ],
          ),

          Container(
            alignment: Alignment(0, 0.7),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  //Skip Button 
                  TextButton(
                    onPressed: () {
                      _controller.animateToPage(
                        2,
                        duration: Duration(milliseconds: 600),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text('Skip'),
                  ),

                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: WormEffect(),
                  ),

                    //Next & Done Buttons

                  onLastpage
                      ? TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Welcome(),
                              ),
                            );
                            
                          
                          },
                          child: Text('Done'),
                        )
                      : TextButton(
                          onPressed: () {
                             _controller.nextPage(
                              duration: Duration(milliseconds: 600),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text('Next'),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
