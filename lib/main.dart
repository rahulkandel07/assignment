import 'package:assignment/constants/app_routes.dart';
import 'package:assignment/features/admin/screens/contact_us_query_screen.dart';
import 'package:assignment/features/assistant/assistant_form_screen.dart';
import 'package:assignment/features/assistant/show_all_donation_screen.dart';
import 'package:assignment/features/assistant/show_assistant_screen.dart';
import 'package:assignment/features/auth/screens/login_screen.dart';
import 'package:assignment/features/auth/screens/profile_screen.dart';
import 'package:assignment/features/auth/screens/register_screen.dart';
import 'package:assignment/features/auth/screens/update_profile_screen.dart';
import 'package:assignment/features/homepage/screens/explore_southlake_screen.dart';
import 'package:assignment/features/homepage/screens/get_in_touch_screen.dart';
import 'package:assignment/features/homepage/screens/how_can_you_help_screen.dart';
import 'package:assignment/features/homepage/screens/our_impact_screen.dart';
import 'package:assignment/features/homepage/screens/our_partner_screen.dart';
import 'package:assignment/features/partners/screens/show_partners_screen.dart';
import 'package:assignment/features/service/screens/what_we_do_screen.dart';
import 'package:assignment/features/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
          navigatorKey: navigatorKey,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
          ),
          home: kIsWeb ? const LoginScreen() : const SplashScreen(),
          routes: {
            AppRoutes.exploreSouthLakeScreen: (ctx) => ExploreSouthlakeScreen(),
            AppRoutes.whatWeDoScreenRoute: (ctx) => const WhatWeDoScreen(),
            AppRoutes.ourImpactScreenRoute: (ctx) => const OurImpactScreen(),
            AppRoutes.howCanYouHelpScreenRoute: (ctx) =>
                const HowCanYouHelpScreen(),
            AppRoutes.ourPartnerScreenRoute: (ctx) => const OurPartnerScreen(),
            AppRoutes.getInTouchScreenRoute: (ctx) => const GetInTouchScreen(),
            AppRoutes.loginRoute: (ctx) => const LoginScreen(),
            AppRoutes.registerScreen: (ctx) => const RegisterScreen(),
            AppRoutes.profileScreen: (ctx) => const ProfileScreen(),
            AppRoutes.requestDonationScreen: (ctx) =>
                const AssistantFormScreen(),
            AppRoutes.updateProfileScreen: (ctx) => const UpdateProfileScreen(),
            AppRoutes.myRequestScreen: (ctx) => const ShowAssistantScreen(),
            AppRoutes.showAllPartner: (ctx) => const ShowPartnerScreen(),
            AppRoutes.contactUsQuery: (ctx) => const ContactUsQueryScreen(),
            AppRoutes.showAllDonationRequest: (ctx) =>
                const ShowAllDonationRequest(),
          },
        );
      },
    );
  }
}
