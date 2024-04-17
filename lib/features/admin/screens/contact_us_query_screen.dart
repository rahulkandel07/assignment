import 'package:assignment/constants/app_colors.dart';
import 'package:assignment/features/admin/models/contact_us.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/network/firebase_database.dart';

class ContactUsQueryScreen extends StatefulWidget {
  const ContactUsQueryScreen({super.key});

  @override
  State<ContactUsQueryScreen> createState() => _ContactUsQueryScreenState();
}

class _ContactUsQueryScreenState extends State<ContactUsQueryScreen> {
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
                  "Contact Us Query",
                  style: GoogleFonts.yaldevi(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              FutureBuilder(
                future: FirebaseDatabase().fetchAllContactUsQuery(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  } else if (snapshot.hasData) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: Text("You have requested 0 donations"),
                      );
                    } else {
                      return SizedBox(
                        height: 500.h,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onDoubleTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text(
                                        "Are you sure want to delete?"),
                                    content: const Text(
                                        "This action is irreverssible. Once you delete this contact us query will be deleted."),
                                    actions: [
                                      FilledButton.tonal(
                                        onPressed: () async {
                                          FirebaseDatabase()
                                              .deleteContactUs(
                                                  snapshot.data![index].docsId)
                                              .whenComplete(() {
                                            setState(() {});
                                          });
                                        },
                                        child: const Text("Yes"),
                                      ),
                                      20.horizontalSpace,
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text("No"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: contactUsCard(
                                contactUs: snapshot.data![index],
                              ),
                            );
                          },
                          itemCount: snapshot.data!.length,
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

  contactUsCard({required ContactUs contactUs}) {
    return Container(
      margin: EdgeInsets.all(12.sp),
      padding: EdgeInsets.all(16.sp),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Full Name: ${contactUs.firstName} ${contactUs.lastName}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Email: ${contactUs.email}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          5.verticalSpace,
          Text(contactUs.message),
          5.verticalSpace,
        ],
      ),
    );
  }
}
