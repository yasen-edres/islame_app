import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islame/ui/home/tbs/time/azkar_item.dart';
import 'package:islame/utils/app_assets.dart';
import 'package:islame/utils/app_colors.dart';
import 'package:islame/utils/app_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TimeTab extends StatefulWidget {
  TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  final List<Map<String, String>> prayerTimes = [
    {"name": "Fajr", "time": "04:44", 'Timing': 'AM'},
    {"name": "Dhuhr", "time": "01:01", 'Timing': 'PM'},
    {"name": "Asr", "time": "04:38", 'Timing': 'PM'},
    {"name": "Maghrib", "time": "07:57", 'Timing': 'PM'},
    {"name": "Isha", "time": "09:24", 'Timing': 'PM'},
  ];

  bool isSound = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.02,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.timeContainerCover),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: width * 0.04),
                      Text("16 Jul, \n2024", style: AppStyles.bold20white),
                      SizedBox(width: width * 0.16),
                      Text(
                        'pray Time \nTuesday',
                        style: AppStyles.bold24PrimaryDark,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: width * 0.14),
                      Text("09 Muh, \n 1446", style: AppStyles.bold20white),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Expanded(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 190,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 4),
                        viewportFraction: 0.32,
                      ),
                      items: prayerTimes.map((prayer) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF202020),
                                    Color(0xFFB19768),
                                  ],
                                  begin: FractionalOffset.topLeft,
                                  end: FractionalOffset.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      prayer['name']!,
                                      style: AppStyles.bold22white,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      prayer['time']!,
                                      style: AppStyles.bold26White,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      prayer['Timing']!,
                                      style: AppStyles.bold22white,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      SizedBox(width: width * 0.25),
                      Row(
                        children: [
                          Text(
                            'Next Pray -',
                            style: AppStyles.bold20PrimaryDark,
                          ),
                          Text('02:32', style: AppStyles.bold20Black),
                        ],
                      ),
                      SizedBox(width: width * 0.2),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isSound = !isSound;
                          });
                        },
                        child: isSound
                            ? Icon(
                                Icons.volume_up,
                                color: AppColor.blackColor,
                                size: width * 0.075,
                              )
                            : Icon(
                                Icons.volume_off,
                                color: AppColor.blackColor,
                                size: width * 0.075,
                              ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                ],
              ),
            ),
            SizedBox(height: height * 0.04),
            Text('Azkar', style: AppStyles.bold20white),
            SizedBox(height: height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AzkarItem(title: 'Evening Azkar'),
                AzkarItem(title: 'Morning Azkar'),
              ],
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }
}
