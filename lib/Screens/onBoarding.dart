import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leuze/Screens/signInScreen.dart';
import 'package:leuze/Screens/signUpScreen.dart';
import 'package:leuze/Widgets/reusable_widgets.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
            opacity: 5,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 200.h,
            ),
            logo2(250.w),
            SizedBox(
              height: 100.h,
            ),
            Column(
              children: [
                Text(
                  'We Provide The Best Electronic Products From Great Brands',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                spacerH20(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Text(
                    'You will be able to find a wide selection of electronics from top brands',
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                dotIndicator(1),
              ],
            ),
            spacerH40(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const signInScreen(),
                  ),
                );
              },
              child: Container(
                width: 40.w,
                height: 45.h,
                child: Icon(Icons.arrow_forward, color: Colors.black),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
