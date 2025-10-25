import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islame/providers/most_recent_provider.dart';
import 'package:islame/ui/home/tbs/quran/quran_resorses.dart';
import 'package:islame/ui/home/tbs/quran/sura_details/surContent.dart';
import 'package:islame/utils/app_assets.dart';
import 'package:islame/utils/app_colors.dart';
import 'package:islame/utils/app_styles.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
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
    if (verses.isEmpty) {
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
                Expanded(
                  child: verses.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primaryColor,
                          ),
                        )
                      : ListView.separated(
                          padding: EdgeInsets.only(top: height * 0.04),
                          itemBuilder: (context, index) {
                            return SuraContent(
                              content: verses[index],
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: height * 0.02),
                          itemCount: verses.length,
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
    List<String> suraContent = fileContent.split('\n');
    verses = suraContent;
    setState(() {});
  }
}
