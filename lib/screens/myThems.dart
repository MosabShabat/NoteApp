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
        backgroundColor: Colors.red,
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
            Card(
              color: Color.fromARGB(255, 252, 95, 95),
              child: RadioListTile<SingingCharacter>(
                activeColor: Colors.white,
                title: text(
                    text: '28'.tr,
                    size: 24.0,
                    color: Colors.white,
                    bold: FontWeight.bold),
                value: SingingCharacter.lafayette,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                  Get.changeTheme(ThemeData.dark());
                  controller.storeThemeSetting(true);
                },
              ),
            ),
            sizedBox(h: 20.0),
            Card(
              color: Color.fromARGB(255, 252, 95, 95),
              child: RadioListTile<SingingCharacter>(
                activeColor: Colors.white,
                title: text(
                    text: '29'.tr,
                    size: 24.0,
                    color: Colors.white,
                    bold: FontWeight.bold),
                value: SingingCharacter.jefferson,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                  Get.changeTheme(ThemeData.light());
                  controller.storeThemeSetting(false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
