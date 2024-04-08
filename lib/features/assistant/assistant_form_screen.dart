import 'package:assignment/constants/app_colors.dart';
import 'package:assignment/core/network/firebase_database.dart';
import 'package:assignment/features/assistant/mode/assistant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AssistantFormScreen extends StatefulWidget {
  const AssistantFormScreen({super.key});

  @override
  State<AssistantFormScreen> createState() => _AssistantFormScreenState();
}

class _AssistantFormScreenState extends State<AssistantFormScreen> {
  // * Assitant Form Key
  final GlobalKey<FormState> _assistantKey = GlobalKey<FormState>();

  // * Text Editing Controllers
  final TextEditingController membersController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController subrubController = TextEditingController();
  final TextEditingController hampersController = TextEditingController();

  // * For Processing
  bool isProcessing = false;

  @override
  void dispose() {
    super.dispose();
    membersController.dispose();
    dateController.dispose();
    notesController.dispose();
    subrubController.dispose();
    hampersController.dispose();
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
                key: _assistantKey,
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
                    _customTextField(
                      labelName: "Number of members",
                      textEditingController: membersController,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please provide number of members";
                        } else {
                          return null;
                        }
                      },
                    ),
                    10.verticalSpace,
                    TextFormField(
                      controller: dateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select date";
                        } else {
                          return null;
                        }
                      },
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2050),
                        );

                        if (date != null) {
                          setState(() {
                            dateController.text =
                                "${date.year}-${date.month}-${date.day}";
                          });
                        }
                      },
                      readOnly: true,
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
                          "Select Date",
                          style: GoogleFonts.roboto(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    _customTextField(
                      labelName: "Enter Donation request notes",
                      maxLines: 5,
                      textEditingController: notesController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please provide donation request notes";
                        } else {
                          return null;
                        }
                      },
                    ),
                    10.verticalSpace,
                    _customTextField(
                      labelName: "Suburb",
                      textEditingController: subrubController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please provide suburb detail";
                        } else {
                          return null;
                        }
                      },
                    ),
                    10.verticalSpace,
                    _customTextField(
                      labelName: "Hampers",
                      textEditingController: hampersController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please provide hampers detail";
                        } else {
                          return null;
                        }
                      },
                    ),
                    20.verticalSpace,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isProcessing
                            ? Colors.green.shade400
                            : AppColors.oxff13AF05,
                        foregroundColor: Colors.white,
                        elevation: 5,
                        fixedSize: Size(250.w, 20.h),
                      ),
                      onPressed: isProcessing
                          ? null
                          : () {
                              _assistantKey.currentState!.save();
                              if (!_assistantKey.currentState!.validate()) {
                                return;
                              }
                              setState(() {
                                isProcessing = true;
                              });

                              Assistant assistant = Assistant(
                                date: dateController.text,
                                hampers: hampersController.text,
                                members: membersController.text,
                                notes: notesController.text,
                                subrub: subrubController.text,
                              );

                              FirebaseDatabase()
                                  .requestDontation(assistant.toMap())
                                  .then((value) {
                                setState(() {
                                  isProcessing = false;
                                });
                              });
                            },
                      child: const Text(
                        "Submit",
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
    int? maxLines,
    required TextEditingController textEditingController,
    TextInputType? textInputType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      maxLines: maxLines,
      controller: textEditingController,
      keyboardType: textInputType,
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
