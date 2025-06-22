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

Widget appTextField({
  String hintText = '',
  String headerText = '',
  Color borderColor = AppColors.primaryFourElementText,
  required IconData iconName,
  required TextEditingController controller,
  bool obscure = false,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTextNormal(headerText),
        SizedBox(height: 5.h),
        Container(
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.primaryBackground,
          ),
          child: TextField(
            onChanged: (value) {},
            autocorrect: false,
            maxLines: 1,
            obscureText: obscure,
            controller: controller,
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
    ),
  );
}
