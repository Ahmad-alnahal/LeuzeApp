import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leuze/Widgets/reusable_widgets.dart';
import 'package:leuze/generated/assets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class offerItem extends StatefulWidget {
  String title;
  double? rate;
  int? rateCount;
  double? price;
  double? oldPrice;
  int? discount;

  offerItem(
      {super.key,
      required this.title,
      this.rate,
      this.rateCount,
      this.price,
      this.oldPrice,
      this.discount});

  @override
  State<offerItem> createState() => _offerItemState();
}

class _offerItemState extends State<offerItem> {
  int activeIndex = 0;
  final controller = CarouselController();
  final urlImages = [
    Assets.imagesLaptop1,
    Assets.imagesLaptop2,
    Assets.imagesLaptop3,
    Assets.imagesLaptop4,
    Assets.imagesLaptop1,
    Assets.imagesLaptop2,
    Assets.imagesLaptop3,
    Assets.imagesLaptop4,
  ];

  List<String> texts =['5% Unlimited Cashback on Flipkart Axis Bank:Credit Card',
  'Flat X30 discount on first prepaid transaction using RuPay debit card, minimum order value...',
    '\$30 Off on first prepaid transaction using UPI. Minimum  order value 750/-'
  ];

  @override
  Widget build(BuildContext context) {
    hideStatusBar(true);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
        SizedBox(width: 8),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,size: 30,
            )),

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
      body: Column(
        children: [
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                    carouselController: controller,
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return Container(
                          color: Colors.white,
                          child: Image.asset(
                            urlImage,
                            fit: BoxFit.contain,
                            width: MediaQuery.of(context).size.width,
                            height: 220,
                          ));
                    },
                    options: CarouselOptions(
                        height: 220.h,
                        autoPlay: true,
                        enableInfiniteScroll: false,
                        autoPlayAnimationDuration: Duration(seconds: 2),
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index))),
                SizedBox(height: 12),
              ],
            ),
          ),
          buildIndicator(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text.rich(
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  TextSpan(
                    text: widget.title,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.h,
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.w),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.r)),
                      child: Row(
                        children: [
                          Text(
                            widget.rate == null ? "${0.0}" : "${widget.rate}",
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5.w),
                        child: Text(widget.rateCount == null
                            ? "(${0} Ratings)"
                            : "(${widget.rateCount} Ratings)"))
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.w),
                  child: Row(
                    children: [
                      Text(
                        widget.price == null
                            ? '\$${00.00}'
                            : '\$${widget.price}',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 23.sp),
                      ),
                      Visibility(
                          visible: widget.oldPrice == null ? false : true,
                          child: Row(
                            children: [
                              spacerW5(),
                              Text("\$${widget.oldPrice}",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough)),
                              spacerW5(),
                              Visibility(
                                visible: widget.discount == null ? false : true,
                                child: Text(
                                  "${widget.discount}% off",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          )),
                      Spacer(),
                      Container(
                        width: 25.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100.r)),
                        child: Icon(Icons.favorite_border),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1),
          Container(
            margin: EdgeInsets.only(top: 10, right: 10, left: 10),

              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available offers',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
                  ),
                  spacerH10(),
                  Wrap(children: List.generate(texts.length, (index) => Container(margin: EdgeInsets.symmetric(vertical: 10.w),
                    child: Row(
                      children: [
                        Icon(
                          Icons.discount,
                          size: 25,
                        ),
                        spacerW10(),
                        Expanded(
                          child: Text.rich(softWrap: true,maxLines: 2,overflow: TextOverflow.ellipsis,
                            TextSpan(text: texts[index]),
                            style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w500,color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  )),)
                ],
              ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: ExpandingDotsEffect(
            dotWidth: 18,
            activeDotColor: Colors.black,
            dotHeight: 9,
            expansionFactor: 2),
        activeIndex: activeIndex,
        count: urlImages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}
