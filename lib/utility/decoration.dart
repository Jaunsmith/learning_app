import 'package:flutter/material.dart';
import 'package:learning_app/utility/app_Colors.dart';

BoxDecoration decoration({
  Color color = AppColors.primaryElement,
  double radius = 15,
  double spreadR = 1,
  double blurR = 2,
}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        offset: Offset(0, 1),
        blurRadius: blurR,
        spreadRadius: spreadR,
      ),
    ],
  );
}
