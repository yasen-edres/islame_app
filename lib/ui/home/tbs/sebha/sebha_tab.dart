import 'package:flutter/cupertino.dart';
import 'package:islame/utils/app_assets.dart';
import 'package:islame/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double rotation = 0;
  int counter = 0;

  int count = 0;
  List<String> sebhaList = [
    "سُبْحَانَ اللَّهِ",
    "الْحَمْدُ لِلَّهِ",
    "اللَّهُ أَكْبَرُ",
    "لَا إِلَهَ إِلَّااللَّه",
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: height * 0.05),
        Image.asset(AppAssets.sebhaTitle),
        Row(
          children: [
            SizedBox(width: width * 0.48),
            Image.asset(AppAssets.sebhaImageHead),
          ],
        ),
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  rotation += 0.035;
                  if (counter == 33) {
                    count++;
                  }
                  if (count == 4) {
                    count = 0;
                  }

                  if (counter < 33) {
                    counter++;
                  } else {
                    counter = 1;
                  }
                });
              },
              child: AnimatedRotation(
                turns: rotation,
                duration: Duration(milliseconds: 300),
                child: Image.asset(AppAssets.sebhaImageBody),
              ),
            ),
            Column(
              children: [
                Center(
                  heightFactor: height * 0.005,
                  child: Column(
                    children: [
                      Text("${sebhaList[count]}", style: AppStyles.bold26White),
                      SizedBox(height: height * 0.02),
                      Text('$counter', style: AppStyles.bold26White),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
