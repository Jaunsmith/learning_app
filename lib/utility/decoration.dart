import 'package:flutter/material.dart';
import 'package:learning_app/utility/app_Colors.dart';

BoxDecoration decoration({
  Color decoColor = AppColors.primaryElement,
  Color borderColor = AppColors.primaryFourElementText,
  double radius = 15,
  double spreadR = 1,
  double blurR = 2,
  bool border = false,
  BorderRadiusGeometry? borderRadius,
}) {
  return BoxDecoration(
    color: decoColor,
    borderRadius: borderRadius ?? BorderRadius.circular(radius),
    border: border
        ? Border.all(color: borderColor)
        : Border.all(color: Colors.transparent),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade100,
        offset: Offset(0, 1),
        blurRadius: blurR,
        spreadRadius: spreadR,
      ),
    ],
  );
}
