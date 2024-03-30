import 'package:assignment/core/utils/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 50.h,
              color: Colors.green,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 360.w,
                height: 50.h,
                color: Colors.green,
              ),
            ),
            Positioned(
              top: 100.h,
              left: 10.w,
              child: const CircleAvatar(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.h, left: 16.w, right: 16.w),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "My Profile",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    width: 240.w,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextField(
                          labelName: "Name",
                          initialValue: "Bishal Kharel",
                        ),
                        CustomTextField(
                          labelName: "Address",
                          initialValue: "Dummy Address",
                        ),
                        CustomTextField(
                          labelName: "Email Address",
                          initialValue: "Bishal Kharel",
                        ),
                        CustomTextField(
                          labelName: "Phone Number",
                          initialValue: "Bishal Kharel",
                        ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      fixedSize: Size(250.w, 20.h),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Update",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
