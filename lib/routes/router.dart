import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/notes/models/note_model.dart';
import '../features/notes/screens/add_note_screen.dart';
import '../features/notes/screens/notes_list_screen.dart';
import '../features/notes/screens/edit_note_screen.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: NotesListRoute.page, initial: true),
        AutoRoute(path: '/add', page: AddNoteRoute.page),
        AutoRoute(path: '/edit/:note', page: EditNoteRoute.page)
      ];
}
