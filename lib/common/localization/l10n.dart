import 'package:shared_preferences/shared_preferences.dart';

final class L {
  static String lang = 'en';
  static const l10n = {
    'ru': {'hello': 'привет'},
    'en': {'hello': 'hello'},
  };

  static String tr(String key) {
    return l10n[lang]?[key] ?? key;
  }

  static Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    lang = prefs.getString('lang') ?? 'en';
  }

  static Future<void> change(String newLang) async {
    final prefs = await SharedPreferences.getInstance();

    lang = newLang;

    await prefs.setString('lang', lang);
  }
}
