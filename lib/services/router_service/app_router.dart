import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thurisatest/models/product_model.dart';
import 'package:thurisatest/screens/cart/cart_list.dart';

import '../../components/button_navigation_bar/scaffold_with_bottom_navigation_bar.dart';
import '../../screens/product/widgets/product_detail.dart';
import '../../screens/favourite/favourite.dart';
import '../../screens/history/history.dart';
import '../../screens/home_page/home_page.dart';
import '../../screens/person/person.dart';
import '../../screens/splash/onbord_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(path: '/', builder: (context, state) => const OnboardPage()),
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
    GoRoute(
        path: '/product-detail',
        name: 'product-detail',
        builder: (context, state) {
          ProductModel productModel = state.extra as ProductModel;
          return ProductDetail(
            productModel: productModel,
          );
        }),
    GoRoute(
        path: '/cart-list',
        name: 'cart-list',
        builder: (context, state) {
          return const CartList();
        })
  ],
);
