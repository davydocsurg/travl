import 'package:flutter/material.dart';

class FormUtils {
  static void clearFields(List<TextEditingController> controllers) {
    for (var controller in controllers) {
      controller.clear();
    }
  }

  static void addFieldListener(
      TextEditingController controller, ValueNotifier<String> errorNotifier) {
    controller.addListener(() {
      if (errorNotifier.value.isNotEmpty && controller.text.isNotEmpty) {
        errorNotifier.value = '';
      }
    });
  }
}
