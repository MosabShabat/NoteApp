import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../general/general.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController _Email = TextEditingController();
  TextEditingController _Password = TextEditingController();
  TextEditingController _Phone = TextEditingController();

  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _Email = TextEditingController();
    _Password = TextEditingController();
    _Phone = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
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
                          color: Colors.grey,
                        ),
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
                  textFormField(
                      controller: _Phone,
                      keyboardType: TextInputType.number,
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
                        Icons.phone,
                        color: Colors.grey,
                      ),
                      outbordercolor: Colors.blue,
                      hintText: '20'.tr,
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
                          text: '21'.tr,
                          size: 18.0,
                          color: Colors.grey,
                          bold: FontWeight.w500),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('Login');
                        },
                        child: text(
                            text: '19'.tr,
                            size: 18.0,
                            color: Colors.grey,
                            bold: FontWeight.w500),
                      )
                    ],
                  ),
                  sizedBox(h: 30.0),
                  ElevatedButton(
                      onPressed: () => _performRegister(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          side: const BorderSide(color: Colors.transparent)),
                      child: Container(
                        width: 260,
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

  Future<void> _performRegister() async {
    if (_checkData()) {
      await _register();
    } else {
      showSnackBar(message: '23'.tr);
    }
  }

  bool _checkData() {
    if (_Email.text.isNotEmpty &&
        _Password.text.isNotEmpty &&
        _Phone.text.isNotEmpty) {
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

  Future<void> _register() async {
    Navigator.pushNamed(context, 'home');
  }

  showSnackBar({message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.grey,
    ));
  }
}
