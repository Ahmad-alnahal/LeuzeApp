import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget logo() {
  return Align(
    alignment: Alignment.center,
    child: Image.asset(
      "assets/images/logo_transparent.png",
      color: Colors.white,
      fit: BoxFit.fitWidth,
    ),
  );
}

Widget logo2(double width) {
  return Align(
    alignment: Alignment.center,
    child: Image.asset(
      "assets/images/logo_transparent.png",
      color: Colors.white,
      width: width,
      fit: BoxFit.fill,
    ),
  );
}

Widget searchIcon(BuildContext context) {
  return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 0, color: Colors.transparent)),
      child: Icon(
        Icons.search,
      ));
}

Container reusableTextField(BuildContext context, String text, IconData icon,
    bool isPassword, TextEditingController controller,{double? width}) {
  return Container(
    height: 50.h,
    width: width==null?(MediaQuery.of(context).size.width)  : width,
    child: TextField(
      controller: controller,
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      cursorColor: Colors.black,
      style: TextStyle(
        color: Colors.white.withOpacity(0.9),
      ),
      decoration: InputDecoration(
          /*prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),*/hintText: text,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.black12.withOpacity(0.05),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:
               BorderSide(width: 0.0, style: BorderStyle.none,))),
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    ),
  );
}

hideStatusBar(bool value) {
  if (value == false) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
  } else {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.bottom,
        SystemUiOverlay.top,
      ],
    );
  }
}


Row DotDivider(){
  return Row(
    children: List.generate(400~/10, (index) => Expanded(
      child: Container(
        color: index%2==0?Colors.transparent
            :Colors.black12,
        height: 1,
      ),
    )),
  );
}
Widget dotIndicator(int initialPage) {
  return SizedBox(
      width: 100,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        runSpacing: 5,
        children: List.generate(
          3,
          (index) => AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: index == initialPage
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
            height:8.h,
            width: index == initialPage
                ? 10.w * 2.5
                : 10.w,
            duration: const Duration(milliseconds: 350),
          ),
        ),
      ),

  );
}
spacerH50() {
  return const SizedBox(
    height: 50,
  );
}

spacerH40() {
  return const SizedBox(
    height: 40,
  );
}

spacerH30() {
  return const SizedBox(
    height: 30,
  );
}

spacerH20() {
  return const SizedBox(
    height: 20,
  );
}

spacerH10() {
  return const SizedBox(
    height: 10,
  );
}

spacerH5() {
  return const SizedBox(
    height: 5,
  );
}

spacerW5() {
  return const SizedBox(
    width: 5,
  );
}
spacerW10() {
  return const SizedBox(
    width: 10,
  );
}
