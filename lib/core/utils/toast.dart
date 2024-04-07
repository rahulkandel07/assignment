import 'package:assignment/main.dart';
import 'package:flutter/material.dart';

successToast({required String title}) {
  return ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(title),
      backgroundColor: Colors.green,
    ),
  );
}

errorToast({required String title}) {
  return ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      content: Text(title),
      backgroundColor: Colors.red,
    ),
  );
}
