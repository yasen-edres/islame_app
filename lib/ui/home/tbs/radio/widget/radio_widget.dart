import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islame/utils/app_assets.dart';
import 'package:islame/utils/app_colors.dart';
import 'package:islame/utils/app_styles.dart';

class RadioWidget extends StatefulWidget {
  String title;

  RadioWidget({super.key, required this.title});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  bool sound = true;

  bool display = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height * 0.17,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: height * 0.02),
          Text(widget.title, style: AppStyles.bold20Black),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.bottomCornerHadeth),
                  fit: BoxFit.fill,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(width: width * 0.47),
                  InkWell(
                    onTap: () {
                      setState(() {
                        display = !display;
                      });
                    },
                    child: display
                        ? Image.asset(AppAssets.stopIcon)
                        : Image.asset(AppAssets.pauseIcon),
                  ),
                  SizedBox(width: width * 0.07),
                  InkWell(
                    onTap: () {
                      setState(() {
                        sound = !sound;
                      });
                    },
                    child: sound
                        ? Image.asset(AppAssets.volumeHigh)
                        : Image.asset(AppAssets.volumeCross),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
