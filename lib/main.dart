import 'package:flutter/material.dart';
import 'package:notes_keeper/shared/utils/colors.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes Keeper",
      theme: ThemeData(fontFamily: 'Merriweather').copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
    );
  }
}
