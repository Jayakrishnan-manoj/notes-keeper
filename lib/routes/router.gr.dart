// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddNoteRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddNoteScreen(),
      );
    },
    NotesListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotesListScreen(),
      );
    },
    EditNoteRoute.name: (routeData) {
      final args = routeData.argsAs<EditNoteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditNoteScreen(
          key: args.key,
          note: args.note,
        ),
      );
    },
  };
}

/// generated route for
/// [AddNoteScreen]
class AddNoteRoute extends PageRouteInfo<void> {
  const AddNoteRoute({List<PageRouteInfo>? children})
      : super(
          AddNoteRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddNoteRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotesListScreen]
class NotesListRoute extends PageRouteInfo<void> {
  const NotesListRoute({List<PageRouteInfo>? children})
      : super(
          NotesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotesListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditNoteScreen]
class EditNoteRoute extends PageRouteInfo<EditNoteRouteArgs> {
  EditNoteRoute({
    Key? key,
    required NoteModel note,
    List<PageRouteInfo>? children,
  }) : super(
          EditNoteRoute.name,
          args: EditNoteRouteArgs(
            key: key,
            note: note,
          ),
          initialChildren: children,
        );

  static const String name = 'EditNoteRoute';

  static const PageInfo<EditNoteRouteArgs> page =
      PageInfo<EditNoteRouteArgs>(name);
}

class EditNoteRouteArgs {
  const EditNoteRouteArgs({
    this.key,
    required this.note,
  });

  final Key? key;

  final NoteModel note;

  @override
  String toString() {
    return 'EditNoteRouteArgs{key: $key, note: $note}';
  }
}
