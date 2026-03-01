import 'package:flutter/material.dart';
import 'package:flutter_application_1/Custom_login/customdivider.dart';
import 'package:flutter_application_1/Login%20&%20Sginup%20/signup.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  //Forms

  GlobalKey<FormState> email_form = GlobalKey<FormState>();
  GlobalKey<FormState> password_form = GlobalKey<FormState>();

  //Controllers and state
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool ishidden = true;

  //Login logic

  Future<void> loginUser() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');

    if (emailController.text == savedEmail &&
        passwordController.text == savedPassword) {
      await prefs.setBool('isLoggedIn', true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email or Password is incorrect ❌')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f2933),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Welcome
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
          Form(
            key: email_form,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Fill This Field';
                  } else {
                    return null;
                  }
                },
                controller: emailController,
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
          ),

          //Password
          Form(
            key: password_form,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                  validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Fill This Field';
                  } else {
                    return null;
                  }
                },
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
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              )
            ),
          ),

          //Login Button
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  bool email_formfield = email_form.currentState!.validate();
                  bool password_fromfield = password_form.currentState!
                      .validate();
                  if (email_formfield && password_fromfield) {
                    loginUser();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please fill all required fields correctly',
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xff2B8761),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),

          //Custom Divider
          Customdivider(),

          //Sign up Button
          SizedBox(
            width: double.infinity,
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Container(
                  padding: EdgeInsets.all(3),
                  alignment: Alignment(0, 0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xff0f1b2d),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
