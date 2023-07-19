import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:thurisatest/constants/asset_constants.dart';
import 'package:thurisatest/constants/route_constants.dart';
import 'package:thurisatest/services/repository/product_repository.dart';


import '../../constants/string_constants.dart';
import '../../theme/app_colors.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

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
                        child: Image.asset(AssetConstants.appIcon,
                            fit: BoxFit.contain),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 49.0.w),
                    child: Text(
                     AppString.onBordText,
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
                top: 441.46.h,
                right: 30.w,
                child: Image.asset(
                  AssetConstants.toyMale,
                ),
              ),
              Positioned(
                top: 366.34.h,
                left: 30.w,
                child: Image.asset(
                    AssetConstants.toyFemale),
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
                  child: RepositoryProvider(
                      create: (context) => ProductRepository(),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: AppTheme.antiFlashWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30), // Set the desired border radius here
                          )),
                      onPressed: () {
                        context.goNamed(RouteConstants.home);
                      },
                      child: Text(
                        AppString.getStarted,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17.sp,
                            color: AppTheme.ogreOdorGrade5),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
