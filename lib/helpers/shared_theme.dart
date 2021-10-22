import 'package:shared_preferences/shared_preferences.dart';

class ThemeShared {
  static SharedPreferences? _sharedPrefObj;

  late bool themeLight;

  Future<void> createThemeSharedPrefObj() async {
    // ignore: avoid_print
    print("createSharedPrefObj");
    _sharedPrefObj = await SharedPreferences.getInstance();
  }

  void saveThemeSharedPref(bool val) {
    // ignore: avoid_print
    print("saveThemeSharedPref");
    _sharedPrefObj?.setBool('themeColorData', val);
  }

  Future<bool> loadThemeSharedPref() async {
    themeLight = _sharedPrefObj?.getBool('themeColorData') ?? true;
    // ignore: avoid_print
    print("loadThemeSharedPref: $themeLight");
    return themeLight;
  }
}
