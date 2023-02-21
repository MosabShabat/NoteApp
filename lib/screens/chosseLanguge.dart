import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../general/general.dart';
import '../local/MyLocalController.dart';

enum SingingCharacter { lafayette, jefferson }

class chosseLanguge extends StatefulWidget {
  const chosseLanguge({super.key});

  @override
  State<chosseLanguge> createState() => _chosseLangugeState();
}

class _chosseLangugeState extends State<chosseLanguge> {
  SingingCharacter? _character = SingingCharacter.jefferson;

  @override
  Widget build(BuildContext context) {
    MyLocalController MLC = Get.find();

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
                    text: '2'.tr,
                    size: 24.0,
                    color: Colors.white,
                    bold: FontWeight.bold),
                value: SingingCharacter.lafayette,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                  MLC.chageLang('ar');
                },
              ),
            ),
            sizedBox(h: 20.0),
            Card(
              color: Color.fromARGB(255, 252, 95, 95),
              child: RadioListTile<SingingCharacter>(
                activeColor: Colors.white,
                title: text(
                    text: '3'.tr,
                    size: 24.0,
                    color: Colors.white,
                    bold: FontWeight.bold),
                value: SingingCharacter.jefferson,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                  MLC.chageLang('en');
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.language),
              //   title: text(
              //       text: '3'.tr,
              //       size: 24.0,
              //       color: Colors.white,
              //       bold: FontWeight.bold),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
