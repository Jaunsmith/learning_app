import 'package:flutter/material.dart';
import 'package:learning_app/utility/app_Colors.dart';
import 'package:learning_app/widgets/text_data.dart';

AppBar appBarData(String textName) {
  return AppBar(
    automaticallyImplyLeading: true,
    title: mainTextNormal(textName, color: AppColors.primaryText),
    // the preferred size bottom to be precise set the height based on the height given and the child of the preferred used the size of the preferred height from the bottom upward
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Container(height: 1, color: Colors.grey.shade600),
    ),
  );
}
