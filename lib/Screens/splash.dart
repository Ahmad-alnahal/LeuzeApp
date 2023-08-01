// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:leuze/Screens/onBoarding.dart';
import 'package:leuze/Widgets/reusable_widgets.dart';
import 'package:page_transition/page_transition.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => splashState();
}

class splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const onBoarding()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,),
      ),
      child: AnimatedSplashScreen(
          backgroundColor: Colors.transparent,
          splashIconSize: 300,
          duration: 5000,
          nextScreen: onBoarding(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          splash: logo()),
    ));
  }
}
