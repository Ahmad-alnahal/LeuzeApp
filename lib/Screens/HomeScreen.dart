import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leuze/Providers/MyProvider.dart';
import 'package:leuze/Widgets/reusable_widgets.dart';
import 'package:leuze/generated/assets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var images = [
    Assets.imagesLaptopIcon,
    Assets.imagesSnapshotIcon,
    Assets.imagesSoundIcon,
    Assets.imagesPhoneIcon,
    Assets.imagesControlCamera,
  ];
  var laptops = [
    Assets.imagesLaptop1,
    Assets.imagesLaptop2,
    Assets.imagesLaptop3,
    Assets.imagesLaptop4,
    Assets.imagesLaptop1,
    Assets.imagesLaptop2,
    Assets.imagesLaptop3,
    Assets.imagesLaptop4,
  ];

  @override
  Widget build(BuildContext context) {
    hideStatusBar(true);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
        spacerW10(),
        Image.asset(Assets.imagesLogoTransparent, width: 120.w),
        Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              size: 35,
              color: Colors.black,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 35,
              color: Colors.black,
            )),
        spacerW10(),
      ]),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          searchBar(context),
          AdsSlider(),
          spacerH10(),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20.sp),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text('More',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17.sp)),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(images.length,
                        (index) => Offers(context, 'Laptops', images[index])),
                  ),
                ),
              ],
            ),
          ),
          spacerH10(),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Top Deals on Electronics',
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20.sp),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text('More',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17.sp)),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Wrap(
                  children: List.generate(laptops.length,
                          (index) => ProductCard(context,laptops[index],rate: 1.5,price: 1000,oldPrice: 2000)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget searchBar(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.h, vertical: 15.w),
    padding: EdgeInsets.symmetric(horizontal: 10.h),
    alignment: Alignment.center,
    height: 60,
    width: (MediaQuery.of(context).size.width - 30).w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: List.filled(
          2,
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          )),
    ),
    child: TextFormField(
      onTap: () {},
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Try search here..",
          hintStyle: TextStyle(fontSize: 14),
          suffixIcon: searchIcon(Colors.black54),
          suffixIconColor: Color(0xFFFFFFFF)),
    ),
  );
}

Widget AdsSlider() {
  return Consumer<MyProvider>(
    builder: (context, provider, x) {
      List<String> assets = [
        'assets/images/OfferAds.png',
        'assets/images/OfferAds.png',
      ];
      return SizedBox(
        height: 150.h,
        width: MediaQuery.of(context).size.width,
        child: CarouselSlider(
          items: assets
              .map((item) => Container(
                    child: Center(
                      child: Image.asset(
                        item,
                        fit: BoxFit.fill,
                        width: 1000,
                      ),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              animateToClosest: true,
              reverse: true,
              aspectRatio: 2,
              onPageChanged: (index, reason) {
                provider.setSliderIndex(index);
              }),
        ),
      );
    },
  );
}
