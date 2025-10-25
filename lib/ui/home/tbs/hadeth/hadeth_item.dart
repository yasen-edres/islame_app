import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islame/utils/app_assets.dart';
import 'package:islame/utils/app_colors.dart';
import 'package:islame/utils/app_styles.dart';

import '../../../../model/hadeth.dart';

class HadethItem extends StatefulWidget {
  final int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(
        left: width * 0.02,
        right: width * 0.02,
        top: height * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.primaryColor,
        image: DecorationImage(image: AssetImage(AppAssets.hadethDetailsBg)),
      ),
      child: hadeth == null
          ? const Center(
              child: CircularProgressIndicator(color: AppColor.blackBgColor),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.leftCornerHadeth,
                      width: width * 0.16,
                    ),
                    Expanded(
                      child: Text(
                        hadeth?.title ?? "",
                        style: AppStyles.bold24black,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset(
                      AppAssets.rightCornerHadeth,
                      width: width * 0.16,
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadeth?.content ?? "",
                      style: AppStyles.bold16black,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Image.asset(AppAssets.bottomCornerHadeth),
              ],
            ),
    );
  }

  void loadHadethFile() async {
    String fileContent = await rootBundle.loadString(
      'assets/files/hadeeth/h${widget.index}.txt',
    );
    int fileLineIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0, fileLineIndex);
    String content = fileContent.substring(fileLineIndex + 1);
    hadeth = Hadeth(title: title, content: content);
    setState(() {});
    // List<String> hadethLines = fileContent.split('\n');
    // for(int i = 0; i < hadethLines.length ; i++){
    //   String title = hadethLines[0];
    //   hadethLines.removeAt(0);
    // }
  }
}
