import 'dart:async';
import 'dart:convert';

import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../models/note_model.dart';

class NotesService {
  final StreamingSharedPreferences _prefs;

  NotesService(StreamingSharedPreferences prefs) : _prefs = prefs;

  Future<void> saveNote(NoteModel note) async {
    final noteContent = note.content;
    await _prefs.setString(note.id!, noteContent);
  }

  // Future<void> saveNoteList(List<NoteModel> notes) async {
  //   // Convert list of notes to a list of JSON strings
  //   final noteJsonList =
  //       notes.map((note) => json.encode(note.toJson())).toList();
  //   // Save list of JSON strings to preferences
  //   await _prefs.setStringList('notes', noteJsonList);
  // }

  Future<List<NoteModel>> getNotes(List<NoteModel> notes) async {
    final keys = _prefs.getKeys();
    for (String key in keys.getValue()) {
      final noteContent = _prefs.getString(key, defaultValue: '');
      notes.add(NoteModel(id: key, content: noteContent.toString()));
    }
    return notes;
  }
}
