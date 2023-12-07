import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travl/components/navbar.dart';

class Register extends StatelessWidget {
  final String secTitle = 'Travl - Register';
  final String navTitle = 'Register';

  void onBack() {}

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        title: secTitle,
        home: CupertinoPageScaffold(
            child: ListView(
          children: [CNavBar(title: navTitle, onBack: onBack)],
        )),
      );
    } else {
      return MaterialApp(
        title: secTitle,
        home: Scaffold(
          body: ListView(
            children: [CNavBar(title: navTitle, onBack: onBack)],
          ),
        ),
      );
    }
  }
}
