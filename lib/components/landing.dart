import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import 'package:travl/utils/c_button.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        title: 'Travl App',
        home: CupertinoPageScaffold(
          child: Stack(
            children: _buildStackChildren(),
          ),
        ),
      );
    } else {
      return MaterialApp(
        title: 'Travl App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
          ),
        ),
        home: Scaffold(
          body: Stack(
            children: _buildStackChildren(),
          ),
        ),
      );
    }
  }

  List<Widget> _buildStackChildren() {
    return [
      // Background Image
      Image.asset(
        'images/landing-bg.jpeg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
      Container(
        color: Colors.black.withOpacity(0.5),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                'Travl',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Embark on a journey\nof endless possibilities.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Platform.isIOS
                    ? CupertinoButton.filled(
                        child: Text('Get Started'),
                        onPressed: () {},
                      )
                    : ElevatedButton(
                        child: Text('Get Started'),
                        onPressed: () {},
                      ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: CButton(
                  bgColor: Colors.blue,
                  color: Colors.white,
                  height: 50,
                  onPressed: () {},
                  text: 'Login',
                  width: 100,
                )),
          ],
        ),
      ),
    ];
  }
}
