import 'package:assignment/constants/app_colors.dart';
import 'package:assignment/constants/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/network/auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

  // * Register Text Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                key: _registerKey,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Register Account",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    20.verticalSpace,
                    _customTextField(
                      labelName: "First Name",
                      controller: firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please provide first name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    10.verticalSpace,
                    _customTextField(
                      labelName: "Last Name",
                      controller: lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please provide last name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    10.verticalSpace,
                    _customTextField(
                      labelName: "Email Address",
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please provide email address";
                        } else if (!value.contains("@")) {
                          return "Please provide valid email address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    10.verticalSpace,
                    _customTextField(
                      labelName: "Phone Number",
                      controller: phoneController,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please provide phone number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    10.verticalSpace,
                    _customTextField(
                      labelName: "Addess",
                      controller: addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please provide address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    10.verticalSpace,
                    _customTextField(
                      isObsecure: true,
                      labelName: "Password",
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please provide password";
                        } else if (value.length < 8) {
                          return "Password must be 8 character long";
                        } else {
                          return null;
                        }
                      },
                    ),
                    10.verticalSpace,
                    _customTextField(
                      isObsecure: true,
                      labelName: "Confirm Password",
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password";
                        } else if (value != passwordController.text) {
                          return "Password and confirm password doesn't match";
                        } else {
                          return null;
                        }
                      },
                    ),
                    20.verticalSpace,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.oxff13AF05,
                        foregroundColor: Colors.white,
                        elevation: 5,
                        fixedSize: Size(250.w, kIsWeb ? 40.h : 20.h),
                      ),
                      onPressed: () {
                        _registerKey.currentState!.save();
                        if (!_registerKey.currentState!.validate()) {
                          return;
                        }
                        Auth().registerUser(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          address: addressController.text,
                          phone: phoneController.text,
                        );
                      },
                      child: const Text(
                        "Register",
                      ),
                    ),
                    20.verticalSpace,
                    GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushNamed(AppRoutes.loginRoute),
                      child: RichText(
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

  _customTextField({
    required String labelName,
    required TextEditingController controller,
    required String? Function(String?)? validator,
    TextInputType? textInputType,
    bool isObsecure = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      obscureText: isObsecure,
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
            fontSize: kIsWeb ? 5.sp : 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
