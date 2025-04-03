import 'package:app/entry_point.dart';
import 'package:app/pages/auth/login_page.dart';
import 'package:app/pages/auth/otp_page.dart';
import 'package:app/pages/auth/user_info_page.dart';
import 'package:app/pages/chats/chats_page.dart';
import 'package:app/pages/home/home_page.dart';
import 'package:app/pages/people/people_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

final List<String> routeOrder = [Routes.groups, Routes.chats, Routes.people];

String? _previousRoute;

final appRouterProvider = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.login,
  routes: <RouteBase>[
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return EntryPoint(child: child);
      },
      routes: <RouteBase>[
        _entryPointRouter(
          path: Routes.chats,
          name: Routes.chats,
          page: const ChatsPage(),
        ),
        _entryPointRouter(
          path: Routes.groups,
          name: Routes.groups,
          page: const HomePage(),
        ),
        _entryPointRouter(
          path: Routes.people,
          name: Routes.people,
          page: const PeoplePage(),
        ),
      ],
    ),
    GoRoute(
      path: Routes.login,
      name: Routes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.otp,
      name: Routes.otp,
      builder: (context, state) => OtpPage(
        phoneNumber: state.extra as String,
      ),
    ),
    GoRoute(
      path: Routes.userInfo,
      name: Routes.userInfo,
      builder: (context, state) => UserInfoPage(),
    ),
  ],
);

class Routes {
  static const groups = '/';
  static const login = '/login';
  static const people = '/people';
  static const chats = '/chats';
  static const settings = '/settings';
  static const otp = '/otp';
  static const userInfo = '/user-info';
}

GoRoute _entryPointRouter({
  required String path,
  required String name,
  required Widget page,
}) {
  return GoRoute(
    path: path,
    name: name,
    parentNavigatorKey: _shellNavigatorKey,
    pageBuilder: (context, state) {
      int currentIndex = routeOrder.indexOf(state.fullPath ?? Routes.groups);
      int previousIndex = routeOrder.indexOf(_previousRoute ?? Routes.groups);

      _previousRoute = state.fullPath; // Update previous route

      final beginOffset = (currentIndex > previousIndex)
          ? const Offset(1.0, 0.0) // Forward navigation (slide from right)
          : const Offset(
              -1.0,
              0.0,
            ); // Backward navigation (slide from left)

      final endOffset = Offset.zero;
      final tween = Tween(
        begin: beginOffset,
        end: endOffset,
      ).chain(CurveTween(curve: Curves.easeInOut));

      return CustomTransitionPage(
        key: state.pageKey,
        child: page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    },
  );
}
