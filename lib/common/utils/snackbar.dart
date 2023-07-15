import 'package:flutter/material.dart';

class Snackabar {
  static showSnackbar( 
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
