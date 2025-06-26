import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

//[Sting message=''] this means positional optional parameter...
Future<bool?> popUpNotification(
  String message, {
  Color bckColor = Colors.blue,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    backgroundColor: bckColor,
    fontSize: 16.sp,
    timeInSecForIosWeb: 3,
    textColor: textColor,
  );
}
