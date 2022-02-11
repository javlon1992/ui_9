import 'package:flutter/material.dart';
import 'package:ui_9/pages/home_page.dart';
import 'package:ui_9/pages/local_page.dart';
import 'package:ui_9/pages/login_%20copy.dart';
import 'package:ui_9/pages/login_page.dart';
import 'package:ui_9/pages/sign_up_copy.dart';
import 'package:ui_9/pages/sign_up_page.dart';
import 'package:ui_9/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Amazon",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          color: Colors.blue,
          centerTitle: true,
          titleTextStyle: TextStyle(fontFamily: "Billabong",color: Colors.white,fontSize: 30),
        ),
      ),
      home: LocalPage(),
      routes: {
        LoginCopy.id: (context)=>const LoginCopy(),
        SignUpCopy.id: (context)=>const SignUpCopy(),
        LoginPage.id: (context)=>const LoginPage(),
        SignUpPage.id: (context)=>const SignUpPage(),
        SplashPage.id: (context)=>const SplashPage(),
        HomePage.id: (context)=>const HomePage(),
      },
    );
  }
}


