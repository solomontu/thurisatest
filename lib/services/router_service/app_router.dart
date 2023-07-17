
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thurisatest/module/favourite/favourite.dart';
import 'package:thurisatest/module/history/history.dart';
import 'package:thurisatest/module/home_page/home_page.dart';
import 'package:thurisatest/module/person/person.dart';
import 'package:thurisatest/module/shered_widget/button_navigation_bar/scaffold_with_bottom_navigation_bar.dart';
import 'package:thurisatest/module/splash/splash_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen()),
    ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(child: child);
        },
        routes: [
          GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) => HomePage(key: state.pageKey),
            ),
          GoRoute(
              path: '/favorite',
              name: 'favorite',
              builder: (BuildContext context, state) {
                return const Favorite();
              }),
          GoRoute(
              path: '/person',
              name: 'person',
              builder: (BuildContext context, state) {
                return const Person();
              }),

          GoRoute(
              path: '/history',
              name: 'history',
              builder: (BuildContext context, state) {
                return const History();
              })

        ]),

  ],
);
