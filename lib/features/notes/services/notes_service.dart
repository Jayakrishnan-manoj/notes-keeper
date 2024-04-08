import 'dart:async';
import 'dart:convert';

import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

import '../models/note_model.dart';

class NoteService {
  static const _notesKey = 'notes';
  final StreamingSharedPreferences _preferences;

  NoteService(this._preferences);

  // Retrieves all notes from SharedPreferences
  Stream<List<NoteModel>> getNotes() {
    final notesStream = _preferences.getStringList(_notesKey, defaultValue: []);
    return notesStream.map((noteStrings) => noteStrings
        .map((noteJson) => NoteModel.fromJson(json.decode(noteJson)))
        .toList());
  }

  // Adds a new note
  Future<void> addNote(String content) async {
    final notes = await getNotes().first;
    final newNote = NoteModel.generate(content);
    notes.add(newNote);
    await _saveNotes(notes);
  }

  // Removes a note
  Future<void> removeNote(String noteId) async {
    final notes = await getNotes().first;
    notes.removeWhere((note) => note.id == noteId);
    await _saveNotes(notes);
  }

  // Helper function to save notes to SharedPreferences
  // Helper function to save notes to SharedPreferences
  Future<void> _saveNotes(List<NoteModel> notes) async {
    final noteJsonList = notes.map((note) => note.toJson()).toList();
    final noteStringList =
        noteJsonList.map((noteJson) => json.encode(noteJson)).toList();
    await _preferences.setStringList(_notesKey, noteStringList);
  }
}
