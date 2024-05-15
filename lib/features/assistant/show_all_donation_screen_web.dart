import 'dart:html' as html;
import 'dart:io';

import 'package:assignment/core/network/firebase_database.dart';
import 'package:assignment/features/assistant/mode/assistant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as excel;

class ShowAllDonationRequestWeb extends StatefulWidget {
  const ShowAllDonationRequestWeb({super.key});

  @override
  State<ShowAllDonationRequestWeb> createState() =>
      _ShowAllDonationRequestWebState();
}

class _ShowAllDonationRequestWebState extends State<ShowAllDonationRequestWeb> {
  List<Map<String, dynamic>> data = [];
  final _firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    fetchDataFromFirestore();
  }

  Future<void> fetchDataFromFirestore() async {
    var snapshot = await _firebaseFirestore.collection("donation").get();
    setState(() {
      data = snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<void> exportToExcel() async {
    // final ExcelEngine excelEngine = ExcelEngine();
    final excel.Workbook workbook = excel.Workbook();
    final excel.Worksheet sheet = workbook.worksheets[0];

    // Add headers
    sheet.getRangeByName('A1').setText('User ID');
    sheet.getRangeByName('B1').setText('Members');
    sheet.getRangeByName('C1').setText('Date');
    sheet.getRangeByName('D1').setText('Notes');
    sheet.getRangeByName('E1').setText('Subrub');
    sheet.getRangeByName('F1').setText('Hampers');
    sheet.getRangeByName('G1').setText('Status');

    // Add data rows
    for (int i = 0; i < data.length; i++) {
      final row = data[i];
      print(row.toString());
      sheet.getRangeByIndex(i + 2, 1).setText(row['userId']);
      sheet.getRangeByIndex(i + 2, 2).setText(row['members']);
      sheet.getRangeByIndex(i + 2, 3).setText(row['date']);
      sheet.getRangeByIndex(i + 2, 4).setText(row['notes']);
      sheet.getRangeByIndex(i + 2, 5).setText(row['subrub']);
      sheet.getRangeByIndex(i + 2, 6).setText(row['hampers']);
      sheet.getRangeByIndex(i + 2, 7).setText(row['status']);
    }

    // Save the Excel file
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    if (kIsWeb) {
      // Convert bytes to Blob
      final blob = html.Blob([Uint8List.fromList(bytes)],
          'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');

      // Create an object URL
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Create a link element
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "dataa.xlsx")
        ..click(); // Simulate a click to trigger the download

      // Revoke the object URL
      html.Url.revokeObjectUrl(url);
    } else {
      final String dir = (await getDownloadsDirectory())!.path;
      final String path = '$dir/dataa.xlsx';
      final File file = File(path);
      await file.writeAsBytes(bytes);

      print('Excel file saved: $path');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FilledButton.tonal(
        onPressed: exportToExcel,
        child: const Text("Export to Excel"),
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
                      "All Requests",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  20.verticalSpace,
                  FutureBuilder(
                    future: FirebaseDatabase().showAllDonation(),
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
                                            "This action is irreverssible. Once you delete this your request will be deleted."),
                                        actions: [
                                          FilledButton.tonal(
                                            onPressed: () async {
                                              FirebaseDatabase()
                                                  .deleteDonation(snapshot
                                                      .data![index].docsId!)
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Status: ${assistant.status}",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (assistant.status == "pending")
                FilledButton.tonal(
                  onPressed: () async {
                    final Assistant newAssistant = Assistant(
                        userId: assistant.userId,
                        date: assistant.date,
                        hampers: assistant.hampers,
                        members: assistant.members,
                        notes: assistant.notes,
                        subrub: assistant.subrub,
                        status: "Accepted");

                    await FirebaseDatabase()
                        .acceptDonation(newAssistant.toMap(), assistant.docsId!)
                        .whenComplete(() {
                      setState(() {});
                    });
                  },
                  child: const Text(
                    "Accept",
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
