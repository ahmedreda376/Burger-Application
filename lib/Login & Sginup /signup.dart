import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login%20&%20Sginup%20/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Keys for each Form
  GlobalKey<FormState> formKeyFirstName = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyLastName = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyEmail = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyPassword = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyConfirmPassword = GlobalKey<FormState>();

  // Controllers
  final first_name_controller = TextEditingController();
  final last_name_controller = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool ishidden = true;

  // Sign up logic
  Future<void> saveUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstname', first_name_controller.text);
    await prefs.setString('lastname', last_name_controller.text);
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


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f2933),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Padding(
            padding: const EdgeInsets.all(25),
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Title
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

            // First & Last Names Row
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
                      Form(
                        key: formKeyFirstName,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            controller: first_name_controller,
                            keyboardType: TextInputType.name,
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Please Fill This Field';
                              if (value.length < 3)
                                return 'Name must be at least 3 characters';
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'John',
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
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

                      //Last Name Field
                      Form(
                        key: formKeyLastName,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            controller: last_name_controller,
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Please Fill This Field';
                              if (value.length < 3)
                                return 'Last Name must be at least 3 characters';
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Doe',
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Email Title
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.topLeft,
              child: Text('Email : ', style: TextStyle(color: Colors.white)),
            ),

            // Email Field
            Form(
              key: formKeyEmail,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please Fill This Field';
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value))
                      return 'Enter a valid email';
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),

            // Password Title
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.topLeft,
              child: Text('Password : ', style: TextStyle(color: Colors.white)),
            ),

            // Password Field
            Form(
              key: formKeyPassword,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: ishidden,
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please Fill This Field';
                    if (value.length < 6)
                      return 'Password must be at least 6 characters';
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => ishidden = !ishidden),
                      icon: Icon(
                        ishidden ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),

            // Confirm Password Title
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.topLeft,
              child: Text(
                'Confirm Password : ',
                style: TextStyle(color: Colors.white),
              ),
            ),

            // Confirm Password Field
            Form(
              key: formKeyConfirmPassword,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: confirmPasswordController,
                  obscureText: ishidden,
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please Fill This Field';
                    if (value != passwordController.text)
                      return 'Passwords do not match';
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirm Your Password',
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => ishidden = !ishidden),
                      icon: Icon(
                        ishidden ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  bool validFirst = formKeyFirstName.currentState!.validate();
                  bool validLast = formKeyLastName.currentState!.validate();
                  bool validEmail = formKeyEmail.currentState!.validate();
                  bool validPass = formKeyPassword.currentState!.validate();
                  bool validConfirm = formKeyConfirmPassword.currentState!.validate();

                  if (validFirst &&
                      validLast &&
                      validEmail &&
                      validPass &&
                      validConfirm) {
                    saveUser();
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
                  margin: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff2B8761),
                  ),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
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
