import 'package:flutter/material.dart';
import '../general/general.dart';
class drawerprofile extends StatefulWidget {
  const drawerprofile({super.key});

  @override
  State<drawerprofile> createState() => _drawerprofileState();
}

class _drawerprofileState extends State<drawerprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: drawerAppBar(context),
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [],
            ),
          ),
        ],
      )),
    );
  }
}
