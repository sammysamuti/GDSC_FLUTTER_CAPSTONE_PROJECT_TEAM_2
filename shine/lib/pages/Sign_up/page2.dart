import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shine/pages/HomeScreen/HomeScreen.dart';
import 'package:shine/pages/Sign_up/page3.dart';

import '../adminpage/addnewproduct.dart';

class SignIn_Screen extends StatefulWidget {
  SignIn_Screen({Key? key}) : super(key: key);

  @override
  State<SignIn_Screen> createState() => _SignIn_ScreenState();
}

class _SignIn_ScreenState extends State<SignIn_Screen> {
  final email = TextEditingController();
  final password = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: height * 0.05,
          left: width * 0.1,
          right: width * 0.1,
        ),
        child: SingleChildScrollView(
          // Wrap the Column with SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  "Let's sign you in",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Welcome back",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                "Email",
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
              textfield(
                "Email",
                Icons.person_outline,
                email,
                TextInputType.emailAddress,
                suffixIcon: Icons.done,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                "Password",
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
              textfield(
                "*********",
                Icons.lock_outline,
                password,
                TextInputType.visiblePassword,
                suffixIcon: Icons.visibility_outlined,
              ),
              SizedBox(
                height: height * 0.4,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.05,
                    width: width * 0.6,
                    child: ElevatedButton(
                      onPressed: _signIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF6055D8),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 60.0),
                            child: Text(
                              "Sign In ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Icon(
                            Icons.navigate_next_outlined,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?  "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUp_Screen()),
                          );
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Color(0XFF6055D8)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some action to take when the user presses the action button
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _signIn() async {
    if (email.text.isEmpty || password.text.isEmpty) {
      _showSnackBar("Please fill in all fields.");
      return;
    }
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      if (userCredential.user != null) {
        print("User is successfully signed in");
        if (email.text == 'admin@gmail.com') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewProduct(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(userEmail: email.text),
            ),
          );
        }
        _showSnackBar("User is successfully signed in");
      }
    } catch (e) {
      print("Error signing in: $e");
      _showSnackBar("Error signing in: $e");
    }
  }

  Widget textfield(
    String hint,
    IconData icon,
    TextEditingController controller,
    TextInputType keyboardType, {
    IconData? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontStyle: FontStyle.italic,
        ),
        prefixIcon: Icon(icon),
        suffixIcon: (suffixIcon != null) ? Icon(suffixIcon) : null,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF6055D8)),
        ),
      ),
    );
  }
}
