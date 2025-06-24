import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/widgets/text_data.dart';

import '../utility/app_Colors.dart';

Widget appTextField({
  String hintText = '',
  String headerText = '',
  Color borderColor = AppColors.primaryFourElementText,
  required IconData iconName,
  bool obscure = false,
  Function(String value)? function,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      subTextNormal(headerText),
      SizedBox(height: 5.h),
      Container(
        width: double.maxFinite,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.primaryBackground,
        ),
        child: TextField(
          onChanged: (value) {
            function!(value);
          },
          autocorrect: false,
          maxLines: 1,
          obscureText: obscure,
          obscuringCharacter: '*',
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(iconName),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: borderColor, // or any color you prefer
                width: 3, // thicker width when focused
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: borderColor, // or any color you prefer
                width: 1, // thicker width when focused
              ),
            ),
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    ],
  );
}
