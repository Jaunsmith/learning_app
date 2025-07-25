import 'package:flutter/material.dart';
import 'package:learning_app/screens/home/home_screen.dart';
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
    HomeScreen(),
    Center(child: Text('2')),
    Center(child: Text('3')),
    Center(child: Text('4')),
    Center(child: Text('5')),
  ];
  return screens[index];
}
