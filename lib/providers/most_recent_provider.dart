import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_pres_helper.dart';

class MostRecentProvider extends ChangeNotifier {
  //todo: data - function
  List<int> mostRecentList = [];

  //todo: read data => get most recent list in shared prs .
  void readMOstRecentList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentListAsString =
        prefs.getStringList(SharedPrefsKeys.mostResentKey) ?? [];
    //todo: List<String> => List<int>.
    mostRecentList = mostRecentListAsString.map((e) => int.parse(e)).toList();
    notifyListeners();
  }
}
