import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travl/components/hero.dart';
import 'package:travl/firebase_options.dart';
import 'package:travl/screens/home.dart';
import 'package:travl/screens/item_details.dart';
import 'package:travl/screens/landing.dart';
import 'package:travl/screens/login.dart';
import 'package:travl/screens/register.dart';
import 'package:travl/screens/terms.dart';
import 'package:travl/components/title.dart';
import 'package:travl/screens/verify_email.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ILanding()
      // Scaffold(
      //   body: Login(),
      // )
      ));
}

class ILanding extends StatelessWidget {
  final String secTitle = 'Travl';
  const ILanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: secTitle,
        home: Scaffold(
            body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, appSnapshot) {
            final user = FirebaseAuth.instance.currentUser;
            if (appSnapshot.connectionState == ConnectionState.waiting) {
              return Landing(); // Show a loading spinner while waiting
            } else {
              return StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Landing(); // Show a loading spinner while waiting
                  } else if (snapshot.hasData &&
                      user != null &&
                      user.emailVerified != false) {
                    return Home();
                  } else if (user != null && user.emailVerified == false) {
                    return EmailVerification();
                  } else {
                    return Register();
                  }
                },
              );
            }
          },
        )));
  }
}
