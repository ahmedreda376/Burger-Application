import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login%20&%20Sginup%20/signup.dart';

class Customdivider extends StatelessWidget {
  const Customdivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(width: 120, height: 1, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
              child: Text('Or Sign Up', style: TextStyle(color: Colors.white)),
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
