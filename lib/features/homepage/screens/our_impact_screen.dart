import 'package:assignment/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OurImpactScreen extends StatelessWidget {
  const OurImpactScreen({super.key});

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
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Text(
                  "OUR IMPACT",
                  style: GoogleFonts.yaldevi(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              _buildImpactCard(
                  shadowColor: AppColors.oxff9747FF,
                  title: "1 Million",
                  subTitle: "People fed over 10 years"),
              40.verticalSpace,
              _buildImpactCard(
                  shadowColor: AppColors.oxffFFBF3F,
                  title: "450,000+",
                  subTitle: "Tonnes of rescued food"),
              40.verticalSpace,
              _buildImpactCard(
                  shadowColor: AppColors.oxff13AF05,
                  title: "60,000+",
                  subTitle: "Free Haircut"),
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
      height: 154.h,
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
            style: GoogleFonts.robotoCondensed(
              fontSize: 40.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          10.verticalSpace,
          Text(
            subTitle,
            style: GoogleFonts.robotoCondensed(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
