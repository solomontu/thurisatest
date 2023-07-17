import 'package:flutter/material.dart';
import 'package:thurisatest/module/shered_widget/button_navigation_bar/bottom_navigationbar.dart';

class ScaffoldWithBottomNavBar extends StatelessWidget {
  const ScaffoldWithBottomNavBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: child, bottomNavigationBar: const BottomNavigationWidget()),
    );
  }
}
