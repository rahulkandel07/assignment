import 'package:assignment/constants/app_colors.dart';
import 'package:assignment/constants/app_images.dart';
import 'package:assignment/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreSouthlakeScreen extends StatelessWidget {
  ExploreSouthlakeScreen({super.key});

  final infoCardLists = [
    {
      "image": AppImages.personLove,
      "title": "What we do?",
      "route": AppRoutes.exploreSouthLakeScreen,
      "color": AppColors.oxff13AF05,
    },
    {
      "image": AppImages.love,
      "title": "Our Impact",
      "route": AppRoutes.exploreSouthLakeScreen,
      "color": AppColors.oxff146634,
    },
    {
      "image": AppImages.notebook,
      "title": "How can you help?",
      "route": AppRoutes.exploreSouthLakeScreen,
      "color": AppColors.oxff13AF05,
    },
    {
      "image": AppImages.persons,
      "title": "Our Partners",
      "route": AppRoutes.exploreSouthLakeScreen,
      "color": AppColors.oxff13AF05,
    },
    {
      "image": AppImages.clothDonate,
      "title": "Instagram",
      "route": AppRoutes.exploreSouthLakeScreen,
      "color": AppColors.oxff9747FF,
    },
    {
      "image": AppImages.phone,
      "title": "Contact Us",
      "route": AppRoutes.exploreSouthLakeScreen,
      "color": AppColors.oxffEECF27,
    },
    {
      "image": AppImages.dimond,
      "title": "Awards",
      "route": AppRoutes.exploreSouthLakeScreen,
      "color": AppColors.oxff38BC85,
    },
    {
      "image": AppImages.location,
      "title": "Location",
      "route": AppRoutes.exploreSouthLakeScreen,
      "color": AppColors.oxffc9c5AD,
    },
    {
      "image": AppImages.skinCare,
      "title": "Community Hair Project",
      "route": AppRoutes.exploreSouthLakeScreen,
      "color": AppColors.oxff13AF05,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // * Info Card
                _buildAboutSection(),

                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 34.h),
                  child: Text(
                    "EXPLORE SOUTHLAKE",
                    style: GoogleFonts.rosario(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 60,
                      ),
                      itemBuilder: (context, index) =>
                          _buildInfoCard(item: infoCardLists[index]),
                      itemCount: infoCardLists.length,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildAboutSection() {
    return Container(
      padding:
          EdgeInsets.only(left: 24.w, right: 24.w, top: 30.h, bottom: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        color: AppColors.oxff13AF05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 205.w,
            child: Column(
              children: [
                Text(
                  "It is hard to go to sleep when you know there is no food for your family the next day",
                  style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                10.verticalSpace,
                Text(
                  "About\nChristine (Founder) saw a need in her community in 2012. There were 2 foodbanks operating, 20 minutes north and 40 minutes south of Morisset but there was no public transport to either. We started out in a tiny little room and stayed there for 12 months, we then moved on to a change room on a sports field for 18 months.  Till we finally found our forever home at the rear of Cooranbong Community Centre.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.roboto(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                10.verticalSpace,
                Text(
                  "Read More",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(AppImages.christine),
        ],
      ),
    );
  }

  _buildInfoCard({required Map<String, dynamic> item}) {
    return Container(
      width: 83.w,
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: item["color"],
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 1,
            color: Colors.black26,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(item["image"]),
          5.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              item["title"],
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoCondensed(
                fontSize: 10.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
