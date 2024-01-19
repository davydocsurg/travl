import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:travl/components/input.dart';
import 'package:travl/constants/index.dart';
import 'package:travl/models/user.dart';
import 'package:travl/utils/c_button.dart';
import 'package:travl/utils/form_utils.dart';
import 'package:travl/utils/snackbar.dart';
import '../services/auth_service.dart';

class RegisterForm extends StatefulWidget {
  final double inputSpacingTop = 35;

  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool switchValue = false;
  bool _loading = false;
  String _emailError = '';

  void _handleRegister() async {
    final userModel = UserModel(
      firstName: _firstName.text,
      lastName: _lastName.text,
      email: _email.text,
      password: _password.text,
    );
    final password = _password.text;

    setState(() => _loading = true);

    try {
      await AuthService().registerUser(userModel, password);
      // Handle successful registration
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        setState(
            () => _emailError = 'An account with this email already exists.');
        showErrorSnackBar(context, _emailError);
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() => _loading = false);
      // ignore
      showSuccessSnackBar(context, REGISTER_SUCCESS);
      FormUtils.clearFields([_firstName, _lastName, _email, _password]);
//       final prefs = await SharedPreferences.getInstance();
// await prefs.setString('credential', credential.toString());
    }
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
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
          CInput(
            labelText: 'First Name',
            hintText: 'Enter your first name',
            controller: _firstName,
            keyboardType: TextInputType.text,
          ),
          Padding(
            padding: EdgeInsets.only(top: widget.inputSpacingTop),
            child: CInput(
              labelText: 'Last Name',
              hintText: 'Enter your last name',
              controller: _lastName,
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: widget.inputSpacingTop),
            child: CInput(
              labelText: 'Email',
              hintText: 'Enter your email',
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              errorMsg: _emailError,
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
                      text: 'Register',
                      onPressed: () => _handleRegister(),
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
                  Text('Login here', style: TextStyle(color: Colors.blue[900]!))
                ],
              ))
        ],
      ),
    );
  }
}
