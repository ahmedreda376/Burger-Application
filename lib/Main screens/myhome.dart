import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login%20&%20Sginup%20/welcome.dart';
import 'package:flutter_application_1/custom/lists.dart';
import 'package:flutter_application_1/custom/menu.dart';
import 'package:flutter_application_1/custom/search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItsHomePage extends StatefulWidget {
  const ItsHomePage({super.key});

  @override
  State<ItsHomePage> createState() => _ItsHomePageState();
}

class _ItsHomePageState extends State<ItsHomePage> {
  
  String full_name = ' ';

@override
  @override
  void initState() {
    super.initState();
    hi_user();
  } 

  Future<void> hi_user() async {
    final prefs = await SharedPreferences.getInstance();
    final first_name = prefs.getString('firstname');
    final last_name = prefs.getString('lastname');
    setState(() {
      full_name = '$first_name' + '$last_name';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                        Text('hi  $full_name' , style: TextStyle(fontSize: 15 , fontStyle: FontStyle.italic , fontWeight: FontWeight.w300),),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'Images/profile.jpg',
                      width: 50,
                      height: 50,
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
                        img: 'Images/burger4.png',
                        Burger_name: 'Hamburger ',
                        Burger_content: 'Fried Chicken Burger',
                        Burger_rate: '4.5',
                      ),
                    ],
                  ),
                ),
              ],
            ),
         
               
            //Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1 , horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('isLoggedIn', false);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Welcome(),
                        ), 
                      );
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
         
          ],
        ),
      ),
    );
  }
}
