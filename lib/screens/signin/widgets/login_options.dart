import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/utility/app_Colors.dart';
import 'package:learning_app/widgets/text_data.dart';

Widget loginOptions() {
  return Container(
    margin: EdgeInsets.only(left: 80.w, right: 80.w, top: 40.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton('assets/icons/google.png'),
        _loginButton('assets/icons/apple.png'),
        _loginButton('assets/icons/facebook.png'),
      ],
    ),
  );
}

Widget _loginButton(String imagePath) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(width: 40.w, height: 40.h, child: Image.asset(imagePath)),
  );
}

Widget mailSignIn({
  required String text,
  Color color = AppColors.primaryThreeElementText,
  bool textUnderLine = false,
}) {
  return TextButton(
    onPressed: () {},
    child: sigIn14Text(text, color: color, textUnderLine: textUnderLine),
  );
}
