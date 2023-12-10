import 'package:flutter/material.dart';

class PlainCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double? aspectRatio;

  PlainCard({
    required this.title,
    required this.subtitle,
    this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: aspectRatio ?? 2.3,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                Text(subtitle, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ));
  }
}

class ImageCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final double? aspectRatio;
  final Widget? button;
  final Widget? widget1;
  final Widget? widget2;
  final Widget? widget3;
  final Widget? widget4;
  final Widget? widget5;
  final Widget? widget6;

  ImageCard({
    required this.imagePath,
    required this.title,
    this.aspectRatio = 2.5,
    this.button,
    this.widget1,
    this.widget2,
    this.widget3,
    this.widget4,
    this.widget5,
    this.widget6,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> profileWidgets = [];
    if (widget1 != null) {
      profileWidgets.add(Column(children: [widget1!]));
    }
    if (widget2 != null) {
      profileWidgets.add(Column(children: [widget2!]));
    }
    if (widget3 != null) {
      profileWidgets.add(Column(children: [widget3!]));
    }

    List<Widget> stats = [];
    if (widget4 != null) {
      stats.add(Column(children: [widget4!]));
    }
    if (widget5 != null) {
      stats.add(Column(children: [widget5!]));
    }
    if (widget6 != null) {
      stats.add(Column(children: [widget6!]));
    }

    return AspectRatio(
        aspectRatio: aspectRatio!,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                        ),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      if (button != null)
                        Positioned.fill(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: button!,
                            ),
                          ),
                        ),
                    ],
                  )),
              SizedBox(width: 10),
              Expanded(
                flex: 7,
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 15, top: 15, bottom: 15),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 170), // Set the maximum width here
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: profileWidgets,
                            ),
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: 170), // Set the maximum width here
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: stats,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
