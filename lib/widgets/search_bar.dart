import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/utility/decoration.dart';
import 'package:learning_app/widgets/app_textField_data.dart';

Widget searchBar(BuildContext context) {
  return Row(
    children: [
      AppTextFieldData(
        iconName: Icons.search,
        weight: MediaQuery.of(context).size.width * 0.72,
        height: 50.h,
        hintText: 'Search your course',
      ),
      SizedBox(width: 10.h),
      Expanded(
        child: GestureDetector(
          onTap: () {},
          child: Container(
            height: 50.h,
            decoration: decoration(border: true),
            child: Center(
              child: Icon(Icons.tune_sharp, size: 40.w, color: Colors.white),
            ),
          ),
        ),
      ),
    ],
  );
}
