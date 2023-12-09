import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onBack;
  final List<Widget>? actions;

  CNavBar({this.title, this.onBack, this.actions});

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS || kIsWeb) {
      return CupertinoNavigationBar(
        middle: Text(title ?? ''),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onBack,
          child: Icon(CupertinoIcons.back),
        ),
        trailing: actions != null ? Row(children: actions!) : null,
      );
    } else {
      return AppBar(
        title: Text(
          title ?? '',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white, // Set the background color to white
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color:
                  Colors.black), // Set the icon color to black for visibility
          onPressed: onBack,
        ),
        actions: actions,
      );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
