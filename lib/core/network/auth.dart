import 'package:assignment/constants/app_routes.dart';
import 'package:assignment/core/utils/toast.dart';
import 'package:assignment/features/auth/model/users.dart';
import 'package:assignment/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      "role": "user",
    };
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value.user != null) {
          _firebaseFirestore.collection("users").doc(value.user!.uid).set(data);
        }
      });
      Navigator.of(navigatorKey.currentContext!)
          .pushReplacementNamed(AppRoutes.profileScreen);
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
      Navigator.of(navigatorKey.currentContext!)
          .pushReplacementNamed(AppRoutes.profileScreen);
      successToast(title: "Login successfully");
    } catch (e) {
      errorToast(title: e.toString());
    }
  }

  logout() async {
    try {
      await _firebaseAuth.signOut();
      Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
        AppRoutes.exploreSouthLakeScreen,
        (route) => false,
      );
      successToast(title: "Logout successfully");
    } catch (e) {
      errorToast(title: e.toString());
    }
  }

  Future<Users?> returnUserData() async {
    try {
      CollectionReference ref = _firebaseFirestore.collection('users');

      DocumentSnapshot snapshot =
          await ref.doc(_firebaseAuth.currentUser!.uid).get();

      if (snapshot.exists) {
        final result = snapshot.data() as Map<String, dynamic>;
        return Users.fromMap(result);
      } else {
        return null;
      }
    } catch (e) {
      errorToast(title: e.toString());
    }
    return null;
  }
}
