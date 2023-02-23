import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../general/general.dart';

class drawersettings extends StatefulWidget {
  const drawersettings({super.key});

  @override
  State<drawersettings> createState() => _drawersettingsState();
}

class _drawersettingsState extends State<drawersettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: drawerAppBar(context),
        body: SafeArea(
          child: ListView(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.grey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'chosseLanguge');
                          },
                          child: ListTile(
                            leading: Icon(Icons.language),
                            title: Text('7'.tr),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'myThems');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.grey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.dark_mode),
                            title: Text('8'.tr),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.grey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.notifications),
                          title: Text('9'.tr),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
