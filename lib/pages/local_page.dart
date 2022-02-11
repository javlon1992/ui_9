import 'package:flutter/material.dart';

class LocalPage extends StatefulWidget {
  const LocalPage({Key? key}) : super(key: key);

  @override
  _LocalPageState createState() => _LocalPageState();
}

class _LocalPageState extends State<LocalPage> {
  //List<Locale> systemLocales = WidgetsBinding.instance!.window.locales;
  String systemLocales = WidgetsBinding.instance!.window.locale.toString();
  //String? isoCountryCode = systemLocales.first.languageCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        //elevation: 0,
        title: Text("AppBar"),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(image: AssetImage("assets/images/img.jpg"))
          // ),
          child: Center(child: Text("${systemLocales}",style: TextStyle(color: Colors.white,fontSize: 30),),)),
    );
  }
}
