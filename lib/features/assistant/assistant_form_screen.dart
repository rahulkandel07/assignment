import 'package:assignment/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AssistantFormScreen extends StatelessWidget {
  const AssistantFormScreen({super.key});

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
                      "FILL UP ASSISTANT FORM",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  20.verticalSpace,
                  _customTextField(labelName: "Number of members"),
                  10.verticalSpace,
                  _customTextField(labelName: "Select Date"),
                  10.verticalSpace,
                  _customTextField(
                      labelName: "Enter Donation request notes", maxLines: 5),
                  10.verticalSpace,
                  _customTextField(labelName: "Suburb"),
                  10.verticalSpace,
                  _customTextField(labelName: "Hampers"),
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
                      "Submit",
                    ),
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

  _customTextField({required String labelName, int? maxLines}) {
    return TextFormField(
      maxLines: maxLines,
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
