import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thurisatest/constants/asset_constants.dart';
import 'package:thurisatest/constants/string_constants.dart';

import '../../constants/app_constants.dart';
import '../../theme/app_colors.dart';
import '../product/widgets/product_cardBuilder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppTheme.antiFlashWhite,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 54.w, right: 54.w, top: 74.h, bottom: 43.4.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        radius: 15.w,
                        onTap: () {},
                        child: SvgPicture.asset(AssetConstants.vectorMenu)),
                    InkWell(
                        radius: 15.w,
                        onTap: () {},
                        child: SvgPicture.asset(
                            AssetConstants.cartCart)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 54.0.w, bottom: 50.h),
                child: Text(
                  AppString.deliciousFoodForYou,
                  style: TextStyle(
                    height: 0.8.h,
                    color: AppTheme.black,
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(left: 50.0.w, right: 50.0.w, bottom: 46.h),
                child: const SearchField(),
              ),
              const CategoriesTabBar()

              // Padding(padding: EdgeInsets.only())
            ],
          ),
        ));
  }
}

class CategoriesTabBar extends StatelessWidget {
  const CategoriesTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppConstants.tabBarList.length,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
              isScrollable: true,
              unselectedLabelColor: AppTheme.spanishGray,
              dividerColor: AppTheme.primaryColor,
              unselectedLabelStyle:
                  const TextStyle(color: AppTheme.spanishGray),
              indicatorColor: AppTheme.primaryColor,
              labelColor: AppTheme.primaryColor,
              tabs: AppConstants.tabBarList
                  .map((name) => Tab(
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 17.sp, fontWeight: FontWeight.w400),
                        ),
                      ))
                  .toList()),
          SizedBox(height: 78.h),
          Padding(
            padding: EdgeInsets.only(right: 30.0.w, bottom: 5.h),
            child: const Align(
              alignment: Alignment.bottomRight,
              child: Text(AppString.seeMore,
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14)),
            ),
          ),
          SizedBox(
              height: 312.h,
              child: const TabBarView(children: [
                ProductSBuilder(),
                OtherTabs(),
                OtherTabs(),
                OtherTabs(),
                OtherTabs(),
                OtherTabs(),
              ]))
        ],
      ),
    );
  }
}

class OtherTabs extends StatelessWidget {
  const OtherTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 312.h,
      width: 220.w,
      child: const Scaffold(
          body: Center(
        child: Text(AppString.workInProgress),
      )),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
      alignment: Alignment.centerLeft,
      height: 60.h,
      decoration: BoxDecoration(
          color: AppTheme.brightGray,
          borderRadius: BorderRadius.circular(30.0)),
      child: TextField(
        decoration: InputDecoration(
          icon: Padding(
            padding: EdgeInsets.only(left: 40.w),
            child: SvgPicture.asset(AssetConstants.seeMore),
          ),
          hintText: AppString.search,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
