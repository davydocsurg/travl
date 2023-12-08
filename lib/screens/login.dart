import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travl/components/input.dart';
import 'package:travl/components/navbar.dart';
import 'package:travl/utils/c_button.dart';

class Login extends StatefulWidget {
  final String secTitle = 'Travl - Login';
  final String navTitle = 'Login';
  final double inputSpacingTop = 35;

  void onBack() {}

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
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
                    Transform.scale(
                        scale: 0.8, // Adjust this value as per your need
                        child: CupertinoSwitch(
                          value: switchValue,
                          onChanged: (value) {
                            setState(() {
                              switchValue = value;
                              print(switchValue);
                            });
                          },
                        ))
                  else
                    Checkbox(
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {
                          switchValue = value!;
                        });
                      },
                    ),
                  Text(
                    'Keep me logged in',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Forgot password?',
                        style: TextStyle(color: Colors.blue[900]!))
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 40),
                child: CButton(
                    text: 'Login',
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
                    Text('Don\'t have an account? ',
                        style: TextStyle(color: Colors.black)),
                    Text('Register here',
                        style: TextStyle(color: Colors.blue[900]!))
                  ],
                ))
          ],
        ),
      )
    ];
  }
}
