import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../general/general.dart';
import '../local/MyLocalController.dart';
import '../main.dart';

enum SingingCharacter { lafayette, jefferson }

class myThems extends StatefulWidget {
  const myThems({super.key});

  @override
  State<myThems> createState() => _myThemsState();
}

class _myThemsState extends State<myThems> {
  SingingCharacter? _character = SingingCharacter.jefferson;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: text(
            text: 'RamziChat',
            size: 24.0,
            color: Colors.white,
            bold: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            sizedBox(h: 20.0),
            MaterialButton(
              onPressed: () {
                Get.changeTheme(ThemeData.dark());
                controller.storeThemeSetting(true);
              },
              child: text(
                  text: '28'.tr,
                  size: 24.0,
                  color: Colors.white,
                  bold: FontWeight.bold),
              color: Colors.grey,
              minWidth: MediaQuery.of(context).size.width,
            )
            // MaterialButton(
            //   onPressed: () {
            //     Get.changeTheme(ThemeData.dark()
            //         .copyWith(appBarTheme: AppBarTheme(color: Colors.yellow)));
            //     controller.storeThemeSetting(true);
            //   },
            //   child: text(
            //       text: '28'.tr,
            //       size: 24.0,
            //       color: Colors.white,
            //       bold: FontWeight.bold),
            //   color: Colors.grey,
            //   minWidth: MediaQuery.of(context).size.width,
            // ),
            ,
            sizedBox(h: 20.0),
            MaterialButton(
              onPressed: () {
                Get.changeTheme(ThemeData.light());
                controller.storeThemeSetting(false);
                // final appBarColor = Colors.pink;
                // controller.storeThemeSetting(false, appBarColor);
              },
              child: text(
                  text: '29'.tr,
                  size: 24.0,
                  color: Colors.white,
                  bold: FontWeight.bold),
              color: Colors.grey,
              minWidth: MediaQuery.of(context).size.width,
            )

            // MaterialButton(
            //   onPressed: () {
            //     Get.changeTheme(ThemeData.light()
            //         .copyWith(appBarTheme: AppBarTheme(color: Colors.pink)));
            //     controller.storeThemeSetting(false);
            //   },
            //   child: text(
            //       text: '29'.tr,
            //       size: 24.0,
            //       color: Colors.white,
            //       bold: FontWeight.bold),
            //   color: Colors.grey,
            //   minWidth: MediaQuery.of(context).size.width,
            // ),
          ],
        ),
      ),
    );
  }
}
