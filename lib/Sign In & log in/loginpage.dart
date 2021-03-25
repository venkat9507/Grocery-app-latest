import 'dart:ui';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:animated_widgets/core/chain_tweens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fthdaily/Sign%20In%20&%20log%20in/registerscreen.dart';
import 'package:fthdaily/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
String mail;

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> with SingleTickerProviderStateMixin{
  final _firestore = Firestore.instance;
  String email;
  String password;
  bool secureText = true;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  AnimationController _controller;
  var formkey =GlobalKey<FormState>();
  var passwordkey =GlobalKey<FormState>();
  String name;
bool _display = false;


  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: SafeArea(
        child: Scaffold(
          key: scaffoldkey,
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OpacityAnimatedWidget.tween(
                      opacityEnabled: 1,
                      opacityDisabled: 0,
                      enabled: _display,
                      child: Container(
                        height: 200,
                        width: 200,
                        child: FlutterLogo(
                          style: FlutterLogoStyle.stacked,
                        ),
                      )
                    ),
                    Text(
                      'DigiMart',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'WELCOME',
                      style: GoogleFonts.lato(fontSize: 20,fontWeight:FontWeight.w900,color: Colors.black
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formkey,
                      child: TextFormField(
                        validator: (String value){
                          if(value.length < 5)
                            return " Enter at least 8 character from your email";
                          else
                            return null;
                        },
                        controller: nameController,
                        onChanged: (value) {
                          email = value;
                        },

                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(32),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(32),
                              ),
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Color(0xFF87837e),
                            ),
                            suffixIcon: Icon(Icons.email_rounded),
                            hoverColor: Colors.yellow,
                            filled: true,
                            focusColor: Colors.yellow),
                        style: GoogleFonts.lato(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Form(key: passwordkey,
                      child: TextFormField(
                        validator: (String value){
                          if(value.length < 8)
                            return " Enter at least 8 character from your password";
                          else
                            return null;
                        },
                        obscureText: secureText,
                        onChanged: (value){
                        password =value;
                      },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(32),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(32),
                              ),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Color(0xFF87837e),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon( secureText ? Icons.remove_red_eye_outlined : Icons.security),
                              onPressed: () {
                                setState(() {
                                  secureText = !secureText;
                                });

                              },
                              color: Colors.lightGreenAccent,
                            ),
                            hoverColor: Colors.yellow,
                            filled: true,
                            focusColor: Colors.yellow),
                        style: GoogleFonts.lato(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                        elevation: 5.0,
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(30.0),
                        child: MaterialButton(
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              final user = await _auth
                                  .signInWithEmailAndPassword(
                                      email: email, password: password)
                                  .then((FirebaseUser) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()),
                                );
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(' deleted'),
                                ));
                              }).catchError((e) {
                                print(e);
                                var snackbar = SnackBar(
                                    content: Text(
                                        'User name and password is incorrect please check the user name and password....'));
                                scaffoldkey.currentState.showSnackBar(snackbar);
                              });
                              mail = email; //Go to login screen.

                              setState(() {
                                showSpinner = false;
                                formkey.currentState.validate();
                                passwordkey.currentState.validate();
                              });
                            } catch (e) {
                              print(e);
                            }
                          },
                          minWidth: 100,
                          height: 42.0,
                          child: Text(
                            'Log In',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationScreen()),
                            );
                          });
                        },
                        child: Text(
                          "Don't have an account? Register now",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}





