import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:waelprojects/database/sqldb.dart';

import '../general/general.dart';
import 'edit.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  sqldb sqldb1 = sqldb();
  bool isLoading = true;
  List notes = [];
  Future readData() async {
    List<Map> response = await sqldb1.read("notes");
    notes.addAll(response);
    isLoading = false;
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        drawer: DrawerMethod(context),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).pushNamed('addNotes');
          },
          child: Icon(Icons.add),
        ),
        body: isLoading == true
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : Container(
                child: ListView(children: [
                sizedBox(h: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150.0),
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Center(
                      child: text(
                          text: '1'.tr,
                          color: Colors.white,
                          size: 24.0,
                          bold: FontWeight.bold),
                    ),
                  ),
                ),
                sizedBox(h: 20.0),
                ListView.builder(
                    itemCount: notes.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Card(
                            color: Color.fromARGB(255, 255, 197, 193),
                            child: ListTile(
                              title: Text("${notes[i]['note']}"),
                              subtitle: Text("${notes[i]['title']}"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => edit(
                                                    note: notes[i]['note'],
                                                    title: notes[i]['title'],
                                                    color: notes[i]['color'],
                                                    id: notes[i]['id'],
                                                  )));
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: Text('24'.tr),
                                          content: Text('25'.tr),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              child: Text('27'.tr),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                int response =
                                                    await sqldb1.delete("notes",
                                                        "id = ${notes[i]['id']}");
                                                if (response > 0) {
                                                  notes.removeWhere((element) =>
                                                      element['id'] ==
                                                      notes[i]['id']);
                                                  setState(() {});
                                                }
                                                Navigator.pop(context);
                                              },
                                              child: Text('26'.tr),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      );
                    })
              ])));
  }
}
