import 'dart:io';

import 'package:assignment/constants/app_colors.dart';
import 'package:assignment/core/utils/custom_text_field.dart';
import 'package:assignment/core/utils/toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/network/firebase_database.dart';

class WhatWeDoScreen extends StatefulWidget {
  const WhatWeDoScreen({super.key});

  @override
  State<WhatWeDoScreen> createState() => _WhatWeDoScreenState();
}

class _WhatWeDoScreenState extends State<WhatWeDoScreen> {
  // * Variables for the Image Seellction
  final ImagePicker picker = ImagePicker();
  XFile? image;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool? isAdmin = ModalRoute.of(context)!.settings.arguments as bool;

    return Scaffold(
      floatingActionButton: isAdmin == true
          ? IconButton.filledTonal(
              onPressed: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(builder: (context, setState) {
                      return Dialog(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            30.verticalSpace,
                            Text(
                              "Add Service",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                            20.verticalSpace,
                            if (image != null) ...[
                              kIsWeb
                                  ? Image.network(
                                      image!.path,
                                      height: 100.h,
                                      width: 100.h,
                                    )
                                  : Image.file(
                                      File(image!.path),
                                      height: 100.h,
                                      width: 100.h,
                                    ),
                              20.verticalSpace,
                            ],
                            FilledButton.tonal(
                              onPressed: () async {
                                XFile? selectedImage = await picker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  image = selectedImage;
                                });
                              },
                              child: const Text(
                                "Select Image",
                              ),
                            ),
                            20.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: CustomTextField(
                                labelName: "Title",
                                controller: _titleController,
                              ),
                            ),
                            20.verticalSpace,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: CustomTextField(
                                maxLines: 7,
                                labelName: "Message",
                                controller: _messageController,
                              ),
                            ),
                            20.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FilledButton.tonal(
                                  onPressed: () async {
                                    if (_titleController.text.isEmpty) {
                                      errorToast(
                                          title: "Please provide the title");
                                      return;
                                    }

                                    if (_messageController.text.isEmpty) {
                                      errorToast(
                                          title: "Please provide the message");
                                      return;
                                    }
                                    if (image == null) {
                                      errorToast(
                                          title: "Please select the image");
                                      return;
                                    }
                                    await FirebaseDatabase()
                                        .saveTheService(
                                            image: image,
                                            title: _titleController.text,
                                            message: _messageController.text)
                                        .whenComplete(() {
                                      setState;
                                    });
                                  },
                                  child: const Text(
                                    "Submit",
                                  ),
                                ),
                                10.horizontalSpace,
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text(
                                    "Cancel",
                                  ),
                                ),
                              ],
                            ),
                            20.verticalSpace,
                          ],
                        ),
                      );
                    });
                  },
                );
              },
              icon: Icon(
                Icons.add,
                color: Colors.grey.shade800,
              ),
            )
          : null,
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
                  "WHAT WE DO?",
                  style: GoogleFonts.yaldevi(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Wrap(
                children: [
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                  _buildCard(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildCard() {
    return Container(
      width: 150.w,
      margin: EdgeInsets.all(10.sp),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            color: Colors.black26,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 100.h,
            child: const Placeholder(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Text(
              "Parnert Of Dress for Success",
              style: GoogleFonts.robotoCondensed(
                fontSize: 10.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.oxff13AF05,
              ),
            ),
          ),
          Text(
            "We are a referral agency for pack and send. This is our way of supporting women in need of clothing for important life events.",
            textAlign: TextAlign.justify,
            style: GoogleFonts.robotoCondensed(
                fontSize: 10.sp,
                fontWeight: FontWeight.w300,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
