import 'package:flutter/material.dart';
import 'package:ui_9/animations/fade_animation.dart';
import 'package:ui_9/pages/sign_up_copy.dart';

class LoginCopy extends StatefulWidget {
  static String id="login_copy";
  const LoginCopy({Key? key}) : super(key: key);

  @override
  _LoginCopyState createState() => _LoginCopyState();
}

class _LoginCopyState extends State<LoginCopy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                colors: [Colors.purple.withOpacity(1),
                  Colors.pinkAccent.withOpacity(1),]
            )
        ),
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            /// #Text
            FadeAnimation(
                1,
                const Text(
                  "Instagram",
                  style: TextStyle(fontSize: 40,fontFamily: "Billabong"),
                )),
            /// #Email
            FadeAnimation(
                1.1,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  margin: const EdgeInsets.only(top: 20),
                  height: 48,
                  child: const TextField(
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                )),
            /// #Password
            FadeAnimation(
                1.2,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  margin: const EdgeInsets.only(top: 10),
                  height: 48,
                  child: const TextField(
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                )),
            /// #Log in
            FadeAnimation(
                1.3,
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 48,
                  child: MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: const Text(
                      "Log in",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )),
            const Spacer(),
            /// #Sign Up
            FadeAnimation(
                1.4,
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpCopy.id);
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}