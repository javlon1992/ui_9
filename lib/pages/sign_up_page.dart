import 'package:flutter/material.dart';
import 'package:ui_9/animations/fade_animation.dart';
import 'package:ui_9/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  static String id = "signup_page";

  const SignUpPage({Key? key}) : super(key: key);
  
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _forKey = GlobalKey<FormState>();
  String? _password, _email, _name;
  bool isHidden = true;

  _doLogIn() {
    if (_forKey.currentState!.validate()) {
      _forKey.currentState!.save();
      Navigator.popAndPushNamed(context, LoginPage.id);
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
                gradient: LinearGradient(begin: Alignment.bottomLeft, colors: [
              Colors.purple.withOpacity(1),
              Colors.pinkAccent.withOpacity(1),
            ])),
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 40),
                /// #Text
                const FadeAnimation(
                    1,
                    Text("Instagram", textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: 45, fontFamily: "Billabong"),
                    )),
                SizedBox(height: 20,),
                /// #Name
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
                              borderSide: BorderSide(color: Colors.teal)),
                          labelText: "Name",
                          prefixIcon: Icon(Icons.mail_outline)),
                      validator: (input) =>
                          !input!.contains(RegExp(r"^([A-Z a-z]+)$"))
                              ? "Login kiriting!"
                              : null,
                      onSaved: (input) => _name = input,
                    )),
                SizedBox(height: 10),
                /// #Email
                FadeAnimation(
                    1.2,
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      style: TextStyle(fontSize: 18),
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          errorStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                          labelText: "Email",
                          prefixIcon: Icon(Icons.mail_outline)),
                      validator: (input) => !input!
                              .contains(RegExp(r"^([\w\.]+@[a-z]+\.[a-z]+)$"))
                          ? "Email kiriting!"
                          : null,
                      onSaved: (input) => _email = input,
                    )),
                SizedBox(height: 10),
                /// #Password
                FadeAnimation(
                    1.3,
                    TextFormField(
                      textInputAction: TextInputAction.next,
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
                            onPressed: () {
                              setState(() {
                                isHidden = !isHidden;
                              });
                            },
                            icon: Icon(isHidden
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                      validator: (input) =>
                          (input!.length < 6) ? "Password kiriting!" : null,
                      onSaved: (input) => _password = input,
                    )),
                SizedBox(height: 10),
                /// #Confirm Password
                FadeAnimation(
                    1.4,
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
                          labelText: "Confirm Password",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isHidden = !isHidden;
                              });
                            },
                            icon: Icon(isHidden
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                      validator: (input) =>
                          (input) != _password ? "Password kiriting!" : null,
                      onSaved: (input) => _password = input,
                    )),

                /// #Sign Up
                FadeAnimation(
                    1.5,
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
                          "Sign Up",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    )),

                /// #Login in
                const Spacer(),
                FadeAnimation(
                    1.6,
                    SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(context, LoginPage.id);
                            },
                            child: const Text(
                              "Log in",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
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
