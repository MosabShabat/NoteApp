import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../classes/shared.dart';
import '../general/general.dart';

class seplash extends StatefulWidget {
  const seplash({super.key});

  @override
  State<seplash> createState() => _seplashState();
}

class _seplashState extends State<seplash> {
   @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      bool? flag =
          sharedPrefController().getData(key: PrefKeys.isLogin.name) ?? false;
      String routes = flag ? 'home' : 'Login';
      Navigator.pushReplacementNamed(context, routes);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Image(
      image: ImageMethod('assets/images/ramzi.png'),
    )));
  }
}
