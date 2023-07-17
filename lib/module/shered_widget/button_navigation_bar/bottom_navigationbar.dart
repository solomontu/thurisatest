import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thurisatest/config/app_colors.dart';
import 'package:thurisatest/shared_logic/shell_router_logic.dart';
import 'package:thurisatest/shared_values/app_constants.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final shellLogic = ShellLogic();
  int selectedTab = AppConstants.zero;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppTheme.antiFlashWhite,
        iconSize: 25.h,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.ogreOdorGrade7,
        unselectedItemColor: AppTheme.silverChalice,
        currentIndex: selectedTab,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          shellLogic.bottomNavigatorLogic(index, context);
          selectedTab = index;
          setState(() {});
        },
        items: AppConstants.bottomNavigationItems);
  }
}
