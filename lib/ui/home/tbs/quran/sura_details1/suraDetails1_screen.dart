import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islame/ui/home/tbs/quran/quran_resorses.dart';
import 'package:islame/ui/home/tbs/quran/sura_details1/surContent1.dart';
import 'package:islame/utils/app_assets.dart';
import 'package:islame/utils/app_colors.dart';
import 'package:islame/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/most_recent_provider.dart';

class SuraDetailsScreen1 extends StatefulWidget {
  SuraDetailsScreen1({super.key});

  @override
  State<SuraDetailsScreen1> createState() => _SuraDetailsScreen1State();
}

class _SuraDetailsScreen1State extends State<SuraDetailsScreen1> {
  String suraContent = '';
  late MostRecentProvider mostRecentProvider;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentProvider.readMOstRecentList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    var index = ModalRoute.of(context)!.settings.arguments as int;
    if (suraContent == '') {
      loadSuraFile(index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranSuras[index],
          style: AppStyles.bold20primary,
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: AppColor.blackBgColor,
            child: Image.asset(AppAssets.detailsBg),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: Column(
              children: [
                Text(
                  QuranResources.arabicQuranSuras[index],
                  style: AppStyles.bold24primary,
                ),
                SizedBox(height: height * 0.02),
                Expanded(
                  child: SingleChildScrollView(
                    child: SuraContent1(content: suraContent),
                  ),
                ),
                SizedBox(height: height * 0.12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/suras/${index + 1}.txt',
    );
    List<String> suraLines = fileContent.split('\n');
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += '[${i + 1}]';
    }
    suraContent = suraLines.join();
    setState(() {});
  }
}
