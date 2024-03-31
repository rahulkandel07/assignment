import 'package:assignment/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 50.h,
              color: Colors.green,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 24.w, right: 24.w),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Update Profile",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  20.verticalSpace,
                  _customTextField(labelName: "First Name"),
                  10.verticalSpace,
                  _customTextField(labelName: "Last Name"),
                  10.verticalSpace,
                  _customTextField(labelName: "Email Address"),
                  10.verticalSpace,
                  _customTextField(labelName: "Phone Number"),
                  10.verticalSpace,
                  _customTextField(labelName: "Address"),
                  20.verticalSpace,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.oxff13AF05,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      fixedSize: Size(250.w, 20.h),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Update",
                    ),
                  ),
                  20.verticalSpace,
                  RichText(
                    text: TextSpan(
                        text: "Already have an account? ",
                        style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "Login now",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ]),
                  ),
                  20.verticalSpace,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _customTextField({required String labelName}) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: Color(0XFFF5F5F5),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: Color(0XFFF5F5F5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: Color(0XFFF5F5F5),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: Color(0XFFF5F5F5),
          ),
        ),
        fillColor: const Color(0XFFF5F5F5),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        label: Text(
          labelName,
          style: GoogleFonts.roboto(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
