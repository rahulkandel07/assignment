import 'package:assignment/core/network/firebase_database.dart';
import 'package:assignment/features/assistant/mode/assistant.dart';
import 'package:assignment/features/assistant/update_assistant_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowAssistantScreen extends StatefulWidget {
  const ShowAssistantScreen({super.key});

  @override
  State<ShowAssistantScreen> createState() => _ShowAssistantScreenState();
}

class _ShowAssistantScreenState extends State<ShowAssistantScreen> {
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
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "My Requests",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  20.verticalSpace,
                  FutureBuilder(
                    future: FirebaseDatabase().getUserDonationList(),
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
                                  onLongPress: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateAssistantScreen(
                                        assistant: snapshot.data![index],
                                      ),
                                    ),
                                  ),
                                  child: requestCardDesign(
                                    assistant: snapshot.data![index],
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
            )
          ],
        ),
      ),
    );
  }

  requestCardDesign({required Assistant assistant}) {
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
                assistant.date,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Members: ${assistant.members}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          5.verticalSpace,
          Text(assistant.notes),
          5.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subrub: ${assistant.subrub}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "Hampers: ${assistant.hampers}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          5.verticalSpace,
          Text(
            "Status: ${assistant.status}",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
