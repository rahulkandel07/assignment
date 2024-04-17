import 'package:assignment/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/network/firebase_database.dart';

class OurPartnerScreen extends StatelessWidget {
  const OurPartnerScreen({super.key});

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
                  "OUR PARTNERS",
                  style: GoogleFonts.yaldevi(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              FutureBuilder(
                future: FirebaseDatabase().fetchAllPartners(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  } else if (snapshot.hasData) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text("You have 0 partners"),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              return Image.network(
                                snapshot.data![index].imageUrl,
                              );
                            },
                            itemCount: snapshot.data!.length,
                          ),
                        ),
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
