import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travl/components/input.dart';
import 'package:travl/components/navbar.dart';
import 'package:travl/firebase_options.dart';
import 'package:travl/utils/c_button.dart';
import 'package:travl/widgets/login_form.dart';

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
            ..._buildLoginBody()
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
                      ..._buildLoginBody()
                    ],
                  );
                }
              }),
        ),
      );
    }
  }

  List<Widget> _buildLoginBody() {
    return [LoginForm()];
  }
}
