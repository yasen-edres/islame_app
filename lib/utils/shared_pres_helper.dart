import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static const String mostResentKey = 'most_recent';
}

void saveLastSuraIndex(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // todo: get list from shared Prefs.
  List<String> mostRecentList =
      prefs.getStringList(SharedPrefsKeys.mostResentKey) ?? [];
  //todo: add new sura index.
  //todo: duplicate.
  if (mostRecentList.contains('$newSuraIndex')) {
    mostRecentList.remove('$newSuraIndex');
    mostRecentList.insert(0, '$newSuraIndex');
  } else {
    mostRecentList.insert(0, '$newSuraIndex');
  }
  //todo: show five element.
  if (mostRecentList.length > 5) {
    mostRecentList.removeLast();
  }
  //todo: save last sura index in shared Prefs.
  await prefs.setStringList(SharedPrefsKeys.mostResentKey, mostRecentList);
}
