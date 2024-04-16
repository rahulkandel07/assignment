import 'package:assignment/constants/app_colors.dart';
import 'package:assignment/constants/app_routes.dart';
import 'package:assignment/core/network/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // * Login Key
  final GlobalKey<FormState> _loginkey = GlobalKey<FormState>();

  //* Text Controllers
  final TextEditingController emailTextEditingController =
      TextEditingController();

  final TextEditingController passwordTextController = TextEditingController();

  sendToProfileIfLogin() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    if (firebaseAuth.currentUser != null) {
      Navigator.of(context).popAndPushNamed(AppRoutes.profileScreen);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance
        .addPostFrameCallback((_) => sendToProfileIfLogin());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50.h,
              color: Colors.green,
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.h, left: 24.w, right: 24.w),
              child: Form(
                key: _loginkey,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Login",
                        style: kIsWeb
                            ? Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(fontWeight: FontWeight.w700)
                            : Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    20.verticalSpace,
                    TextFormField(
                      controller: emailTextEditingController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter email address";
                        } else if (!value.contains('@')) {
                          return "Please provide the valid email address";
                        } else {
                          return null;
                        }
                      },
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
                          "Email Address",
                          style: GoogleFonts.roboto(
                            fontSize: kIsWeb ? 5.sp : 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    TextFormField(
                      controller: passwordTextController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        } else {
                          return null;
                        }
                      },
                      obscureText: true,
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
                          "Password",
                          style: GoogleFonts.roboto(
                            fontSize: kIsWeb ? 5.sp : 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
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
                        _loginkey.currentState!.save();
                        if (!_loginkey.currentState!.validate()) {
                          return;
                        }
                        Auth().loginUser(
                            email: emailTextEditingController.text,
                            password: passwordTextController.text);
                      },
                      child: const Text(
                        "Login",
                      ),
                    ),
                    20.verticalSpace,
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.registerScreen),
                      child: RichText(
                        text: TextSpan(
                            text: "Don't have any account? ",
                            style: GoogleFonts.roboto(
                              fontSize: kIsWeb ? 5.sp : 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: "Register",
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
