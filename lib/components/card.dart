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

  ImageCard(
      {required this.imagePath,
      required this.title,
      this.aspectRatio = 3,
      this.button,
      this.widget1,
      this.widget2,
      this.widget3});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    if (widget1 != null) {
      widgets.add(Column(children: [widget1!]));
    }
    if (widget2 != null) {
      widgets.add(Column(children: [widget2!]));
    }
    if (widget3 != null) {
      widgets.add(Column(children: [widget3!]));
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
                          fit: BoxFit.cover,
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
                      const EdgeInsets.only(right: 20, top: 20, bottom: 20),
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
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: 170), // Set the maximum width here
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: widgets,
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
