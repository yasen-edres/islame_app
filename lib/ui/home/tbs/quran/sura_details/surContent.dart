import 'package:flutter/cupertino.dart';
import 'package:islame/utils/app_colors.dart';
import 'package:islame/utils/app_styles.dart';

class SuraContent extends StatelessWidget {
  final String content;
  final int index;

  const SuraContent({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      margin: EdgeInsets.symmetric(horizontal: width * 0.06),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColor.primaryColor, width: 1),
      ),
      child: Text(
        '$content [${index + 1}]',
        style: AppStyles.bold20primary,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
    );
  }
}
