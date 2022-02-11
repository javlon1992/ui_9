import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ui_9/animations/fade_animation.dart';
import 'package:ui_9/pages/login_%20copy.dart';
import 'package:ui_9/pages/login_page.dart';
import 'package:ui_9/pages/sign_up_page.dart';

class SplashPage extends StatefulWidget {
  static String id="splash_page";
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
      Timer(const Duration(seconds: 3),(){
        Navigator.pushReplacementNamed(context, LoginPage.id);
        //Navigator.pushReplacementNamed(context, LoginCopy.id);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FadeAnimation(1, Center(
            child: Image.asset("assets/images/Insta.png",height: 80, width: 80,),
          ),),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text("From Meta"),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
