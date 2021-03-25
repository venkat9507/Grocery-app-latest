import 'package:animated_widgets/animated_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fthdaily/main.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3,
      ),
      lowerBound: 1.0,
      upperBound: 3.0,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
          context,
         PageRouteBuilder(pageBuilder: (_,animation,__){
           return FadeTransition(opacity: animation,
           child: LoginPhone(),);
         })
        );
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TranslationAnimatedWidget(
                    enabled: true,
                    curve: Curves.bounceIn,
                    duration: Duration(seconds: 1),
                    values: [
                      Offset(0, 200),
                      Offset(0, -500),
                      Offset(0, 0),
                    ],
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 22,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  TranslationAnimatedWidget(
                    curve: Curves.bounceOut,
                    duration: Duration(seconds: 1),
                    values: [
                      Offset(0, 200),
                      Offset(0, 250),
                      Offset(0, 0),
                    ],
                    child: Text(
                      'TO',
                      style: TextStyle(
                          fontSize: 22,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 4.0, end: 0.0),
                curve: Curves.bounceOut,
                duration: Duration(seconds: 1),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                  child: ScaleTransition(
                    scale: _animationController,
                    child: Text(
                      'DigiMart',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(value * 500, 0.0),
                    child: child,
                  );
                },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginPhone extends StatefulWidget {
  @override
  _LoginPhoneState createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AnimatedSwitcher(
                duration: Duration(seconds: 20),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'Login');
                      },
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 1.0, end: 0.0),
                        curve: Curves.bounceOut,
                        duration: Duration(seconds: 1),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'LOGIN',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(value * 500, 0.0),
                            child: child,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'PhoneAuth');
                      },
                      child: TweenAnimationBuilder(
                        tween: Tween(begin: 5.0, end: 0.0),
                        curve: Curves.easeInOutCubic,
                        duration: Duration(seconds: 1),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.green,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'PHONE NUMBER',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        builder: (context, value, child) {
                          return Transform.translate(
                            offset: Offset(value * 500, 0.0),
                            child: child,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




