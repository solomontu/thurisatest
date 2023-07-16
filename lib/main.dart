import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thurisatest/module/home_page/home_page.dart';
import 'package:thurisatest/module/splash/splash_screen.dart';

import 'config/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414.0, 897.0),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        builder: (BuildContext context, Widget? child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8.sp),
              child: MaterialApp(
                title: 'Thurisa',
                theme: customAppTheme,
                home: const HomePage()
                // SplashScreen(),
              ),
            ));
  }
}

