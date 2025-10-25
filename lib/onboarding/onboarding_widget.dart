import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islame/utils/app_assets.dart';
import 'package:islame/utils/app_routes.dart';
import 'package:islame/utils/app_styles.dart';

import '../utils/app_colors.dart';

class OnboardingWidget extends StatefulWidget {
  OnboardingWidget({super.key});

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<PageViewModel> tabs = [
      PageViewModel(
        title: '',
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("", style: AppStyles.bold20primary),
            SizedBox(height: height * 0.02),
            Text("Welcome To Islmi App", style: AppStyles.bold24primary),
          ],
        ),
        image: Center(child: Image.asset(AppAssets.welcomScreen1)),
      ),
      PageViewModel(
        title: '',
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome To Islmi App", style: AppStyles.bold24primary),
            SizedBox(height: height * 0.02),
            Text(
              "we Are Very Excited To Have You In Our Community",
              style: AppStyles.bold24primary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        image: Center(child: Image.asset(AppAssets.welcomScreen2)),
      ),
      PageViewModel(
        title: '',
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Reading The Quran", style: AppStyles.bold24primary),
            SizedBox(height: height * 0.02),
            Text(
              "Read, and your Lord is the Most Generous",
              style: AppStyles.bold24primary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        image: Center(child: Image.asset(AppAssets.welcomScreen3)),
      ),
      PageViewModel(
        title: '',
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Bearish", style: AppStyles.bold24primary),
            SizedBox(height: height * 0.02),
            Text(
              "Praise the name of your Lord, the Most High",
              style: AppStyles.bold24primary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        image: Center(child: Image.asset(AppAssets.welcomScreen4)),
      ),
      PageViewModel(
        title: '',
        bodyWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Holy Quran Radio", style: AppStyles.bold24primary),
            SizedBox(height: height * 0.02),
            Text(
              "you can listen To The Holy Quran Radio through the application for free and easily",
              style: AppStyles.bold24primary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        image: Center(child: Image.asset(AppAssets.welcomScreen5)),
      ),
    ];

    return Scaffold(
      backgroundColor: AppColor.blackBgColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.15),
        child: AppBar(
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Image.asset(
                AppAssets.logo,
                height: height * 0.1,
                fit: BoxFit.contain,
              ),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: IntroductionScreen(
        pages: tabs,
        showNextButton: true,
        next: Text('Next', style: AppStyles.bold20primary),
        back: Text('Back', style: AppStyles.bold20primary),
        dotsFlex: 2,
        showBackButton: true,
        done: Text('Finish', style: AppStyles.bold20primary),
        dotsDecorator: DotsDecorator(
          color: Colors.grey,
          activeColor: AppColor.primaryColor,
        ),
        onDone: () {
          //todo: Navigator to login screen
          Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoteName);
        },
      ),
    );
  }
}
