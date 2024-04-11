import 'package:assignment/core/utils/toast.dart';
import 'package:assignment/features/assistant/mode/assistant.dart';
import 'package:assignment/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseDatabase {
  final _firebaseFirestore = FirebaseFirestore.instance;
  Future<void> submitContactUs(Map<String, dynamic> data) async {
    try {
      await _firebaseFirestore.collection("contact").add(data);
      successToast(title: "Form submitted successfully");
    } catch (e) {
      errorToast(title: e.toString());
    }
  }

  Future<void> requestDontation(Map<String, dynamic> data) async {
    try {
      await _firebaseFirestore.collection("donation").add(data);
      Navigator.of(navigatorKey.currentContext!).pop();
      successToast(title: "Donation Requested successfully");
    } catch (e) {
      errorToast(title: e.toString());
    }
  }

  Future<void> updateDonation(Map<String, dynamic> data, String id) async {
    try {
      final ref = _firebaseFirestore.collection("donation");
      await ref.doc(id).update(data);

      Navigator.of(navigatorKey.currentContext!).pop();
      successToast(title: "Donation updated successfully");
    } catch (e) {
      errorToast(title: e.toString());
    }
  }

  Future<void> deleteDonation(String id) async {
    try {
      final ref = _firebaseFirestore.collection("donation");
      await ref.doc(id).delete();

      Navigator.of(navigatorKey.currentContext!).pop();
      successToast(title: "Donation deleted successfully");
    } catch (e) {
      errorToast(title: e.toString());
    }
  }

  Future<List<Assistant>> getUserDonationList() async {
    List<Assistant> assistant = [];
    try {
      final ref = _firebaseFirestore.collection("donation");
      final results = await ref
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      for (var element in results.docs) {
        final assis = element.data();
        final Map<String, dynamic> d = {'docsId': element.id};
        assis.addEntries(d.entries);
        assistant.add(Assistant.fromMap(assis));
      }

      return assistant;
    } catch (e) {
      errorToast(title: e.toString());
      return assistant;
    }
  }
}
