import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travl/components/input.dart';
import 'package:travl/constants/index.dart';
import 'package:travl/screens/register.dart';
import 'package:travl/utils/c_button.dart';
import 'package:travl/utils/form_utils.dart';
import 'package:travl/utils/snackbar.dart';
import '../services/auth_service.dart';

class EmailVerificationForm extends StatefulWidget {
  final double inputSpacingTop = 35;

  @override
  EmailVerificationFormState createState() => EmailVerificationFormState();
}

class EmailVerificationFormState extends State<EmailVerificationForm> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool switchValue = false;
  bool _loading = false;
  ValueNotifier<String> _emailError = ValueNotifier<String>('');
  void emailListener() {
    if (_emailError.value.isNotEmpty && _email.text.isNotEmpty) {
      setState(() {
        _emailError.value = '';
      });
    }
  }

  void _handleVerifyEmail() async {
    final user = FirebaseAuth.instance.currentUser;

    setState(() => _loading = true);

    try {
      await user?.sendEmailVerification();
      print(SEND_VERIFICATION_EMAIL_SUCCESS);
      showSuccessSnackBar(context, SEND_VERIFICATION_EMAIL_SUCCESS);
      setState(() => _loading = false);
      Navigator.of(context).pushReplacementNamed('/login', arguments: user);
    } on FirebaseAuthException catch (e) {
      showErrorSnackBar(context, e.message!);
      setState(() => _loading = false);
    } catch (e) {
      print(e);
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    FormUtils.addFieldListener(_email, _emailError);
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 20, top: 40),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: widget.inputSpacingTop),
            child: Text(
              'Please verify your email address',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // CInput(
          //   labelText: 'Email',
          //   hintText: 'Enter your email',
          //   controller: _email,
          //   enableSuggestions: false,
          //   autocorrect: false,
          //   keyboardType: TextInputType.emailAddress,
          //   errorMsg: _emailError.value,
          // ),
          Padding(
              padding: const EdgeInsets.only(top: 40),
              child: _loading
                  ? CircularProgressIndicator()
                  : CButton(
                      text: 'Send Verification Email',
                      onPressed: () => _handleVerifyEmail(),
                      width: double.infinity,
                      height: 50,
                      color: Colors.white,
                      bgColor: Colors.blue[800]!)),
        ],
      ),
    );
  }
}
