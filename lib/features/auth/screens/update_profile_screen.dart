import 'package:assignment/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/network/auth.dart';
import '../model/users.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? phoneNumber;
  String? address;

  getUserProfileInfo() async {
    Users? users = await Auth().returnUserData();

    if (users != null) {
      setState(() {
        firstName = users.firstName;
        lastName = users.lastName;
        emailAddress = users.email;
        phoneNumber = users.phone;
        address = users.address;
      });
    }
  }

  final GlobalKey<FormState> _profileUpdateKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getUserProfileInfo();
  }

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
              child: Form(
                key: _profileUpdateKey,
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
                    _customTextField(
                      labelName: "First Name",
                      initialValue: firstName ?? "",
                    ),
                    10.verticalSpace,
                    _customTextField(
                      labelName: "Last Name",
                      initialValue: lastName ?? "",
                    ),
                    10.verticalSpace,
                    _customTextField(
                      labelName: "Email Address",
                      initialValue: emailAddress ?? "",
                    ),
                    10.verticalSpace,
                    _customTextField(
                      labelName: "Phone Number",
                      initialValue: phoneNumber ?? "",
                    ),
                    10.verticalSpace,
                    _customTextField(
                      labelName: "Address",
                      initialValue: address ?? "",
                    ),
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _customTextField({required String labelName, required String initialValue}) {
    print(initialValue);
    return TextFormField(
      initialValue: initialValue,
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
