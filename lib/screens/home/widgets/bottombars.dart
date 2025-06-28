import 'package:flutter/material.dart';
import 'package:learning_app/utility/app_Colors.dart';

BottomNavigationBarItem bottomBars({
  required IconData icon,
  required String label,
}) {
  return BottomNavigationBarItem(
    icon: Icon(icon, color: AppColors.primaryFourElementText),
    label: label,
    backgroundColor: AppColors.primaryBackground,
    activeIcon: Icon(icon, color: AppColors.primaryElement, size: 30),
  );
}

Widget appScreens(int index) {
  List<Widget> screens = [
    Container(child: Center(child: Text('1'))),
    Container(child: Center(child: Text('2'))),
    Container(child: Center(child: Text('3'))),
    Container(child: Center(child: Text('4'))),
    Container(child: Center(child: Text('5'))),
  ];
  return screens[index];
}
