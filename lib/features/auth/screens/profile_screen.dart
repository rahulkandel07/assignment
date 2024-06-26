import 'package:assignment/constants/app_routes.dart';
import 'package:assignment/core/utils/custom_text_field.dart';
import 'package:assignment/features/auth/model/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/network/auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Users? user;

  getUserProfileInfo() async {
    Users? users = await Auth().returnUserData();

    if (users != null) {
      setState(() {
        user = users;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUserProfileInfo();
  }

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextField(
                          labelName: "Name",
                          controller: TextEditingController(
                              text: user == null
                                  ? ""
                                  : "${user!.firstName} ${user!.lastName}"),
                        ),
                        CustomTextField(
                          labelName: "Address",
                          controller: TextEditingController(
                              text: user == null ? "" : user!.address),
                        ),
                        CustomTextField(
                          labelName: "Email Address",
                          controller: TextEditingController(
                              text: user == null ? "" : user!.email),
                        ),
                        CustomTextField(
                          labelName: "Phone Number",
                          controller: TextEditingController(
                              text: user == null ? "" : user!.phone),
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
                    onPressed: () async {
                      await Navigator.of(context)
                          .pushNamed(AppRoutes.updateProfileScreen)
                          .then((value) {
                        setState(() {});
                      });
                    },
                    child: const Text(
                      "Update",
                    ),
                  ),
                  if (user != null && user!.role == "admin") ...[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        fixedSize: Size(250.w, 20.h),
                      ),
                      onPressed: () => Navigator.of(context)
                          .pushNamed(AppRoutes.showAllDonationRequest),
                      child: const Text(
                        "View All Requests",
                      ),
                    ),
                    10.verticalSpace,
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.green,
                    //     foregroundColor: Colors.white,
                    //     fixedSize: Size(250.w, 20.h),
                    //   ),
                    //   onPressed: () => Navigator.of(context)
                    //       .pushNamed(AppRoutes.qrScannerPage),
                    //   child: const Text(
                    //     "Scan QR",
                    //   ),
                    // ),
                    // 10.verticalSpace,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        fixedSize: Size(250.w, 20.h),
                      ),
                      onPressed: () => Navigator.of(context)
                          .pushNamed(AppRoutes.showAllPartner),
                      child: const Text(
                        "Partners",
                      ),
                    ),
                    // 10.verticalSpace,
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.green,
                    //     foregroundColor: Colors.white,
                    //     fixedSize: Size(250.w, 20.h),
                    //   ),
                    //   onPressed: () => Navigator.of(context).pushNamed(
                    //       AppRoutes.whatWeDoScreenRoute,
                    //       arguments: true),
                    //   child: const Text(
                    //     "Our work",
                    //   ),
                    // ),
                    10.verticalSpace,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        fixedSize: Size(250.w, 20.h),
                      ),
                      onPressed: () => Navigator.of(context)
                          .pushNamed(AppRoutes.contactUsQuery),
                      child: const Text(
                        "Contact Us Query",
                      ),
                    ),
                  ] else ...[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        fixedSize: Size(250.w, 20.h),
                      ),
                      onPressed: () => Navigator.of(context)
                          .pushNamed(AppRoutes.requestDonationScreen),
                      child: const Text(
                        "Request Donation",
                      ),
                    ),
                    10.verticalSpace,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        fixedSize: Size(250.w, 20.h),
                      ),
                      onPressed: () => Navigator.of(context)
                          .pushNamed(AppRoutes.myRequestScreen),
                      child: const Text(
                        "My Requests",
                      ),
                    ),
                  ],
                  10.verticalSpace,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      fixedSize: Size(250.w, 20.h),
                    ),
                    onPressed: () => Auth().logout(),
                    child: const Text(
                      "Logout",
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
