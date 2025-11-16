import 'package:ecommerce_app/features/likes/likes.dart';
import 'package:ecommerce_app/features/more/view/more_screen.dart';
import 'package:ecommerce_app/features/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/cart/view/view.dart';
import '../features/main/view/view.dart';
import '../features/search/view/view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _shellNavigatorMainKey = GlobalKey<NavigatorState>(
  debugLabel: "shellMain",
);
final _shellNavigatorSearchKey = GlobalKey<NavigatorState>(
  debugLabel: "shellSearch",
);
final _shellNavigatorCartKey = GlobalKey<NavigatorState>(
  debugLabel: "shellCart",
);
final _shellNavigatorLikesKey = GlobalKey<NavigatorState>(
  debugLabel: "shellLikes",
);
final _shellNavigatorMoreKey = GlobalKey<NavigatorState>(
  debugLabel: "shellMore",
);

class AppRoutes {
  static const String mainScreen = "/main";
  static const String searchScreen = "/search";
  static const String cartScreen = "/cart";
  static const String likesScreen = "/likes";
  static const String moreScreen = "/more";
}

final myRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.mainScreen,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldWithNestedNav(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMainKey,
          routes: [
            GoRoute(
              path: AppRoutes.mainScreen,
              builder: (context, state) => MainScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSearchKey,
          routes: [
            GoRoute(
              path: AppRoutes.searchScreen,
              builder: (context, state) => SearchScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCartKey,
          routes: [
            GoRoute(
              path: AppRoutes.cartScreen,
              builder: (context, state) => CartScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorLikesKey,
          routes: [
            GoRoute(
              path: AppRoutes.likesScreen,
              builder: (context, state) => LikesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMoreKey,
          routes: [
            GoRoute(
              path: AppRoutes.moreScreen,
              builder: (context, state) => MoreScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
