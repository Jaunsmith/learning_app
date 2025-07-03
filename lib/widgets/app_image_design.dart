import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppImageDesign extends StatelessWidget {
  const AppImageDesign({super.key, this.imagePath = 'assets/icons/photo.png'});

  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 50.w,
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(imagePath)),
      ),
    );
  }
}
