import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/widgets/text_data.dart';

import '../utility/app_Colors.dart';

class AppTextFieldData extends StatefulWidget {
  const AppTextFieldData({
    super.key,
    this.headerText,
    this.function,
    this.isPassword = false,
    this.hintText,
    required this.iconName,
    this.borderColor = AppColors.primaryFourElementText,
  });

  final String? headerText;
  final Function(String value)? function;
  final bool isPassword;
  final String? hintText;
  final IconData iconName;
  final Color borderColor;

  @override
  State<AppTextFieldData> createState() => _AppTextFieldDataState();
}

class _AppTextFieldDataState extends State<AppTextFieldData> {
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTextNormal(widget.headerText!),
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
              widget.function!(value);
            },
            autocorrect: false,
            maxLines: 1,
            obscureText: widget.isPassword ? secure : widget.isPassword,
            obscuringCharacter: '*',
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: Icon(widget.iconName),
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          secure = !secure;
                        });
                      },
                      child: (secure
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.remove_red_eye)),
                    )
                  : null,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: widget.borderColor, // or any color you prefer
                  width: 3, // thicker width when focused
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: widget.borderColor, // or any color you prefer
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
}
