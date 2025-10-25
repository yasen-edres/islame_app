import 'package:flutter/cupertino.dart';
import 'package:islame/utils/app_colors.dart';
import 'package:islame/utils/app_styles.dart';

class SuraContent1 extends StatelessWidget {
  final String content;

  const SuraContent1({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Text(
        content,
        style: AppStyles.bold20primary,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
      ),
    );
  }
}
