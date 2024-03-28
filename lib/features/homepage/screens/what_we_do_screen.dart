import 'package:assignment/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WhatWeDoScreen extends StatelessWidget {
  const WhatWeDoScreen({super.key});

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
                  "WHAT WE DO?",
                  style: GoogleFonts.yaldevi(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Wrap(
                children: [
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildCard() {
    return Container(
      height: 228.h,
      width: 150.w,
      margin: EdgeInsets.all(10.sp),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            color: Colors.black26,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
            child: const Placeholder(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Text(
              "Parnert Of Dress for Success",
              style: GoogleFonts.robotoCondensed(
                fontSize: 10.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.oxff13AF05,
              ),
            ),
          ),
          Text(
            "We are a referral agency for pack and send. This is our way of supporting women in need of clothing for important life events.",
            textAlign: TextAlign.justify,
            style: GoogleFonts.robotoCondensed(
                fontSize: 10.sp,
                fontWeight: FontWeight.w300,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
