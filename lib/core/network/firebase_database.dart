import 'package:assignment/core/utils/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
}
