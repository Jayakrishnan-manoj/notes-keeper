import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_keeper/features/notes/screens/notes_list_screen.dart';
import 'package:notes_keeper/shared/utils/colors.dart';

void main() {
  runApp(NotesApp());
}

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes Keeper",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Merriweather').copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: kBackgroundColor,
          ),
        ),
      ),
      home: NotesListScreen(),
    );
  }
}
