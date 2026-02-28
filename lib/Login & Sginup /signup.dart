import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login%20&%20Sginup%20/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool ishidden = true;

  Future<void> saveUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailController.text);
    await prefs.setString('password', passwordController.text);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Account Created Successfully ✅')));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Welcome()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f2933),

      //Appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Padding(
            padding: const EdgeInsets.all(25),
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Login text
            Center(
              child: Padding(
                padding: const EdgeInsets.all(35),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            //First And Last Names
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //First Name Title
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'First Name : ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      
                      //First Name Field
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            iconColor: Colors.white,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: 'John',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Last Name Title
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Last Name : ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                     //First Name Field
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            iconColor: Colors.white,
                            fillColor: Colors.white,
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: 'Doe',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //Email title
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.topLeft,
              child: Text('Email : ', style: TextStyle(color: Colors.white)),
            ),

            //Email Textfield
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  iconColor: Colors.white,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: 'Enter Your Email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.topLeft,
              child: Text('Passwrod : ', style: TextStyle(color: Colors.white)),
            ),

            //Paswword Textfield
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: passwordController,
                style: TextStyle(color: Colors.white),
                obscureText: ishidden,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  iconColor: Colors.white,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        ishidden = !ishidden;
                      });
                    },
                    icon: Icon(
                      ishidden ? Icons.visibility_off : Icons.visibility,
                    ),
                    color: Colors.white,
                  ),

                  hintText: 'Enter Your Passwrod',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            //Confirm Passwrod Title
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.topLeft,
              child: Text(
                'Confirm Passwrod : ',
                style: TextStyle(color: Colors.white),
              ),
            ),
           
           //Confirm Passwrod Filed
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                style: TextStyle(color: Colors.white),
                obscureText: ishidden,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  iconColor: Colors.white,
                  fillColor: Colors.white,
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        ishidden = !ishidden;
                      });
                    },
                    icon: Icon(
                      ishidden ? Icons.visibility_off : Icons.visibility,
                    ),
                    color: Colors.white,
                  ),
                  hintText: 'Confirm You Passwrod',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            //Create Account Button
            Container(
              margin: EdgeInsets.all(15),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff2B8761),
              ),
              child: TextButton(
                onPressed: () {
                  saveUser();
                },
                child: Text(
                  'Craete Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
