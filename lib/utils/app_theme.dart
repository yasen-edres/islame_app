import 'package:flutter/material.dart';
import 'package:islame/utils/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.blackBgColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColor.whiteColor,
      unselectedItemColor: AppColor.blackColor,
      showUnselectedLabels: true,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.blackBgColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
    ),
  );
}
