import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travl/components/input.dart';
import 'package:travl/components/navbar.dart';
import 'package:travl/utils/c_button.dart';

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
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
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
        title: widget.secTitle,
        home: Scaffold(
          body: ListView(
            children: [
              CNavBar(title: widget.navTitle, onBack: widget.onBack),
              ..._buildRegBody()
            ],
          ),
        ),
      );
    }
  }

  List<Widget> _buildRegBody() {
    return [
      Padding(
        padding: EdgeInsets.only(right: 20, left: 20, top: 40),
        child: Column(
          children: [
            CInput(
              labelText: 'First Name',
              hintText: 'Enter your first name',
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
            ),
            Padding(
              padding: EdgeInsets.only(top: widget.inputSpacingTop),
              child: CInput(
                labelText: 'Last Name',
                hintText: 'Enter your last name',
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: widget.inputSpacingTop),
              child: CInput(
                labelText: 'Email',
                hintText: 'Enter your email',
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: widget.inputSpacingTop),
              child: CInput(
                labelText: 'Password',
                hintText: '8+ characters',
                controller: TextEditingController(),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (Platform.isIOS)
                    CupertinoSwitch(
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {
                          switchValue = value;
                          print(switchValue);
                        });
                      },
                    )
                  else
                    Checkbox(
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {
                          switchValue = value!;
                        });
                      },
                    ),
                  Text('I agree to the terms and conditions')
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CButton(
                    text: 'Register',
                    onPressed: () {},
                    width: double.infinity,
                    height: 50,
                    color: Colors.white,
                    bgColor: Colors.blue[800]!)),
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Already have an account? ',
                        style: TextStyle(color: Colors.black)),
                    Text('Login here',
                        style: TextStyle(color: Colors.blue[900]!))
                  ],
                ))
          ],
        ),
      )
    ];
  }
}
