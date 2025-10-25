import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islame/ui/home/tbs/quran/quran_resorses.dart';
import 'package:islame/utils/app_assets.dart';
import 'package:islame/utils/app_styles.dart';

class SuraItem extends StatelessWidget {
  final int index;

  const SuraItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.vectorImage),
            Text('${index + 1}', style: AppStyles.bold14white),
          ],
        ),
        SizedBox(width: width * 0.06),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResources.englishQuranSuras[index],
              style: AppStyles.bold20white,
            ),
            Text(
              '${QuranResources.AyaNumber[index]}  Verses ',
              style: AppStyles.bold14white,
            ),
          ],
        ),
        Spacer(),
        Text(
          QuranResources.arabicQuranSuras[index],
          style: AppStyles.bold20white,
        ),
      ],
    );
  }
}
