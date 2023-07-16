import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thurisatest/config/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppTheme.ogreOdorGrade1,
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(49.w, 56.h, 0.w, 40.h),
                      child: Container(
                        height: 73.h,
                        width: 73.w,
                        decoration: const BoxDecoration(
                            color: AppTheme.white, shape: BoxShape.circle),
                        child: Image.asset('assets/images/Group 3chef.png',
                            fit: BoxFit.contain),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 49.0.w),
                    child: Text(
                      'Food for\nEveryone',
                      style: TextStyle(
                        height: 0.8.h,
                        color: AppTheme.white,
                        fontSize: 65.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                top: 366.34.h,
                left: 0.w,
                child: Image.asset(
                    'assets/images/ToyFaces_Tansparent_BG_49female.png'),
              ),
              Positioned(
                top: 441.46.h,
                right: 0.w,
                child: Image.asset(
                  'assets/images/ToyFaces_Tansparent_BG_29male.png',
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 247.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.ogreOdorGrade2,
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset:
                              Offset(0, -3), // changes x,y position of shadow
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 245.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.ogreOdorGrade2,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset:
                                Offset(0, -3), // changes x,y position of shadow
                          ),
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              AppTheme.ogreOdorGrade4,
                              AppTheme.ogreOdorGrade3,
                              AppTheme.ogreOdorGrade2,
                              AppTheme.ogreOdorGrade3,
                            ])),
                  )),
              Positioned(
                top: 780.h,
                left: 51.w,
                right: 51.w,
                child: SizedBox(
                  height: 70,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: AppTheme.antiFlashWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              30), // Set the desired border radius here
                        )),
                    onPressed: () {},
                    child: Text(
                      'Get started',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17.sp,
                          color: AppTheme.ogreOdorGrade5),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
