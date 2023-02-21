import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waelprojects/screens/addNotes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'classes/shared.dart';
import 'local/MyLocalController.dart';
import 'local/local.dart';
import 'screens/Login.dart';
import 'screens/SingUp.dart';
import 'screens/chosseLanguge.dart';
import 'screens/drawerprofile.dart';
import 'screens/drawersettings.dart';
import 'screens/home.dart';
import 'screens/myThems.dart';
import 'screens/seplash.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

//This Code needed highest version of dart and flutter...please sure you have this rquerments
//Mosab Ramzi shabat
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.put(MyLocalController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      home: seplash(),
      locale: controller.initailLang,
      translations: MyLocal(),
      routes: {
        'seplash': (context) => seplash(),
        'Login': (context) => Login(),
        'SingUp': (context) => SingUp(),
        'home': (context) => home(),
        'drawerprofile': (context) => drawerprofile(),
        'drawersettings': (context) => drawersettings(),
        'addNotes': (context) => addNotes(),
        'chosseLanguge': (context) => chosseLanguge(),
        'myThems': (context) => myThems(),

        //chosseLanguge
      },
    );
  }
}

class Thems {
  static ThemeData sutomeDarkTheme = ThemeData.dark().copyWith();
  static ThemeData sutomeLightTheme = ThemeData.light().copyWith();
}
