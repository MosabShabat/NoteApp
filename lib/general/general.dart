import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/home.dart';

SizedBox sizedBox({w, h}) {
  return SizedBox(
    width: w,
    height: h,
  );
}

AssetImage ImageMethod(image) => AssetImage(image);
Text text({text, color, bold, size}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: bold,
    ),
  );
}

TextFormField textFormField(
    {controller,
    keyboardType,
    fillColor,
    filled,
    circular,
    cursorHeight1,
    outbordercolor,
    borderwidth,
    BorderStyle,
    focusedBordercolor,
    focusedBorderwidth,
    focusedBordercircular,
    lable,
    prefixIcon,
    suffixIcon,
    lablefontSize,
    fontWeight,
    textcolor,
    hintText,
    maxLines,
    minLines,
    obscureText1,
    hintStylecolor,
    borderSideColor,
    borderSideRadius,
    maxWidth,
    maxHeight,
    hintfontSize,
    hintfontWeight}) {
  print(keyboardType.toString());
  return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText1,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: TextInputAction.next,
      onTap: () {},
      cursorHeight: cursorHeight1,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: filled,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(circular),
            borderSide: BorderSide(
                color: outbordercolor, width: borderwidth, style: BorderStyle)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderSideColor, width: 2),
          borderRadius: BorderRadius.circular(borderSideRadius),
        ),
        label: lable,
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintStylecolor,
          fontSize: hintfontSize,
          fontWeight: hintfontWeight,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(
          fontSize: lablefontSize,
          fontWeight: fontWeight,
          color: textcolor,
        ),
        constraints: BoxConstraints(
          maxWidth: maxWidth,
          maxHeight: maxHeight,
        ),
      ));
}

Drawer DrawerMethod(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Image.asset(
            'assets/images/ramzi.png',
            height: 50,
          ),
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('4'.tr),
          onTap: () {
            Navigator.of(context).pushNamed('drawerprofile');
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('5'.tr),
          onTap: () {
            Navigator.of(context).pushNamed('drawersettings');
          },
        ),
        ListTile(
            leading: Icon(Icons.logout),
            title: Text('6'.tr),
            onTap: () {
              Navigator.pushNamed(context, 'Login');
            }),
      ],
    ),
  );
}

AppBar drawerAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    title: Image.asset(
      'assets/images/ramzi.png',
      height: 50,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: ((context) => home())));
          },
          child: Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
      )
    ],
  );
}
