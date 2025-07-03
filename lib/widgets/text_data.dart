import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/utility/app_Colors.dart';

Widget mainTextNormal(
  String textData, {
  Color color = AppColors.primaryText,
  double? fontSize,
  FontWeight fontWeight = FontWeight.normal,
  TextAlign? textAlign,
}) {
  return Text(
    textData,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize ?? 24.sp,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

Widget subTextNormal(
  String textData, {
  Color color = AppColors.primarySecondaryElementText,
}) {
  return Text(
    textData,
    textAlign: TextAlign.start,
    style: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
      color: color,
    ),
  );
}

Widget dynamicTextData(
  String textData, {
  Color color = AppColors.primaryThreeElementText,
  TextAlign textAlign = TextAlign.center,
  bool textUnderLine = false,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return Text(
    textData,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize?.sp ?? 14.sp,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color,
      decoration: textUnderLine
          ? TextDecoration.underline
          : TextDecoration.none,
      decorationColor: AppColors.primaryText,
    ),
  );
}
