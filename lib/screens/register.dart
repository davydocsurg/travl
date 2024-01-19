import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travl/components/input.dart';
import 'package:travl/components/navbar.dart';
import 'package:travl/firebase_options.dart';
import 'package:travl/utils/c_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
  bool loading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String emailError = '';

  late final _firstName = TextEditingController();
  late final _lastName = TextEditingController();
  late final _email = TextEditingController();
  late final _password = TextEditingController();

  void showErrorSnackBar(String errorMsg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: DefaultTextStyle(
          style: TextStyle(
            color: Colors.white, // Set the text color
            fontSize: 16, // Set the text size
          ),
          child: Text(errorMsg),
        ),
        backgroundColor: Colors.red, // Set the background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Set the shape
        ),
      ),
    );
  }

  void showSuccessSnackBar(String successMsg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: DefaultTextStyle(
          style: TextStyle(
            color: Colors.white, // Set the text color
            fontSize: 16, // Set the text size
          ),
          child: Text(successMsg),
        ),
        backgroundColor: Colors.green, // Set the background color to green
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Set the shape
        ),
      ),
    );
  }

  void emailListener() {
    if (emailError.isNotEmpty && _email.text.isNotEmpty) {
      setState(() {
        emailError = '';
      });
    }
  }

  void clearFields() {
    _firstName.clear();
    _lastName.clear();
    _email.clear();
    _password.clear();
  }

  void handleRegister() async {
    final email = _email.text;
    final password = _password.text;
    final firstName = _firstName.text;
    final lastName = _lastName.text;

    setState(() {
      loading = true;
      emailError = '';
    });

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('\x1B[32m$credential\x1B[0m');
      await FirebaseAuth.instance.currentUser!.updateDisplayName(
        '$firstName $lastName',
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set(
        {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'createdAt': DateTime.now(),
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          emailError = 'An account with this email already exists.';
        });
        showErrorSnackBar(emailError);
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        loading = false;
      });
      showSuccessSnackBar('User registered successfully ✔');
      clearFields();
    }
  }

  @override
  void initState() {
    super.initState();

    // Initialize your TextEditingControllers here if not already done

    // Add listener to _email TextEditingController
    _email.addListener(emailListener);

    // Add similar listeners for other TextEditingControllers if needed
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
    _email.removeListener(emailListener);
    super.dispose();
  }

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
    return [
      Padding(
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
                errorMsg: emailError,
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
                child: loading
                    ? CircularProgressIndicator()
                    : CButton(
                        text: 'Register',
                        onPressed: () => handleRegister(),
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
