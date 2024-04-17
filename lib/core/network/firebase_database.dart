import 'dart:io';

import 'package:assignment/core/utils/toast.dart';
import 'package:assignment/features/admin/models/contact_us.dart';
import 'package:assignment/features/assistant/mode/assistant.dart';
import 'package:assignment/features/partners/models/partner.dart';
import 'package:assignment/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class FirebaseDatabase {
  final _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

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

  Future<void> acceptDonation(Map<String, dynamic> data, String id) async {
    try {
      final ref = _firebaseFirestore.collection("donation");
      await ref.doc(id).update(data);

      successToast(title: "Donation accepted successfully");
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

  Future<List<Assistant>> showAllDonation() async {
    List<Assistant> assistant = [];
    try {
      final ref = _firebaseFirestore.collection("donation");
      final results = await ref.get();
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

  // * Upload File
  Future<String> uploadPic(XFile? image) async {
    try {
      Reference reference = FirebaseStorage.instance
          .ref()
          .child('${DateTime.now().millisecondsSinceEpoch}-${image!.name}');
      File file = File(image.path);
      http.Response response = await http.get(Uri.parse(file.path));
      Uint8List fileByte = response.bodyBytes;
      UploadTask uploadTask = reference.putData(
        fileByte,
        SettableMetadata(contentType: image.mimeType),
      );
      TaskSnapshot snapshot = await uploadTask;
      String imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      return '';
    }
  }

  // * Save the image to dataBase
  Future<void> saveThePartnerLogo(XFile? image) async {
    try {
      String imageUrl = await uploadPic(image);
      if (imageUrl.isEmpty || imageUrl == '') {
        return;
      }
      Map<String, dynamic> data = {"image": imageUrl};
      await _firebaseFirestore.collection("partner").add(data);
      Navigator.of(navigatorKey.currentContext!).pop();
      successToast(title: "Partner Logo added successfully");
    } catch (e) {
      errorToast(title: e.toString());
    }
  }

  // * Fetch all the partners
  Future<List<Partner>> fetchAllPartners() async {
    List<Partner> partner = [];
    try {
      final ref = _firebaseFirestore.collection("partner");
      final results = await ref.get();
      for (var element in results.docs) {
        final assis = element.data();
        final Map<String, dynamic> d = {'id': element.id};
        assis.addEntries(d.entries);
        partner.add(Partner.fromMap(assis));
      }

      return partner;
    } catch (e) {
      errorToast(title: e.toString());
      return partner;
    }
  }

  // * Fetch all the contact us query
  Future<List<ContactUs>> fetchAllContactUsQuery() async {
    List<ContactUs> contactUs = [];
    try {
      final ref = _firebaseFirestore.collection("contact");
      final results = await ref.get();
      for (var element in results.docs) {
        final assis = element.data();
        final Map<String, dynamic> d = {'docsId': element.id};
        assis.addEntries(d.entries);
        contactUs.add(ContactUs.fromMap(assis));
      }

      return contactUs;
    } catch (e) {
      errorToast(title: e.toString());
      return contactUs;
    }
  }

  Future<void> deletePartner(String id) async {
    try {
      final ref = _firebaseFirestore.collection("partner");
      await ref.doc(id).delete();

      Navigator.of(navigatorKey.currentContext!).pop();
      successToast(title: "Partner deleted successfully");
    } catch (e) {
      errorToast(title: e.toString());
    }
  }

  Future<void> deleteContactUs(String id) async {
    try {
      final ref = _firebaseFirestore.collection("contact");
      await ref.doc(id).delete();

      Navigator.of(navigatorKey.currentContext!).pop();
      successToast(title: "Delete contact us query successfully");
    } catch (e) {
      errorToast(title: e.toString());
    }
  }
}
