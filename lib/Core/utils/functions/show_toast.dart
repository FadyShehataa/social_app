import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String message, required Color backgroundColor}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER_LEFT,
    timeInSecForIosWeb: 2,
    backgroundColor: backgroundColor,
    textColor: Colors.white,
    fontSize: 16.0,
    webPosition: 'center',
  );
}
