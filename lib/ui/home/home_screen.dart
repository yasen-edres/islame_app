import 'package:flutter/material.dart';
import 'package:islame/ui/home/tbs/hadeth/hadeth_tab.dart';
import 'package:islame/ui/home/tbs/quran/quran_tab.dart';
import 'package:islame/ui/home/tbs/radio/radio_tab.dart';
import 'package:islame/ui/home/tbs/sebha/sebha_tab.dart';
import 'package:islame/ui/home/tbs/time/time_tab.dart';
import 'package:islame/utils/app_assets.dart';
import 'package:islame/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndex],
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(
              context,
            ).copyWith(canvasColor: AppColor.primaryColor),
            child: BottomNavigationBar(
              // backgroundColor: AppColor.primaryColor,
              //   type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },

              items: [
                BottomNavigationBarItem(
                  icon: buildBottomNanItem(
                    index: 0,
                    iconName: AppAssets.iconQuran,
                  ),
                  label: 'Quran',
                ),
                BottomNavigationBarItem(
                  icon: buildBottomNanItem(
                    index: 1,
                    iconName: AppAssets.iconHadeth,
                  ),
                  label: 'Hadeth',
                ),
                BottomNavigationBarItem(
                  icon: buildBottomNanItem(
                    index: 2,
                    iconName: AppAssets.iconSebha,
                  ),
                  label: 'Sebha',
                ),
                BottomNavigationBarItem(
                  icon: buildBottomNanItem(
                    index: 3,
                    iconName: AppAssets.iconRadio,
                  ),
                  label: 'Radio',
                ),
                BottomNavigationBarItem(
                  icon: buildBottomNanItem(
                    index: 4,
                    iconName: AppAssets.iconTime,
                  ),
                  label: 'Time',
                ),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Image.asset(
                  AppAssets.logo,
                  width: width * 0.69,
                  height: height * 0.15,
                ),
              ),
              Expanded(child: tabs[selectedIndex]),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBottomNanItem({required int index, required String iconName}) {
    return selectedIndex == index
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColor.blackBgColor,
            ),
            child: ImageIcon(AssetImage(iconName)),
          )
        : ImageIcon(AssetImage(iconName));
  }
}
