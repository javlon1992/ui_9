import 'package:flutter/material.dart';
import 'package:ui_9/animations/fade_animation.dart';
import 'package:ui_9/pages/home_page.dart';
import 'package:ui_9/pages/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  static String id="login_page";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _forKey = GlobalKey<FormState>();
  String? _password,_email;
  bool isHidden = true;

  _doLogIn(){
    if(_forKey.currentState!.validate()){
      _forKey.currentState!.save();
      Navigator.popAndPushNamed(context, HomePage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _forKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
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
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.2,),
                /// #Text
                const FadeAnimation(
                    1,
                    Text(
                      "Instagram",textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,fontSize: 45,fontFamily: "Billabong"),
                    )),
                SizedBox(height: 20),
                /// #Email
                FadeAnimation(
                    1.1,
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      style: TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          errorStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)
                        ),
                          labelText: "Email",
                          prefixIcon: Icon(Icons.mail_outline)),
                      validator: (input) => !input!.contains(RegExp(r"^([\w\.]+@[a-z]+\.[a-z]+)$")) ? "Email kiriting!": null,
                      onSaved: (input) => _email = input,
                    )),
                SizedBox(height: 10),
                /// #Password
                FadeAnimation(
                    1.2,
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      style: TextStyle(fontSize: 18),
                      obscureText: isHidden,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          errorStyle: TextStyle(color: Colors.white),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () { setState(() {
                              isHidden = !isHidden;
                            }); },
                            icon: Icon(isHidden ? Icons.visibility : Icons.visibility_off),)
                      ),
                      validator: (input) => (input!.length < 6) ? "Password kiriting!": null,
                      onSaved: (input) => _password = input,
                    )),
                /// #Log in
                FadeAnimation(
                    1.3,
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      width: double.infinity,
                      height: 48,
                      child: MaterialButton(
                        onPressed: _doLogIn,
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
                Spacer(),
                /// #Sign Up
                FadeAnimation(
                    1.4,
                    Container(
                      margin: const EdgeInsets.only(top: 10),
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
                              Navigator.pushNamed(context, SignUpPage.id);
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
        ),
      ),
    );
  }
}
