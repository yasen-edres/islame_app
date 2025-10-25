import 'package:flutter/cupertino.dart';
import 'package:islame/utils/app_assets.dart';
import 'package:islame/utils/app_colors.dart';
import 'package:islame/utils/app_styles.dart';

class AzkarItem extends StatelessWidget {
  AzkarItem({super.key, required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.primaryColor, width: 2),
      ),
      child: Column(
        children: [
          Image.asset(AppAssets.azkarImage),
          Text(title, style: AppStyles.bold22white),
        ],
      ),
    );
  }
}
