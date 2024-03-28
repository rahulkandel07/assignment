import 'dart:async';

import 'package:assignment/constants/app_colors.dart';
import 'package:assignment/constants/app_images.dart';
import 'package:assignment/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to ExploreSouth lake acreen after 3sec
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.exploreSouthLakeScreen,
          (route) => false,
        );
      });
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            20.verticalSpace,
            Center(
              child: Image.asset(
                AppImages.appLogo,
              ),
            ),
            Column(
              children: [
                Text(
                  "Helping over 1.5 million people",
                  style: GoogleFonts.unna(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  "over the last 10 years!",
                  style: GoogleFonts.unna(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Container(
              height: 264.h,
              decoration: BoxDecoration(
                color: AppColors.oxff11d300,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(150.r),
                  topRight: Radius.circular(150.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  infoCircleCard(
                      title: "EXPLORE\nSOUTHLAKE",
                      imageName: AppImages.explore),
                  infoCircleCard(
                      title: "REQUEEST\nFREE\nASSISSTANT",
                      imageName: AppImages.clothDonate),
                  infoCircleCard(
                      title: "DONATE\nNOW", imageName: AppImages.donate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  infoCircleCard({required String title, required String imageName}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 81.w,
          height: 81.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4.sp,
                offset: const Offset(0, 4),
              )
            ],
          ),
          alignment: Alignment.center,
          child: Image.asset(imageName),
        ),
        5.verticalSpace,
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.robotoCondensed(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
