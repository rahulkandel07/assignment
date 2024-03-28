import 'package:assignment/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HowCanYouHelpScreen extends StatelessWidget {
  const HowCanYouHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50.h,
                color: AppColors.oxff13AF05,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Text(
                  "WHAT CAN YOU HELP",
                  style: GoogleFonts.yaldevi(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15.h, top: 5.h),
                child: Text(
                  "This ${DateTime.now().month}?",
                  style: GoogleFonts.yaldevi(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              40.verticalSpace,
              _buildImpactCard(
                  shadowColor: AppColors.oxff13AF05,
                  title: "Back to school Backpacks",
                  subTitle:
                      "We collect Back to School Backpacks for local families that are struggling to purchase everything for their kids new school year."),
            ],
          ),
        ),
      ),
    );
  }

  _buildImpactCard(
      {required Color shadowColor,
      required String title,
      required String subTitle}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            offset: const Offset(0, 4),
            blurRadius: 4,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoCondensed(
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.oxff13AF05,
            ),
          ),
          10.verticalSpace,
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoCondensed(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
