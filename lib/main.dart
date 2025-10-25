import 'package:flutter/material.dart';
import 'package:islame/onboarding/onboarding_widget.dart';
import 'package:islame/providers/most_recent_provider.dart';
import 'package:islame/ui/home/home_screen.dart';
import 'package:islame/ui/home/tbs/quran/sura_details/suraDetails_screen.dart';
import 'package:islame/ui/home/tbs/quran/sura_details1/suraDetails1_screen.dart';
import 'package:islame/utils/app_routes.dart';
import 'package:islame/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboardingRouteName,
      routes: {
        AppRoutes.homeRoteName: (context) => HomeScreen(),
        AppRoutes.SuraDetailsScreen: (context) => SuraDetailsScreen(),
        AppRoutes.SuraDetailsScreen1: (context) => SuraDetailsScreen1(),
        AppRoutes.onboardingRouteName: (context) => OnboardingWidget(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
