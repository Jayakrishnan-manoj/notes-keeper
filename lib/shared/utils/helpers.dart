import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String content, Color snackbarColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: snackbarColor,
    ),
  );
}
