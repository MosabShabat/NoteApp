import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:ui';
import '../main.dart';

class MyLocalController extends GetxController {
  Locale initailLang = prefs!.getString("lang") == null
      ? Get.deviceLocale!
      : Locale(prefs!.getString("lang")!);
  void chageLang(String codeLang) {
    Locale locale = Locale(codeLang);
    prefs!.setString("lang", codeLang);
    Get.updateLocale(locale);
  }
}

class SettingsController extends GetxController {
  late ThemeData themeData;

  final box = GetStorage();

  @override // called when you use Get.put before running app
  void onInit() {
    super.onInit();
    _restoreTheme();
  }

  void _restoreTheme() {
    bool isDark =
        box.read('isDark') ?? true; // null check for first time running this
    if (isDark) {
      themeData = ThemeData.dark();
    } else {
      themeData = ThemeData.light();
    }
  }

  void storeThemeSetting(bool isDark) {
    box.write('isDark', isDark);
  }
}
