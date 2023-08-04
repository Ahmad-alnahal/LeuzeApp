import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leuze/Screens/OffersScreen.dart';
import 'package:leuze/Widgets/offerItem.dart';
import 'package:leuze/generated/assets.dart';

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

Widget searchIcon(Color color) {
  return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        Icons.search,
        color: color,
        size: 27,
      ));
}

Container reusableTextField(BuildContext context, String text, IconData icon,
    bool isPassword, TextEditingController controller,
    {double? width}) {
  return Container(
    height: 50.h,
    width: width == null ? (MediaQuery.of(context).size.width) : width,
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
          ),*/
          hintText: text,
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.black12.withOpacity(0.05),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                width: 0.0,
                style: BorderStyle.none,
              ))),
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
    ),
  );
}

hideStatusBar(bool value) {
  if (value == true) {
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

Row DotDivider() {
  return Row(
    children: List.generate(
        400 ~/ 10,
        (index) => Expanded(
              child: Container(
                color: index % 2 == 0 ? Colors.transparent : Colors.black12,
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
          height: 8.h,
          width: index == initialPage ? 10.w * 2.5 : 10.w,
          duration: const Duration(milliseconds: 350),
        ),
      ),
    ),
  );
}

Widget Offers(BuildContext context, String title, String image) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => offersScreen(),
              ));
        },
        child: Container(
          height: 65.h,
          width: 65.w,
          margin: EdgeInsets.symmetric(horizontal: 6.h),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 55.h,
                      width: 55.w,
                      child: Image.asset(
                        image,
                        fit: BoxFit.scaleDown,
                      )),
                ],
              )),
        ),
      ),
    ],
  );
}

Widget ProductCard(BuildContext context, String image,
    {String? title,
    double? rate,
    int? rateCount,
    double? price,
    double? oldPrice,
    int? discount}) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => offerItem(
              title:
                  'Acer Aspire  Core 8 10th Gen-(8GB/512 GB SSD/Windows 10 Ho...',
              price: 5999.99,oldPrice: 6500,rate: 4.5,rateCount: 500),
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      width: 160.w,
      decoration: BoxDecoration(
          border: Border.all(
        width: 0.1,
      )),
      child: Column(children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(3.r)),
              width: 50.w,
              padding: EdgeInsets.symmetric(horizontal: 5.h),
              margin: EdgeInsets.only(right: 5, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    rate == null ? "${0.0}" : "${rate}",
                    style: TextStyle(color: Colors.white),
                  ),
                  spacerW5(),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 20,
                  )
                ],
              ),
            ),
            Spacer()
          ],
        ),
        spacerH10(),
        Image.asset(
          image,
          width: 120.w,
          height: 120.h,
          fit: BoxFit.contain,
        ),
        Text.rich(
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          TextSpan(
            text:
             title == null
            ? 'Acer Aspire 4 Core i7 8th Gen - (16GB/1 TB SSD/Windows 10 Home...'
            : title,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.w),
          child: Wrap(
            children: [
              Text(
                price == null ? '\$${00.00}' : '\$${price}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 14.sp),
              ),
              Visibility(
                  visible: oldPrice == null ? false : true,
                  child: Row(
                children: [
                  spacerW5(),
                  Text("\$${oldPrice}",
                      style: TextStyle(
                          fontSize: 11.sp,
                          decoration: TextDecoration.lineThrough)),
                  spacerW5(),
                  Visibility(
                    visible: discount == null ? false : true,
                    child: Text(
                      "${discount}% off",
                      style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.green,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              )),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Icon(
                Icons.discount,
                size: 15,
              ),
              spacerW5(),
              Text(
                'Exchange Offer & more',
                style: TextStyle(fontSize: 10.sp),
              )
            ],
          ),
        )
      ]),
    ),
  );
}

Widget ProductCard2(BuildContext context,String image,
    {String? title,
    double? rate,
    int? rateCount,
    double? price,
    double? oldPrice,
    int? discount}) {
  var a = [
    '35.56 cm (14 inch) Full HD Display  ',
    '1.50 kg  ',
    'No Optical Disk Drive  ',
    '#Recommended  ',
  ];

  return InkWell(onTap: (){Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => offerItem(
          title:
          'Acer Aspire  Core 8 10th Gen-(8GB/512 GB SSD/Windows 10 Ho...',
          price: 5999.99,oldPrice: 6500,rate: 4.5,rateCount: 500),
    ),
  );},
    child: Container(
      padding: EdgeInsets.only(left: 5, right: 5, top: 8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  width: 90.w,
                  height: 90.h,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Image.asset(image)),
              Container(
                margin: EdgeInsets.only(left: 5),
                width: 215.w,
                child: Column(
                  children: [
                    Text.rich(
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      TextSpan(
                        text: title == null
                            ? 'Acer Aspire 5 Core i5 10th Gen - (8GB/512 GB SSD/Windows 10 Ho...'
                            : title,
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.h),
                          margin: EdgeInsets.only(right: 5, top: 5),
                          color: Colors.black,
                          child: Row(
                            children: [
                              Text(
                                rate == null ? "${0.0}" : "${rate}",
                                style: TextStyle(color: Colors.white),
                              ),
                              spacerW5(),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 5, top: 5),
                            child: Text(
                                rateCount == null ? "(${0})" : "(${rateCount})"))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.w),
                      child: Row(
                        children: [
                          Text(
                            price == null ? '\$${00.00}' : '\$${price}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 15.sp),
                          ),
                          Visibility(
                              visible: oldPrice == null ? false : true,
                              child: Row(
                                children: [
                                  spacerW5(),
                                  Text("\$${oldPrice}",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough)),
                                  spacerW5(),
                                  Visibility(
                                    visible: discount == null ? false : true,
                                    child: Text(
                                      "${discount}% off",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.discount,
                            size: 15,
                          ),
                          Text(
                            "Upto \$14,850 Off on Exchange No Cost EMI",
                            style: TextStyle(fontSize: 10.sp),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 5.0, // Set your desired spacing here
              children: List.generate(a.length, (index) => wid(a[index])),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 8),
              child: Divider(
                height: 1.2,
                color: Colors.black54,
                indent: 0,
                endIndent: 0,
              ))
        ],
      ),
    ),
  );
}

Widget wid(String text) {
  return Container(
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(5.r)),
      margin: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.w),
      height: 18.h,
      child: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          Text(
            "${text}     ",
            textAlign: TextAlign.center,
          ),
        ],
      ));
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

spacerW15() {
  return const SizedBox(
    width: 15,
  );
}
