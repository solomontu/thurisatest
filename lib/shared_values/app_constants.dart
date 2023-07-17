import 'package:flutter/material.dart';

class AppConstants {
  AppConstants();

  static const int zero = 0;
  static const int one = 1;
  static const int two = 2;
  static const int three = 3;
  static const int four = 4;

  static const List<String> tabBarList = <String>[
    'Foods',
    'Drinks',
    'Snacks',
    'Source',
    'Pizza',
    'Cake',
  ];

  static const List<BottomNavigationBarItem> bottomNavigationItems =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        label: 'home',
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(
          Icons.home,
        )),
    BottomNavigationBarItem(
      label: 'favorite',
      icon: Icon(Icons.favorite_border),
      activeIcon: Icon(Icons.favorite),
    ),
    BottomNavigationBarItem(
        label: 'person',
        icon: Icon(Icons.person_4_outlined),
        activeIcon: Icon(Icons.person)),
    BottomNavigationBarItem(
      label: 'history',
      icon: Icon(
        Icons.history,
      ),
      activeIcon: Icon(Icons.history_outlined),
    ),
  ];
}
