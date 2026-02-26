import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Custom_login/cutsom_login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

bool ishidden = true;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          //Login text
          Center(
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
          ),
          //Textfields
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.topLeft,
            child: Text('Email : '),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Your email',
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
            child: Text('Passwrod : '),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              obscureText: ishidden,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      ishidden = !ishidden;
                    });
                  },
                  icon: Icon(
                    ishidden ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
                hintText: 'Enter Your Passwrod',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          CutsomLogin()
         
        ],
      ),
    );
  }
}
