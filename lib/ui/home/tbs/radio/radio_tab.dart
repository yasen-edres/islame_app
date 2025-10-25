import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:islame/ui/home/tbs/radio/widget/radio_widget.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedValue = 1;
  List<String> radioList = [
    "Radio Ibrahim Al-Akdar",
    "Radio Al_Qaria Yassen",
    "Radio Ahmed Al_trabulsi",
    "Radio Addokali Mohhammad Alalim",
  ];
  List<String> recitesList = [
    "Ibrahim Al_Akdar",
    "Akram Alalaqmi",
    "Majed Al_Enezi",
    "Malik shaibat Alhamed",
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomSlidingSegmentedControl(
          initialValue: selectedValue,
          children: {
            1: Container(
              width: width * 0.4,
              child: Center(
                child: Text(
                  "Radio",
                  style: selectedValue == 1
                      ? AppStyles.bold20Black
                      : AppStyles.bold20white,
                ),
              ),
            ),
            2: Container(
              width: width * 0.4,
              child: Center(
                child: Text(
                  "Recites",
                  style: selectedValue == 2
                      ? AppStyles.bold20Black
                      : AppStyles.bold20white,
                ),
              ),
            ),
          },
          decoration: BoxDecoration(
            color: AppColor.transparentBlackColor,
            borderRadius: BorderRadius.circular(16),
          ),
          thumbDecoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          curve: Curves.easeInToLinear,
          onValueChanged: (value) => setState(() => selectedValue = value),
        ),
        if (selectedValue == 1) ...[
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(
                bottom: height * 0.02,
                top: height * 0.02,
              ),
              itemBuilder: (context, index) =>
                  RadioWidget(title: radioList[index]),
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * 0.02),
              itemCount: radioList.length,
            ),
          ),
        ] else ...[
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(
                bottom: height * 0.02,
                top: height * 0.02,
              ),
              itemBuilder: (context, index) =>
                  RadioWidget(title: recitesList[index]),
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * 0.02),
              itemCount: recitesList.length,
            ),
          ),
        ],
      ],
    );
  }
}

/*
itemBuilder: (context, index) => RadioWidget(title: titleList[index]),
                        separatorBuilder: (context, index) => SizedBox(height: height*0.02,),
                        itemCount: 5
 */
