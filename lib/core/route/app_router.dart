import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safara_apk/presentation/home/entrypoint.dart';
import 'package:safara_apk/presentation/login/login_page.dart';
import 'package:safara_apk/presentation/login/register_page.dart';
import 'package:safara_apk/presentation/splash/splashScreen.dart';
import 'package:safara_apk/presentation/splash/splashScreentwo.dart';

final GlobalKey<NavigatorState> appRouterKey = GlobalKey<NavigatorState>();
final GoRouter _router = GoRouter(
    navigatorKey: appRouterKey,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const Splashscreen(),
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) => const Splashscreentwo(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(path: '/entry', builder: (context, state) => const Entrypoint()),
    ]);

GoRouter get appRouter => _router;
