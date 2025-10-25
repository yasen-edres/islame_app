import 'package:flutter/cupertino.dart';
import 'package:islame/providers/most_recent_provider.dart';
import 'package:islame/ui/home/tbs/quran/quran_resorses.dart';
import 'package:islame/utils/app_assets.dart';
import 'package:islame/utils/app_colors.dart';
import 'package:islame/utils/app_styles.dart';
import 'package:provider/provider.dart';

class MostRecentlyWidget extends StatefulWidget {
  MostRecentlyWidget({super.key});

  @override
  State<MostRecentlyWidget> createState() => _MostRecentlyWidgetState();
}

class _MostRecentlyWidgetState extends State<MostRecentlyWidget> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //todo: tis code can be execute after build.
      mostRecentProvider.readMOstRecentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently', style: AppStyles.bold16white),
          SizedBox(height: height * 0.02),
          SizedBox(
            height: height * 0.18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.primaryColor,
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            QuranResources.englishQuranSuras[mostRecentProvider
                                .mostRecentList[index]],
                            style: AppStyles.bold24black,
                          ),
                          Text(
                            QuranResources.arabicQuranSuras[mostRecentProvider
                                .mostRecentList[index]],
                            style: AppStyles.bold24black,
                          ),
                          Text(
                            '${QuranResources.AyaNumber[mostRecentProvider.mostRecentList[index]]} Verses',
                            style: AppStyles.bold14black,
                          ),
                        ],
                      ),
                      Image.asset(AppAssets.mostRecently),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(width: width * 0.04),
              itemCount: mostRecentProvider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
