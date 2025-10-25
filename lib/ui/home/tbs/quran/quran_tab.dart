import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islame/ui/home/tbs/quran/quran_resorses.dart';
import 'package:islame/ui/home/tbs/quran/sura_details1/mostRecenntly_widget.dart';
import 'package:islame/ui/home/tbs/quran/sura_item.dart';
import 'package:islame/utils/app_assets.dart';
import 'package:islame/utils/app_colors.dart';
import 'package:islame/utils/app_routes.dart';
import 'package:islame/utils/app_styles.dart';
import 'package:islame/utils/shared_pres_helper.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  void addFilterList() {}

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            style: AppStyles.bold14white,
            onChanged: (newText) {
              searchByNewText(newText);
            },
            cursorColor: AppColor.primaryColor,
            decoration: InputDecoration(
              enabledBorder: builtTexFieldBorder(),
              focusedBorder: builtTexFieldBorder(),
              prefixIcon: Image.asset(AppAssets.iconSearch),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16white,
            ),
          ),
          SizedBox(height: height * 0.02),
          MostRecentlyWidget(),
          SizedBox(height: height * 0.02),
          Text('Suras List', style: AppStyles.bold16white),
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //TODO: SAVE LAST SURA INDEX.
                    saveLastSuraIndex(filterList[index]);
                    //todo: Navigate.
                    Navigator.of(context).pushNamed(
                      AppRoutes.SuraDetailsScreen,
                      arguments: filterList[index],
                    );
                  },
                  child: SuraItem(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColor.whiteColor,
                  indent: width * 0.1,
                  endIndent: width * 0.1,
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder builtTexFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
    );
  }

  void searchByNewText(String newText) {
    List<int> searchResultList = [];
    for (int i = 0; i < QuranResources.englishQuranSuras.length; i++) {
      if (QuranResources.englishQuranSuras[i].toLowerCase().contains(
        newText.toLowerCase(),
      )) {
        searchResultList.add(i);
      }
      if (QuranResources.arabicQuranSuras[i].toLowerCase().contains(
        newText.toLowerCase(),
      )) {
        searchResultList.add(i);
      }
    }
    filterList = searchResultList;
    setState(() {});
  }
}
