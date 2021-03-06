import 'package:flutter/material.dart';

showToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message), backgroundColor: Color.fromARGB(255, 0, 0, 0)));
}
