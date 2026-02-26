import 'package:flutter/material.dart';
import 'package:flutter_application_1/Custom_login/customdivider.dart';
import 'package:flutter_application_1/Custom_login/cutsom_login.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

bool ishidden = true;

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f2933),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Welcome Back!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          Text('Login To Your Account', style: TextStyle(color: Colors.white)),
          SizedBox(height: 10),

          //Email
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                focusColor: Colors.white,
                iconColor: Colors.white,
                  fillColor: Colors.white,
                            hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.email, color: Colors.white),
              
      
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),

          //Passwrod
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
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                hintText: 'Passwrod',
                
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          CutsomLogin(),
          Customdivider()
        
        ],
      ),
    );
  }
}
