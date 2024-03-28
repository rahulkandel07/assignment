import 'package:assignment/constants/app_routes.dart';
import 'package:assignment/features/homepage/screens/explore_southlake_screen.dart';
import 'package:assignment/features/homepage/screens/what_we_do_screen.dart';
import 'package:assignment/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
          routes: {
            AppRoutes.exploreSouthLakeScreen: (ctx) => ExploreSouthlakeScreen(),
            AppRoutes.whatWeDoScreenRoute: (ctx) => const WhatWeDoScreen(),
          },
        );
      },
    );
  }
}
