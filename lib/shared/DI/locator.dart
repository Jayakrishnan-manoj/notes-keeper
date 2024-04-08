import 'package:get_it/get_it.dart';
import 'package:notes_keeper/shared/providers/notes_provider.dart';

import '../../features/notes/services/notes_service.dart';

final locator = GetIt.instance;

void setup(NoteService service) {
  locator.registerSingleton(NotesProvider(service));
}
