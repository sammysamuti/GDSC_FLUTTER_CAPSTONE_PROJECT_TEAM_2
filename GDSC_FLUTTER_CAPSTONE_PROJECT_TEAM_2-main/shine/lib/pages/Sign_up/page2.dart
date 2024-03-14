// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shine/pages/Sign_up/page3.dart';
class SignIn_Screen extends StatefulWidget {
      SignIn_Screen({super.key});

  @override
  State<SignIn_Screen> createState() => _SignIn_ScreenState();
}

class _SignIn_ScreenState extends State<SignIn_Screen> {
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  
  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
            top: height * 0.05, left: width * 0.1, right: width * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Padding(
              padding: EdgeInsets.only(bottom:10.0),
              child:  Text("Lets's sign you in",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
              "Username or Email",
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
            ),
            textfield("username", Icons.person_4_outlined, username,
                TextInputType.text,
                suffixIcon: Icons.done),
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              "Password",
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
            ),
            textfield("*********", Icons.lock_outline, password,
                TextInputType.visiblePassword,
                suffixIcon: Icons.visibility_outlined),
          
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUp_Screen()));
                    },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF6055D8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left:60.0),
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
                    ), // Add your button text here
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?  "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context)=>SignUp_Screen()));
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
      )),
    );
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
