import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homepage.dart';

class CutsomLogin extends StatelessWidget {
  const CutsomLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
      },
      child: Container(
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
           
          },
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
