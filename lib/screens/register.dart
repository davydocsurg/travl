import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travl/components/navbar.dart';
import 'package:travl/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travl/widgets/register_form.dart';

class Register extends StatefulWidget {
  final String secTitle = 'Travl - Register';
  final String navTitle = 'Register';
  final double inputSpacingTop = 35;

  void onBack() {}

  @override
  RegisterState createState() => RegisterState();
}
// class RegisterState extends State<Register> {
//   // TextEditingController name = new TextEditingController();
// bool switchValue = false;

//   @override
// Widget build(BuildContext context) {
//   return CupertinoSwitch(
//     value: switchValue,
//     onChanged: (value) {
//       setState(() {
//         switchValue = value;
//       });
//     },
//   );
// }
// }

class RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: widget.secTitle,
        home: CupertinoPageScaffold(
            child: ListView(
          children: [
            CNavBar(title: widget.navTitle, onBack: widget.onBack),
            ..._buildRegBody()
          ],
        )),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: widget.secTitle,
        home: Scaffold(
          body: FutureBuilder(
              future: Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform,
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Show a loading spinner while waiting
                } else {
                  return ListView(
                    children: [
                      CNavBar(title: widget.navTitle, onBack: widget.onBack),
                      ..._buildRegBody()
                    ],
                  );
                }
              }),
        ),
      );
    }
  }

  List<Widget> _buildRegBody() {
    return [RegisterForm()];
  }
}
