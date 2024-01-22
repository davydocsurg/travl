import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travl/components/input.dart';
import 'package:travl/constants/index.dart';
import 'package:travl/models/user.dart';
import 'package:travl/screens/register.dart';
import 'package:travl/utils/c_button.dart';
import 'package:travl/utils/form_utils.dart';
import 'package:travl/utils/snackbar.dart';
import '../services/auth_service.dart';

class LoginForm extends StatefulWidget {
  final double inputSpacingTop = 35;

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
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

  void _handleLogin() async {
    final email = _email.text;
    final password = _password.text;

    setState(() => _loading = true);

    try {
      await AuthService().loginUser(email, password);

      setState(() => _loading = false);
      print(LOGIN_SUCCESS);
      showSuccessSnackBar(context, LOGIN_SUCCESS);
      FormUtils.clearFields([_email, _password]);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() => _emailError.value = USER_NOT_FOUND);
        showErrorSnackBar(context, _emailError.value);
        setState(() => _loading = false);
      } else if (e.code == 'wrong-password') {
        setState(() => _emailError.value = INCORRECT_CREDENTIALS);
        showErrorSnackBar(context, _emailError.value);
        setState(() => _loading = false);
      }
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
            child: CInput(
              labelText: 'Email',
              hintText: 'Enter your email',
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              errorMsg: _emailError.value,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: widget.inputSpacingTop),
            child: CInput(
              labelText: 'Password',
              hintText: '8+ characters',
              controller: _password,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
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
              child: _loading
                  ? CircularProgressIndicator()
                  : CButton(
                      text: 'Login',
                      onPressed: () => _handleLogin(),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text(
                      'Register here',
                      style: TextStyle(color: Colors.blue[900]!),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
