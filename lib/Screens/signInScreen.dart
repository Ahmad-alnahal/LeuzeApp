import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leuze/Screens/HomeScreen.dart';
import 'package:leuze/Screens/signUpScreen.dart';
import 'package:leuze/Widgets/reusable_widgets.dart';

class signInScreen extends StatefulWidget {
  const signInScreen({super.key});

  @override
  State<signInScreen> createState() => _signInScreenState();
}

class _signInScreenState extends State<signInScreen> {
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    hideStatusBar(false);
    return Scaffold(
        resizeToAvoidBottomInset :false,
        backgroundColor: Colors.transparent,
        body:   Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
            opacity: 5),
      ),
      child:Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,mainAxisSize: MainAxisSize.max,
            children: [
        SizedBox(
          height: 100.h,
        ),
        logo2(200.w),
        spacerH20(),
        Container(
          height: 500.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.r),
                topLeft: Radius.circular(30.r),
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  spacerH40(),
                  Text("Log in to your account",
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 22.sp)),
                  spacerH10(),
                  Row(
                    children: [
                      Text(
                        softWrap: true,
                        maxLines: 2,
                        "Please provide your Email ID to\nlogin/ sign up before you place the order",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                  spacerH20(),
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
                              "SIGN IN",
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
                  spacerH10(),
                  Center(
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Reset Password',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 14.sp),
                          ))),
                  spacerH50(),
                  DotDivider(),
                  spacerH20(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const signUpScreen()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white60),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: AlignmentDirectional.center,
                      height: 50.h,
                      child: Text(
                        'Create An Account',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
