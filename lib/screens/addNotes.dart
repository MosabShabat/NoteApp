import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waelprojects/database/sqldb.dart';

import '../general/general.dart';
import 'home.dart';

class addNotes extends StatefulWidget {
  const addNotes({super.key});

  @override
  State<addNotes> createState() => _addNotesState();
}

class _addNotesState extends State<addNotes> {
  sqldb sqlDb = sqldb();
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController color = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '10'.tr,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Form(
              key: formstate,
              child: Column(
                children: [
                  sizedBox(h: 30.0),
                  textFormField(
                      controller: note,
                      keyboardType: TextInputType.name,
                      circular: 12.0,
                      fillColor: Colors.transparent,
                      filled: true,
                      obscureText1: false,
                      borderSideColor: Colors.red,
                      borderSideRadius: 12.0,
                      maxWidth: 350.0,
                      maxHeight: 50.0,
                      maxLines: 1,
                      minLines: 1,
                      prefixIcon: Icon(
                        Icons.note,
                        color: Colors.red,
                      ),
                      outbordercolor: Colors.blue,
                      hintText: '11'.tr,
                      hintfontSize: 16.0,
                      hintfontWeight: FontWeight.w500,
                      hintStylecolor: Colors.red,
                      borderwidth: 3.0,
                      BorderStyle: BorderStyle.solid),
                  sizedBox(h: 30.0),
                  textFormField(
                      controller: title,
                      keyboardType: TextInputType.name,
                      circular: 12.0,
                      fillColor: Colors.transparent,
                      filled: true,
                      obscureText1: false,
                      borderSideColor: Colors.red,
                      borderSideRadius: 12.0,
                      maxWidth: 350.0,
                      maxHeight: 50.0,
                      maxLines: 1,
                      minLines: 1,
                      prefixIcon: Icon(
                        Icons.title_outlined,
                        color: Colors.red,
                      ),
                      outbordercolor: Colors.blue,
                      hintText: '12'.tr,
                      hintfontSize: 16.0,
                      hintfontWeight: FontWeight.w500,
                      hintStylecolor: Colors.red,
                      borderwidth: 3.0,
                      BorderStyle: BorderStyle.solid),
                  sizedBox(h: 30.0),
                  textFormField(
                      controller: color,
                      keyboardType: TextInputType.name,
                      circular: 12.0,
                      fillColor: Colors.transparent,
                      filled: true,
                      obscureText1: false,
                      borderSideColor: Colors.red,
                      borderSideRadius: 12.0,
                      maxWidth: 350.0,
                      maxHeight: 50.0,
                      maxLines: 1,
                      minLines: 1,
                      prefixIcon: Icon(
                        Icons.color_lens,
                        color: Colors.red,
                      ),
                      outbordercolor: Colors.blue,
                      hintText: '13'.tr,
                      hintfontSize: 16.0,
                      hintfontWeight: FontWeight.w500,
                      hintStylecolor: Colors.red,
                      borderwidth: 3.0,
                      BorderStyle: BorderStyle.solid),
                  sizedBox(h: 30.0),
                  Container(
                    height: 40.0,
                    width: 150,
                    child: MaterialButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () async {
                        // int response = await sqlDb.insertData('''
                        // INSERT INTO notes ('note','title','color')
                        // VALUES ("${note.text}","${title.text}","${color.text}")
                        //   ''');
                        int response = await sqlDb.insert("notes", {
                          "note": "${note.text}",
                          "title": "${title.text}",
                          "color": "${color.text}"
                        });
                        if (response > 0) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => home()),
                              (route) => false);
                        }
                      },
                      child: Text('10'.tr),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
