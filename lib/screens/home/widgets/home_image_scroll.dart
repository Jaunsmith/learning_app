import 'package:flutter/material.dart';
import 'package:learning_app/widgets/app_image_design.dart';

class HomeImageScroll extends StatelessWidget {
  const HomeImageScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: 6,
      itemBuilder: (context, int index) {
        return AppImageDesign();
      },
    );
  }
}
