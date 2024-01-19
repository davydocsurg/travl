import 'package:flutter/material.dart';

void showErrorSnackBar(context, String errorMsg) {
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

void showSuccessSnackBar(context, String successMsg) {
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
