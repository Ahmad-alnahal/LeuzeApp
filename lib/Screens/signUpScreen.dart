import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leuze/Screens/HomeScreen.dart';
import 'package:leuze/Screens/signInScreen.dart';
import 'package:leuze/Widgets/reusable_widgets.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreen();
}

class _signUpScreen extends State<signUpScreen> {
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    hideStatusBar(true);
    return Scaffold(
        resizeToAvoidBottomInset :false,
        backgroundColor: Colors.transparent,
        body: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
            opacity: 5),
      ),
      child: Column(children: [
        SizedBox(
          height: 100.h,
        ),
        logo2(200.w),
        Spacer(),
        Container(
          height: 550.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.r),
                topLeft: Radius.circular(30.r),
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacerH40(),
                Text('Create An Account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.sp)),
                Row(
                  children: [
                    Text(
                      "Already Have An Account?",
                      style: TextStyle(color: Colors.black54, fontSize: 13.sp),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => const signInScreen()));
                        },
                        child: Text('Sign In',
                            style: TextStyle(
                                color: Colors.black87, fontSize: 13.sp)))
                  ],
                ),
                spacerH10(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    reusableTextField(context, 'First Name',
                        Icons.email_outlined, false, _emailTextController,
                        width: MediaQuery.of(context).size.width / 2.35),
                    reusableTextField(context, 'Last Name',
                        Icons.email_outlined, false, _emailTextController,
                        width: MediaQuery.of(context).size.width / 2.35),
                  ],
                ),
                spacerH10(),
                reusableTextField(context, 'Email@example.com',
                    Icons.email_outlined, false, _emailTextController),
                spacerH10(),
                reusableTextField(context, 'Password', Icons.email_outlined,
                    true, _emailTextController),
                spacerH20(),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.black),
                    ),
                    child: Container(
                      height: 50.h,
                      child: Row(
                        children: [
                          Text(
                            "SIGN UP",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 25,
                          )
                        ],
                      ),
                    )),
                spacerH30(),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By tap Sign Up button you',
                    style: TextStyle(color: Colors.black54, fontSize: 14.sp),
                    children: [
                      TextSpan(
                          text: ' accept terms and privacy',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)),
                      TextSpan(text: ' this app'),
                    ],
                  ),
                ),
                spacerH40(),
                DotDivider(),
                spacerH50(),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const signInScreen()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 30,
                          ),
                          spacerW10(),
                          Text(
                            "Back to Sign In Page",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        )
      ]),
    ));
  }
}
