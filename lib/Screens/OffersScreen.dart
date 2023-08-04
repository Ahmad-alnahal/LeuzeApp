// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:leuze/Providers/MyProvider.dart';
import 'package:leuze/generated/assets.dart';
import 'package:provider/provider.dart';

import '../Widgets/reusable_widgets.dart';

class offersScreen extends StatefulWidget {
  offersScreen({super.key});

  @override
  State<offersScreen> createState() => _OffersScreenState();


}

class _OffersScreenState extends State<offersScreen> {
  final List<String> laptops = [
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
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
          Align(alignment:Alignment.center,child: Text("Laptops",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.w900),)),
          Spacer(),
          searchIcon(Colors.black),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Colors.black,))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer<MyProvider>(builder: (context, provider, x) {
            return Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5,
                            style: BorderStyle.solid,
                            color: Colors.black45)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.w),
                    child: InkWell(onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.hide_image_outlined),
                          spacerW10(),
                          Text("Compare"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5,
                            style: BorderStyle.solid,
                            color: Colors.black45)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.w),
                    child: InkWell(onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.sort), spacerW10(), Text("Sort")],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5,
                            style: BorderStyle.solid,
                            color: Colors.black45)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.w),
                    child: InkWell(onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.filter_alt),
                          spacerW10(),
                          Text("Filter")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          Expanded(
            child: ListView.builder(
                itemCount: laptops.length,
                itemBuilder: (BuildContext context, index) {
                  return ProductCard2(context,laptops[index],price: 2000,discount: 50,oldPrice: 4000,rate: 5.0,rateCount: 500);
                }),
          ),
        ],
      ),
    );
  }
}
