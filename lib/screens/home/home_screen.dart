import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/screens/home/controller/notifier/home_screen_notifier.dart';
import 'package:learning_app/screens/home/widgets/home_screen_slider.dart';
import 'package:learning_app/utility/app_Colors.dart';
import 'package:learning_app/widgets/general%20file/global_file.dart';
import 'package:learning_app/widgets/search_bar.dart';
import 'package:learning_app/widgets/text_data.dart';

import '../../widgets/app_bar_data.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late PageController _controller;

  @override
  void didChangeDependencies() {
    _controller = PageController(
      initialPage: ref.watch(homeScreenSliderIndexNotifierProvider),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarData('Home Page'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: dynamicTextData(
                  'Hello',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                child: dynamicTextData(
                  GlobalFile.storageServiceController.getUserProfile().name!,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              SizedBox(height: 20.h),
              searchBar(context),
              SizedBox(height: 20.h),
              banner(ref: ref, controller: _controller),
            ],
          ),
        ),
      ),
    );
  }
}
