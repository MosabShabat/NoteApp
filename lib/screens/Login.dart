import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../classes/shared.dart';
import '../general/general.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController _Email = TextEditingController();
  TextEditingController _Password = TextEditingController();
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _Email = TextEditingController();
    _Password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          sizedBox(h: 50.0),
          Container(
            width: 200,
            height: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ImageMethod('assets/images/ramzi.png'),
                    fit: BoxFit.fill)),
          ),
          Form(
              key: formstate,
              child: Column(
                children: [
                  sizedBox(h: 30.0),
                  textFormField(
                      controller: _Email,
                      keyboardType: TextInputType.emailAddress,
                      circular: 12.0,
                      fillColor: Colors.transparent,
                      filled: true,
                      obscureText1: false,
                      borderSideColor: Colors.blue,
                      borderSideRadius: 12.0,
                      maxWidth: 350.0,
                      maxHeight: 50.0,
                      maxLines: 1,
                      minLines: 1,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                      outbordercolor: Colors.blue,
                      hintText: '15'.tr,
                      hintfontSize: 16.0,
                      hintfontWeight: FontWeight.w500,
                      hintStylecolor: Colors.grey,
                      borderwidth: 2.0,
                      BorderStyle: BorderStyle.solid),
                  sizedBox(h: 30.0),
                  textFormField(
                      controller: _Password,
                      keyboardType: TextInputType.name,
                      circular: 12.0,
                      fillColor: Colors.transparent,
                      filled: true,
                      obscureText1: true,
                      borderSideColor: Colors.blue,
                      borderSideRadius: 12.0,
                      maxWidth: 350.0,
                      maxHeight: 50.0,
                      maxLines: 1,
                      minLines: 1,
                      suffixIcon: IconButton(
                        icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey),
                        onPressed: () {
                          setState() {
                            _passwordVisible = !_passwordVisible;
                          }

                          ;
                        },
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      outbordercolor: Colors.blue,
                      hintText: '16'.tr,
                      hintfontSize: 16.0,
                      hintfontWeight: FontWeight.w500,
                      hintStylecolor: Colors.grey,
                      borderwidth: 2.0,
                      BorderStyle: BorderStyle.solid),
                  sizedBox(h: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      text(
                          text: '17'.tr,
                          size: 18.0,
                          color: Colors.grey,
                          bold: FontWeight.w500),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('SingUp');
                        },
                        child: text(
                            text: '18'.tr,
                            size: 18.0,
                            color: Colors.grey,
                            bold: FontWeight.w500),
                      )
                    ],
                  ),
                  sizedBox(h: 30.0),
                  ElevatedButton(
                      onPressed: () => _performLogin(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          side: const BorderSide(color: Colors.transparent)),
                      child: Container(
                        width: 320,
                        height: 50,
                        child: Center(
                          child: Text(
                            '19'.tr,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      )),
                ],
              ))
        ],
      )),
    );
  }

  _performLogin() {
    if (_checkData()) {
      _login();
    } else {
      showSnackBar(message: '22'.tr);
    }
  }

  bool _checkData() {
    if (_Email.text.isNotEmpty && _Password.text.isNotEmpty) {
      if (RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_Email.text)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  _login() async {
    sharedPrefController().setData(key: PrefKeys.isLogin.name, value: true);
    sharedPrefController()
        .setData(key: PrefKeys.email.name, value: _Email.text);
    sharedPrefController()
        .setData(key: PrefKeys.password.name, value: _Password.text);
    Navigator.pushNamed(context, 'home');
  }

  showSnackBar({message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.grey,
    ));
  }
}
