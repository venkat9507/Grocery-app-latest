import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fthdaily/Sign%20In%20&%20log%20in/loginpage.dart';
import 'package:fthdaily/Sign%20In%20&%20log%20in/user%20management.dart';
import 'package:fthdaily/main.dart';
import 'package:fthdaily/profile/profile.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String mail;

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String userName;
  bool showSpinner = false;
  var formkey = GlobalKey<FormState>();
  var passwordkey = GlobalKey<FormState>();
  String name;
  bool secureText = true;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          'CREATE  ACCOUNT',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: formkey,
                          child: TextFormField(
                            validator: (String value) {
                              if (value.length < 5)
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
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: passwordkey,
                          child: TextFormField(
                            validator: (String value) {
                              if (value.length < 8)
                                return " Enter at least 4 alpha and 4 numbers";
                              else
                                return null;
                            },
                            obscureText: secureText,
                            onChanged: (value) {
                              password = value;
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
                                  icon: Icon(secureText
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.security),
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
                                mail = email;
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Edit(email: email,password: password,)));
                                setState(() {
                                  formkey.currentState.validate();
                                  passwordkey.currentState.validate();
                                });
                              },
                              minWidth: 120,
                              height: 42.0,
                              child: Text(
                                'REGISTER',
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                            child: Text(
                              'already have account login ??',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => loginPage()),
                              );
                            })
                      ],
                    ),
                  ),
                ),
                Hero(tag: 'logo',
                    child: Container(height: 150,
                  child: Image.asset("images/logo.jpg"),
                )),
              ],
            ),
          ),
        )),
      ),
    );
  }
}



