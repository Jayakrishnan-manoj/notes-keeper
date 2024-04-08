import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:notes_keeper/routes/router.dart';
import 'package:notes_keeper/shared/DI/locator.dart';
import 'package:notes_keeper/shared/utils/colors.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'features/notes/services/notes_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await StreamingSharedPreferences.instance;
  final noteService = NotesService(prefs);
  setup(noteService);
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

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
      routerConfig: _appRouter.config(),
    );
  }
}
