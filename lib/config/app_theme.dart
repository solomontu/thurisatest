import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData customAppTheme = ThemeData(
  scaffoldBackgroundColor: AppTheme.antiFlashWhite,
  fontFamily: "Segoe UI",
  primaryColor: AppTheme.primaryColor,

  iconTheme: const IconThemeData(
    size: 22,
    color: AppTheme.black,
  ),

  // canvasColor: Colors.transparent
);