import 'package:assignment/core/utils/toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  registerUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String address,
      required String phone}) async {
    Map<String, dynamic> data = {
      "first": firstName,
      "last": lastName,
      "email": email,
      "address": address,
      "phone": phone,
    };
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value.user != null) {
          _firebaseFirestore.collection("users").doc(value.user!.uid).set(data);
        }
      });

      successToast(title: "Register successfully");
    } catch (e) {
      errorToast(title: e.toString());
    }
  }

  loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      successToast(title: "Login successfully");
    } catch (e) {
      errorToast(title: e.toString());
    }
  }
}
