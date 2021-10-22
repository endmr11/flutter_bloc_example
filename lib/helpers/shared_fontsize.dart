import 'package:shared_preferences/shared_preferences.dart';

class FontSizeShared {
  static SharedPreferences? _sharedPrefObj;

  late double fontSize;

  Future<void> createFontSizeSharedPrefObj() async {
    // ignore: avoid_print
    print("createSharedPrefObj");
    _sharedPrefObj = await SharedPreferences.getInstance();
  }

  void saveFontSizeSharedPref(double val) {
    // ignore: avoid_print
    print("saveThemeSharedPref");
    _sharedPrefObj?.setDouble('fontSizeData', val);
  }

  Future<double> loadFontSizeSharedPref() async {
    fontSize = _sharedPrefObj?.getDouble('fontSizeData') ?? 17;
    // ignore: avoid_print
    print("loadThemeSharedPref: $fontSize");
    return fontSize;
  }
}
