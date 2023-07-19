import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:thurisatest/constants/route_constants.dart';
import 'package:thurisatest/theme/app_colors.dart';

import '../../constants/string_constants.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppTheme.grey1,
        padding:
            EdgeInsets.only(left: 50.w, right: 50.w, top: 70.h, bottom: 25.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.goNamed(RouteConstants.home);
                },
                icon: Icon(Icons.arrow_back_ios,
                    size: 24.sp, color: AppTheme.black),
              ),
              const Spacer(),
              Text(
                AppString.cart,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              const Spacer()
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/swipes_icon.svg', height: 20.h),
              SizedBox(width: 0.8.w),
              Text(
                AppString.swipeOnAnItemToDelete,
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const CartCard(
                      item: AppString.emptySpace,
                    );
                  },
                  itemCount: 4)),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: 314.w, height: 70.h,
            // padding: EdgeInsets.symmetric(vertical: 15.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppTheme.primaryColor),
            child: Center(
              child: Text(
                AppString.completeOrder,
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class CartCard extends StatefulWidget {
  const CartCard({super.key, required this.item});

  final String item;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.item),
      background: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Container(
          width: 45.w,
          height: 45.h,
          decoration: const BoxDecoration(
              color: AppTheme.primaryColorDark, shape: BoxShape.circle),
          child: Icon(
            Icons.favorite_border,
            color: AppTheme.white,
            size: 16.w,
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          width: 45.w,
          height: 45.h,
          decoration: const BoxDecoration(
              color: AppTheme.primaryColorDark, shape: BoxShape.circle),
        )
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          width: 315.w,
          height: 102.h,
          decoration: BoxDecoration(
              color: AppTheme.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 69.w,
                height: 69.h,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.black007,
                        blurRadius: 40,
                        spreadRadius: 0,
                        offset: Offset(0, 10), // Shadow position
                      ),
                    ],
                    // image: DecorationImage(image: Image.network('').image),
                    color: Colors.black),
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Veggie tomato mix',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 188.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '#1,900',
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.primaryColor),
                        ),
                        Container(
                          width: 52.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                              color: AppTheme.primaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.add,
                                size: 18,
                                color: AppTheme.white,
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.white),
                              ),
                              const Icon(
                                Icons.remove,
                                size: 18,
                                color: AppTheme.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
