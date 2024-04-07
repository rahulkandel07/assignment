import 'package:assignment/constants/app_colors.dart';
import 'package:assignment/core/network/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GetInTouchScreen extends StatefulWidget {
  const GetInTouchScreen({super.key});

  @override
  State<GetInTouchScreen> createState() => _GetInTouchScreenState();
}

class _GetInTouchScreenState extends State<GetInTouchScreen> {
  final GlobalKey<FormState> _contactUsKey = GlobalKey<FormState>();
  // * Contact US Form Controllers
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController messageTextEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    firstNameTextEditingController.dispose();
    lastNameTextEditingController.dispose();
    emailTextEditingController.dispose();
    messageTextEditingController.dispose();
  }

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
                padding: EdgeInsets.only(top: 15.h),
                child: Text(
                  "GET IN TOUCH",
                  style: GoogleFonts.yaldevi(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 15.h, top: 5.h),
                child: Text(
                  "find out how we can help.",
                  style: GoogleFonts.yaldevi(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              15.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cooranbong Community Centre (rear of 2nd Building) Cooranbong, NSW, Australia 2265.",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      "0432 580 059",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      "Weekly community meal service.",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Every Monday 6 to 7pm.Tuggerah Lakes Community Centre1 Bay Village Dr, Bateau Bay.",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      "Cooranbong Food Bank:",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "MON 9:30am -> 12:30pm & WED 10am -> 1pm.",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      "Colongra Bay Hall",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "THUR 10am -> 11am",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      "Home Deliveries:",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Wangi, Toronto, Blue Haven, San Remo, Charmhaven, Lake Haven, Buff Point, Gwandalan, Summerland Point & Wyong.",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      "Donations",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Contact us using the form on this page.",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    24.verticalSpace,
                    Container(
                      // height: 284.h,
                      width: double.infinity,
                      padding: EdgeInsets.all(16.sp),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: Form(
                        key: _contactUsKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "NAME",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            ),
                            5.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 135.w,
                                  child: TextFormField(
                                    controller: firstNameTextEditingController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Provide First Name";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.r),
                                        ),
                                        borderSide: const BorderSide(
                                            color: AppColors.oxffA6A6A6),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.r),
                                        ),
                                        borderSide: const BorderSide(
                                            color: AppColors.oxffA6A6A6),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.r),
                                        ),
                                        borderSide: const BorderSide(
                                            color: AppColors.oxffA6A6A6),
                                      ),
                                      contentPadding: EdgeInsets.all(8.sp),
                                      label: Text(
                                        "First",
                                        style: GoogleFonts.roboto(
                                          color: AppColors.oxffA6A6A6,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // * LAst Name
                                SizedBox(
                                  width: 135.w,
                                  child: TextFormField(
                                    controller: lastNameTextEditingController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Provide Last Name";
                                      } else {
                                        return null;
                                      }
                                    },
                                    decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.r),
                                        ),
                                        borderSide: const BorderSide(
                                            color: AppColors.oxffA6A6A6),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.r),
                                        ),
                                        borderSide: const BorderSide(
                                            color: AppColors.oxffA6A6A6),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.r),
                                        ),
                                        borderSide: const BorderSide(
                                            color: AppColors.oxffA6A6A6),
                                      ),
                                      contentPadding: EdgeInsets.all(8.sp),
                                      label: Text(
                                        "Last",
                                        style: GoogleFonts.roboto(
                                          color: AppColors.oxffA6A6A6,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),

                            // * Email Address
                            10.verticalSpace,
                            Text(
                              "EMAIL",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            ),
                            5.verticalSpace,
                            TextFormField(
                              controller: emailTextEditingController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Provide Email Address";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  borderSide: const BorderSide(
                                      color: AppColors.oxffA6A6A6),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  borderSide: const BorderSide(
                                      color: AppColors.oxffA6A6A6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  borderSide: const BorderSide(
                                      color: AppColors.oxffA6A6A6),
                                ),
                                contentPadding: EdgeInsets.all(8.sp),
                              ),
                            ),

                            // * Message BOX
                            10.verticalSpace,
                            Text(
                              "MESSAGE",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            ),
                            5.verticalSpace,
                            TextFormField(
                              controller: messageTextEditingController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Provide Message";
                                } else {
                                  return null;
                                }
                              },
                              maxLines: 5,
                              minLines: 1,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  borderSide: const BorderSide(
                                      color: AppColors.oxffA6A6A6),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  borderSide: const BorderSide(
                                      color: AppColors.oxffA6A6A6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  borderSide: const BorderSide(
                                      color: AppColors.oxffA6A6A6),
                                ),
                                contentPadding: EdgeInsets.all(8.sp),
                              ),
                            ),

                            20.verticalSpace,

                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(120.w, 31.h),
                                  backgroundColor: AppColors.oxff13AF05,
                                  elevation: 4,
                                  shadowColor: Colors.black26,
                                ),
                                onPressed: () {
                                  _contactUsKey.currentState!.save();
                                  if (!_contactUsKey.currentState!.validate()) {
                                    return;
                                  }
                                  Map<String, dynamic> data = {
                                    "firstName":
                                        firstNameTextEditingController.text,
                                    "lastName":
                                        lastNameTextEditingController.text,
                                    "email": emailTextEditingController.text,
                                    "message":
                                        messageTextEditingController.text,
                                  };
                                  FirebaseDatabase().submitContactUs(data);
                                },
                                child: Text(
                                  "Submit",
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            15.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                    15.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
