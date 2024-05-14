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
  late String firstName;
  late String lastName;
  late String emailAddress;
  late String phoneNumber;
  late String address;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  getUserProfileInfo() async {
    Users? users = await Auth().returnUserData();

    setState(() {
      firstName = users!.firstName;
      lastName = users.lastName;
      emailAddress = users.email;
      phoneNumber = users.phone;
      address = users.address;
    });
  }

  final GlobalKey<FormState> _profileUpdateKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getUserProfileInfo();
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailAddressController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
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
                      initialValue: firstName,
                      onSave: (value) {
                        firstNameController.text = value!;
                      },
                    ),
                    10.verticalSpace,
                    _customTextField(
                      labelName: "Last Name",
                      initialValue: lastName,
                      onSave: (value) {
                        lastNameController.text = value!;
                      },
                    ),
                    10.verticalSpace,
                    _customTextField(
                      labelName: "Email Address",
                      initialValue: emailAddress,
                      onSave: (value) {
                        emailAddressController.text = value!;
                      },
                    ),
                    10.verticalSpace,
                    _customTextField(
                      labelName: "Phone Number",
                      initialValue: phoneNumber,
                      onSave: (value) {
                        phoneNumberController.text = value!;
                      },
                    ),
                    10.verticalSpace,
                    _customTextField(
                      labelName: "Address",
                      initialValue: address,
                      onSave: (value) {
                        addressController.text = value!;
                      },
                    ),
                    20.verticalSpace,
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.oxff13AF05,
                        foregroundColor: Colors.white,
                        elevation: 5,
                        fixedSize: Size(250.w, 20.h),
                      ),
                      onPressed: () async {
                        if (!_profileUpdateKey.currentState!.validate()) {
                          return;
                        }
                        _profileUpdateKey.currentState!.save();

                        Map<String, dynamic> data = {
                          'first': firstNameController.text,
                          'last': lastNameController.text,
                          'email': emailAddressController.text,
                          'address': addressController.text,
                          'phone': phoneNumberController.text,
                        };

                        await Auth().updateUser(data);
                      },
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

  _customTextField({
    required String labelName,
    required String initialValue,
    void Function(String?)? onSave,
  }) {
    return TextFormField(
      initialValue: initialValue,
      onSaved: onSave,
      onTapOutside: (event) => FocusScope.of(context).requestFocus(FocusNode()),
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
