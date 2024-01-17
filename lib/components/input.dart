import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;

  CInput({
    required this.hintText,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
  });

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS || kIsWeb) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText),
          CupertinoTextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            placeholder: hintText,
            enableSuggestions: enableSuggestions,
            autocorrect: autocorrect,
            decoration: BoxDecoration(
              border: Border.all(
                color: CupertinoColors.inactiveGray,
                width: 0.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ],
      );
    } else {
      return TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      );
    }
  }
}
