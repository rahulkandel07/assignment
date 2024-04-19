import 'dart:io';

import 'package:assignment/core/network/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/toast.dart';

class ShowPartnerScreen extends StatefulWidget {
  const ShowPartnerScreen({super.key});

  @override
  State<ShowPartnerScreen> createState() => _ShowPartnerScreenState();
}

class _ShowPartnerScreenState extends State<ShowPartnerScreen> {
  // * For Processing
  bool isProcessing = false;

  // * Variables for the Image Seellction
  final ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton.filledTonal(
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
                        "Upload Partner Logo",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FilledButton.tonal(
                            onPressed: () async {
                              if (image == null) {
                                errorToast(title: "Please select the image");
                                return;
                              }
                              await FirebaseDatabase()
                                  .saveThePartnerLogo(image)
                                  .whenComplete(() {
                                setState;
                              });
                            },
                            child: const Text(
                              "Upload",
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
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 50.h,
              color: Colors.green,
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 24.w, right: 24.w),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "All Partners",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  20.verticalSpace,
                  FutureBuilder(
                    future: FirebaseDatabase().fetchAllPartners(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text("Something went wrong");
                      } else if (snapshot.hasData) {
                        if (snapshot.data == null) {
                          return const Center(
                            child: Text("You have 0 partners"),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onDoubleTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text(
                                              "Are you sure want to delete?"),
                                          content: const Text(
                                              "This action is irreverssible. Once you delete this logo it will be deleted."),
                                          actions: [
                                            FilledButton.tonal(
                                              onPressed: () async {
                                                FirebaseDatabase()
                                                    .deletePartner(snapshot
                                                        .data![index].id)
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
                                    child: Image.network(
                                      snapshot.data![index].imageUrl,
                                    ),
                                  );
                                },
                                itemCount: snapshot.data!.length,
                              ),
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
                  20.verticalSpace,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
