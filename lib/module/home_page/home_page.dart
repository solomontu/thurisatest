import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thurisatest/config/app_colors.dart';
import 'package:thurisatest/shared_values/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppTheme.antiFlashWhite,
        child: SafeArea(
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
                        child: SvgPicture.asset('assets/icons/Vectormenu.svg')),
                    InkWell(
                        radius: 15.w,
                        onTap: () {},
                        child: SvgPicture.asset(
                            'assets/icons/shopping-cartcart.svg')),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 54.0.w, bottom: 50.h),
                child: Text(
                  'Delicious\nfood for you',
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
              child: Text('See more',
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14)),
            ),
          ),
          SizedBox(
              height: 312.h,
              child: TabBarView(children: [
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(5, (index) => ProductCard()),
                    )),
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

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
      child: SingleChildScrollView(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 312.h,
            width: 220.w,
            child: Stack(children: [
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: 270.h,
                    width: 220.w,
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )),
              Positioned(
                  top: 0,
                  left: 30,
                  right: 30,
                  child: Container(
                    child: Image.asset('assets/images/foodimage.png',
                        fit: BoxFit.contain),
                    height: 189.h,
                    width: 168.w,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )),
              Positioned(
                bottom: 55.0.h,
                left: 30,
                right: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Veggie tomato mix',
                      style: TextStyle(
                          overflow: TextOverflow.clip,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Text('N1,900',
                        style: TextStyle(
                            color: AppTheme.ogreOdorGrade6,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              )
              // SizedBox(height: 2.h),
            ]),
          )
        ]),
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
        child: Text('Work in progress'),
      )),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 60.h,
      decoration: BoxDecoration(
          color: AppTheme.brightGray,
          borderRadius: BorderRadius.circular(30.0)),
      child: TextField(
        decoration: InputDecoration(
          icon: Padding(
            padding: EdgeInsets.only(left: 40.w),
            child: SvgPicture.asset('assets/icons/VectorsechIcon.svg'),
          ),
          hintText: 'Search',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
