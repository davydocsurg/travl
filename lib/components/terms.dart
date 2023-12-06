import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:travl/components/hero.dart';
import 'package:travl/utils/g_text.dart';

class Terms extends StatelessWidget {
  final String secTitle = 'Travl - Terms and Conditions';

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        title: secTitle,
        home: CupertinoPageScaffold(
          child: Column(
            children: [
              _buildHeroSection(),
              Column(
                children: _buildTermsBody(),
              ),
            ],
          ),
        ),
      );
    } else {
      return MaterialApp(
        title: secTitle,
        home: Scaffold(
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                    children: [_buildHeroSection(), ..._buildTermsBody()]),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildHeroSection() {
    return HeroSec(
        imagePath: 'images/landing-bg.jpeg',
        width: double.infinity,
        height: 250);
  }

  List<Widget> _buildTermsBody() {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Before you join',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  )),
              Text(
                  'Olio is all about connecting neighbours to share more, and waste less. Because strong local communities are critical for our planet, and our well-being.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text('Please agree to our community pledge:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    )),
              ),
              GText(
                  emoji: '💬',
                  title: 'Communication',
                  topPadding: 15,
                  desc: "Be clear, be polite, be friendly. Always."),
              GText(
                  emoji: '🕑',
                  title: 'Time',
                  topPadding: 15,
                  desc:
                      "Keep your commitments. No-shows are not cool & not tolerated."),
              GText(
                  emoji: '❤️',
                  title: 'Posts',
                  topPadding: 15,
                  desc:
                      "Keep them friendly, positive & constructive at all times."),
              GText(
                  emoji: '👧🏻 👽 🎃',
                  title: 'Inclusive',
                  topPadding: 15,
                  desc: "Olio is for everyone."),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                    'If you agree to stick by our rules, then come on in...',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    )),
              )
            ],
          ),
        ),
      )
    ];
  }
}
