import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../database/sqldb.dart';
import '../general/general.dart';
import 'home.dart';

class edit extends StatefulWidget {
  final note;
  final title;
  final color;
  final id;

  edit({super.key, this.note, this.title, this.color, this.id});

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  sqldb sqlDb = sqldb();
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController color = TextEditingController();
  @override
  void initState() {
    note.text = widget.note;
    title.text = widget.title;
    color.text = widget.color;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '14'.tr,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: ListView(
          children: [
            Form(
                key: formstate,
                child: Column(
                  children: [
                    sizedBox(h: 30.0),
                    textFormField(
                        controller: note,
                        keyboardType: TextInputType.emailAddress,
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
                        hintStylecolor: Colors.grey,
                        borderwidth: 3.0,
                        BorderStyle: BorderStyle.solid),
                    sizedBox(h: 30.0),
                    textFormField(
                        controller: title,
                        keyboardType: TextInputType.emailAddress,
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
                        hintStylecolor: Colors.grey,
                        borderwidth: 3.0,
                        BorderStyle: BorderStyle.solid),
                    sizedBox(h: 30.0),
                    textFormField(
                        controller: color,
                        keyboardType: TextInputType.emailAddress,
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
                        hintStylecolor: Colors.grey,
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
                          // int response = await sqlDb.updateData('''
                          // UPDATE notes SET
                          //  note = "${note.text}",
                          //  title = "${title.text}",
                          //  color = "${color.text}"
                          //  WHERE ID = ${widget.id}

                          //   ''');
                          int response = await sqlDb.update(
                              "notes",
                              {
                                "note": "${note.text}",
                                "title": "${title.text}",
                                "color": "${color.text}"
                              },
                              "id = ${widget.id}");
                          if (response > 0) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => home()),
                                (route) => false);
                          }
                        },
                        child: Text('14'.tr),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
