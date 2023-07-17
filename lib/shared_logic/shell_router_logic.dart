import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thurisatest/shared_values/app_constants.dart';

class ShellLogic {
  ShellLogic();

  void bottomNavigatorLogic(int index, BuildContext context) {
    switch (index) {
      case AppConstants.zero:
        context.goNamed('home');

        break;
      case AppConstants.one:
        context.goNamed('favorite');

        break;
      case AppConstants.two:
        context.goNamed('person');

        break;
      case AppConstants.three:
        context.goNamed('history');

        break;
      default:
        context.goNamed('home');
    }
  }
}
