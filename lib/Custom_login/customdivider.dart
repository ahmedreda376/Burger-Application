import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login%20&%20Sginup%20/signup.dart';

class Customdivider extends StatelessWidget {
  const Customdivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(width: 200, height: 1, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Don\'t have an account?',
              style: TextStyle(color: Color(0xffbfc7d5), fontSize: 15),
            ),
          ),
          Expanded(
            child: Container(width: 120, height: 1, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
