import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom/lists.dart';
import 'package:flutter_application_1/custom/menu.dart';
import 'package:flutter_application_1/custom/search.dart';
import 'package:google_fonts/google_fonts.dart';


class ItsHomePage extends StatelessWidget {
  const ItsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            //Appbar
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Foodgo',
                        style: GoogleFonts.lobster(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                      Text('Order your favourite food!'),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'Images/profile.jpg',
                      width: 50,
                      height:50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 50),

            //SearchBar
            Row(
              children: [
                Search(),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffEF2A39),
                  ),
                  child: Icon(Icons.list_sharp, color: Colors.white),
                ),
              ],
            ),

            SizedBox(height: 20),

            //List
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffEF2A39),
                    ),
                    child: Text('All', style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(width: 5),
                  Lists(Burger_Name: 'Combo'),
                  SizedBox(width: 5),
                  Lists(Burger_Name: 'Sliders'),
                  SizedBox(width: 5),
                  Lists(Burger_Name: 'Hot '),
                  SizedBox(width: 5),
                  Lists(Burger_Name: 'Nromal'),
                ],
              ),
            ),

            SizedBox(height: 20),

            //Menu
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Menu(
                        img: 'Images/burger4.png',
                        Burger_name: 'Cheese Burger',
                        Burger_content: 'Wendy\'s Burger',
                        Burger_rate: '4.9',
                      ),
                      SizedBox(width: 22),
                      Menu(
                        img: 'Images/burger3.png',
                        Burger_name: 'Hamburger ',
                        Burger_content: 'Veggie Burger',
                        Burger_rate: '4.8',
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Menu(
                        img: 'Images/burger2.png',
                        Burger_name: 'Hamburger',
                        Burger_content: 'Chicken Burger',
                        Burger_rate: '4.6',
                      ),
                      SizedBox(width: 22),
                      Menu(
                        img:'Images/burger4.png',
                        Burger_name: 'Hamburger ',
                        Burger_content: 'Fried Chicken Burger',
                        Burger_rate: '4.5',
                      ),
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