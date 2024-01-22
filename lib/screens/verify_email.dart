import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travl/components/navbar.dart';
import 'package:travl/firebase_options.dart';
import 'package:travl/screens/login.dart';
import 'package:travl/utils/c_navigator.dart';
import 'package:travl/widgets/verify_email_form.dart';

class EmailVerification extends StatefulWidget {
  final String secTitle = 'Travl - Email Verification';
  final String navTitle = 'Email Verification';
  final double inputSpacingTop = 35;

  @override
  EmailVerificationState createState() => EmailVerificationState();
}

class EmailVerificationState extends State<EmailVerification> {
  bool switchValue = false;
  final CustomNavigatorObserver navigatorObserver = CustomNavigatorObserver();

  @override
  Widget build(BuildContext context) {
    void onBack() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }

    return ListView(
      children: [
        CNavBar(title: widget.navTitle, onBack: onBack),
        ..._buildEmailVerificationBody()
      ],
    );
  }

  List<Widget> _buildEmailVerificationBody() {
    return [EmailVerificationForm()];
  }
}
