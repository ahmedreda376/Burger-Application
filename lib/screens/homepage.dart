import 'package:flutter/material.dart';
import 'package:flutter_application_1/Main%20screens/chat.dart';
import 'package:flutter_application_1/Main%20screens/favourites.dart';
import 'package:flutter_application_1/Main%20screens/myhome.dart';
import 'package:flutter_application_1/Main%20screens/pesron.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _bottomNavIndex = 0;

  List<Widget> pages = [ItsHomePage(), Pesron(), Chat(), Favourites()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},


        
        backgroundColor: Color(0xffEF2A39),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add, color: Colors.white),
      ),



      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Color(0xffEF2A39),
        activeColor: Colors.white,
        icons: [Icons.home, Icons.person, Icons.chat, Icons.favorite],
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
      body: pages[_bottomNavIndex],
    );
  }
}
