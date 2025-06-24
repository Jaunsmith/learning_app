import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/utility/app_Colors.dart';
import 'package:learning_app/utility/decoration.dart';
import 'package:learning_app/widgets/text_data.dart';

Widget appButtonWidget({
  String text = '',
  double height = 50,
  Color textColor = AppColors.primaryBackground,
  Color containerColor = AppColors.primaryElement,
  bool border = false,
  VoidCallback? function,
}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: double.maxFinite,
      height: height.h,
      decoration: decoration(decoColor: containerColor, border: border),
      child: Center(child: mainTextNormal(text, color: textColor)),
    ),
  );
}
