import 'package:get/get.dart';
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